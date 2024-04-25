C:\TornadoAlley\main\c1\game\lua\memdb.lua------------------------------------------------------------------------------
--   Owner(s): Scott Bilas
-- $Copyright: $
--        $Id: //depot/lcs/ta/main/c1/game/lua/memdb.lua#3 $
------------------------------------------------------------------------------

-- TODO notes
-- table and other gc refs + strings - convert to an index instead of mem addr for easier matching
-- do not separate single-ref tables from multi-ref
-- 	  first instance found = its "global name"
--	  enum certain table trees first to make sure they get the first instance (like classes)
-- two pass: first collects all data into dump structures and ref counts etc, second does the reporting
-- print truncated, \n-removed, compacted string for each
-- get environment for everything that could have it and include in the walk along with metatable
-- store in the value part of the 'all' table a table with full name (including mt/env to get there), ref count...
-- look at userdata and associate with a 'go'

if buildconfig.isrelease then
	return
end

------------------------------------------------------------------------------
-- Class: memdb

ensurechild("memdb")

-- metatable = self
memdb.__index = memdb

function memdb:new(exclude)

	-- do a collect to compact things, then ask lua how much mem it thinks we're using
	collectgarbage('collect')
	local luabytes = math.ceil(collectgarbage('count') * 1024)

	-- let's get the string array right now, before any more get added by the act of collecting
	local globalstrings = lcsext.stringarray()

	-- we're about to use a ton of memory, make sure we're in preview mode
	if rawget(_G, 'modvalsmgr') then
		flag.production.gameplay.enable.worldpreviewmode = true
	end

	-- default params
	exclude = exclude or {}

	-- make sure we're always excluded
	table.insert(exclude, self)

	-- init members
	local o = setmetatable(
		{
			luabytes = luabytes,
			exclude = table.fromarray(exclude),		-- skip these objects when collecting
			objects = {},  	 					   	-- this holds all objects we've collected
			typecrcs = {},							-- holds crc's of objects per-type (where applicable)
			typestats = {},							-- holds totals of stats per-type
			typecounts = {},	  	 		   		-- holds counts of all objects types we've collected (for serials)
			globalstrings = globalstrings, 		   	-- all strings in the global lua string table pre-collect
		},
		self)

	-- add string stats
	local globalstringbytes = 0
	for _, v in ipairs(globalstrings) do
		globalstringbytes = globalstringbytes + #v
	end
	o.typestats.globalstring = { totalallocbytes = globalstringbytes }
	o.typecounts.globalstring = #globalstrings

	return o
end

function memdb:add(obj, name, parent, iskey)

	-- check params
	if not obj then return end
	if self.exclude[obj] then return end
	name = name or '<unnamed>'

	local link = self.objects[obj]
	if not link then

		local objt = type(obj)

		-- accumulate stats
		local stats = lcsext.memstats(obj)
		local totalallocbytes = 0
		if stats then

			-- get size of this object and give credit to parent as well
			totalallocbytes = stats.totalallocbytes
			local p = parent
			while p do
				p.subtreesize = p.subtreesize + totalallocbytes
				p = p.parent
			end

			local typestats = self.typestats[objt]
			if typestats then
				for k, v in pairs(stats) do
					if typestats[k] then typestats[k] = typestats[k] + v end
				end
			else
				typestats = {}
				self.typestats[objt] = typestats
				for k, v in pairs(stats) do
					if string.sub(k, -3) ~= 'crc' then typestats[k] = v end  -- crc's don't make sense in totals
				end
			end

			local crcname, sizename
			if objt == 'function' then
				crcname = 'codecrc'
				sizename = 'codeallocbytes'
			elseif objt == 'table' then
				crcname = 'shallowcrc'
				sizename = 'totalusedbytes'
			end

			if crcname ~= nil and stats[sizename] > 0 then
				local typecrcs = self.typecrcs[objt] or {}
				self.typecrcs[objt] = typecrcs

				local objcrc = typecrcs[stats[crcname]]
				if objcrc == nil then
					objcrc = { size = stats[sizename], objects = {} }
					typecrcs[stats[crcname]] = objcrc
				end

				assert(objcrc.size == stats[sizename])
				table.insert(objcrc.objects, obj)
			end
		end

		-- get a serial
		local count = (self.typecounts[objt] or 0) + 1
		self.typecounts[objt] = count
		local serial = count - 1

		-- keys need to construct a name
		if iskey then
			name = name..'{'..objt:sub(1, 1)..serial..'}'
		end

		-- add to db
		link =
			{
				obj			= obj,				-- the actual object
				name		= name,				-- its (full) name
				refs		= 1,				-- ref count globally among what we walk
				serial		= serial,			-- serial assigned per-type
				stats		= stats,			-- stats for this type (from lcsext.memstats)
				parent		= parent,			-- owner of this object (nil if a root)
				size		= totalallocbytes,	-- total size of this object
				subtreesize	= 0,				-- this will accumulate bytes alloc'd for all children
			}
		self.objects[obj] = link

		-- process children
		if objt == 'table' then
			for k, v in pairs(obj) do
				if (type(k) == 'number') or (type(k) == 'boolean') then
					self:add(v, name .. '[' .. lcsext.rawtostring(k) .. ']', link)
				elseif type(k) == 'string' then
					self:add(v, name .. '.' .. lcsext.rawtostring(k), link)
				else
					local kobj = self:add(k, name, link, true)		-- add the key
					self:add(v, kobj.name, link)	   				-- add the value
				end
			end
		end
	else
		-- increment ref in db
		link.refs = link.refs + 1
	end

	-- process metatable
	local mt = debug.getmetatable(obj)
	if mt then self:add(mt, name .. '->mt', link) end

	-- process environment
	local env = debug.getfenv(obj)
	if env then self:add(mt, name .. '->env', link) end

	return link
end

function memdb:report(options)
	options = options or {}

	local db = table.valuestoarray(self.objects)

	-- use this to sort categories. these come first, in this order
	local typeorder = { 'table', 'function' }
	for i, k in ipairs(typeorder) do typeorder[k] = i end

	table.sort(db,
		function(a, b)
			local at, bt = type(a.obj), type(b.obj)

			-- maybe sort by size first
			if options.sort == 'size' then
				if a.stats and a.stats.totalallocbytes ~= nil and b.stats and b.stats.totalallocbytes ~= nil then
					return a.stats.totalallocbytes > b.stats.totalallocbytes
				elseif a.stats and a.stats.totalallocbytes ~= nil then return true
				elseif b.stats and b.stats.totalallocbytes ~= nil then return false
				end
			end

			-- by type?
		 	if at ~= bt then
				local ati, bti = typeorder[at], typeorder[bt]
				if ati and bti then return ati < bti
				elseif ati then return true
				elseif bti then return false
				else return at < bt
				end
			else
				-- fall back to name-sort
				return a.name < b.name
			end
		end)

	-- get sizeof(Table)
	local dummytest = lcsext.memstats({})
	local mintablesize = dummytest.totalallocbytes - dummytest.arrayallocbytes - dummytest.hashallocbytes

	-- walk all objects
	if options.dumpobjects or options.dumpall then
		print()
		print("OBJECTS:")
		print("--------")
		print()
	end
	for _, v in ipairs(db) do
		if typeutils.isreftype(v.obj) and not lcsext.iscfunction(v.obj) then
			local text = v.name..': '..type(v.obj)

			local stats = lcsext.memstats(v.obj)
			if stats and stats.totalallocbytes then
				text = text .. ' ('
				if type(v.obj) == 'table' then
					text = text ..
						'#' .. (stats.arrayusedcount + stats.hashusedcount) .. ' ' ..
						(stats.arrayusedbytes + stats.hashusedbytes + mintablesize) .. '/'
				end
				text = text .. stats.totalallocbytes .. ' bytes)'
			end

			if v.refs > 1 then text = text .. ' x' .. lcsext.rawtostring(v.refs) .. ' refs' end

			if options.dumpobjects or options.dumpall then
				print(text)
			end
		end
	end

	-- walk all trees (tables)
	if options.dumptrees or options.dumpall then
		print()
		print("TREES:")
		print("------")
		print()

		-- first find all the roots
		local roots = {}
		for _, v in ipairs(db) do
			if v.parent == nil then
				table.insert(roots, v)
			end
		end

		-- walkin' function
		local function walker()
		end

		-- ok now walk 'em
		for _, v in ipairs(roots) do
			print(v.name..': '..(v.size + v.subtreesize))
		end
	end

	-- dump string table
	if options.dumpstrings or options.dumpall then
		print()
		print("GLOBAL STRING TABLE:")
		print("--------------------")
		print()

		table.sort(self.globalstrings,
			function(a, b)
				if (#a == #b) or (options.sort ~= 'size') then
		            return a < b
				else
					return #a > #b
				end
		    end)

		for _,v in ipairs(self.globalstrings) do
			local text = string.gsub(v, '\n', ' ')  -- gsub returns x,y so don't want to print it directly
			print(text)
		end
	end

	print()
	print("DUPLICATION:")
	print("------------")
	print()

	for kt, vt in pairs(self.typecrcs) do
		local bytes = 0
		local count = 0
		for _, v in pairs(vt) do
			if #v.objects > 1 then
				bytes = bytes + (v.size * (#v.objects - 1))
				count = count + 1
			end
		end
		print(kt..'s: '..math.ceil(bytes/1024)..' KB ('..count..' sets of dups)')

		if options.dumpdups or options.dumpall then
			for _, vd in pairs(vt) do
				if #vd.objects > 1 then
					local text = ''
					for _, vo in ipairs(vd.objects) do
						if text ~= '' then text = text..', ' end
						text = text..self.objects[vo].name
					end
					local sizekb = math.ceil((vd.size * #vd.objects) / 1024)
					print('    '..vd.size..'B x'..#vd.objects..' = '..sizekb..'KB: '..text)
				end
			end
		end
	end

	print()
	print("OVERALL TOTALS:")
	print("---------------")
	print()

	local totalallocbytes = 0
	for kt, vt in pairs(self.typestats) do
		totalallocbytes = totalallocbytes + vt.totalallocbytes
		print(kt..'s: (#'..self.typecounts[kt]..')')
		for _, k in ipairs(table.sortedkeys(vt)) do
			print('    '..k..'='..vt[k])
		end
		if kt == 'table' then
			local usedbytes = vt.arrayusedbytes + vt.hashusedbytes + (mintablesize * self.typecounts.table)
			local usedpercent = math.floor(10000 * usedbytes / vt.totalallocbytes) / 100
			print('    unusedbytes='..(vt.totalallocbytes - usedbytes))
			print('    usedpercent='..usedpercent..'%')
		end
		print()
	end

	print("Total Gathered Bytes: "..math.ceil(totalallocbytes/1024).." KB")
	print("Total Lua-Reported Bytes: "..math.ceil(self.luabytes/1024).." KB")
end

function memdb:findowner(obj)

end

------------------------------------------------------------------------------