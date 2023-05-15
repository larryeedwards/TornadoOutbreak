--   Owner(s): Scott Bilas
-- $Copyright: $
--        $Id: //depot/lcs/ta/main/c1/game/lua/luamgr.lua#4 $
--
-- IMPORTANT: do not modify this file without talking to Scott first!! This
-- code is very closely tied to LuaMgr.cpp and one small mistake could cause
-- some really hard to debug problems!
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Module: luamgr

-- systems
ensurechild("envs")
ensurechild("fuse")
ensurechild("classes")
ensurechild("enums")

-- for perf
local execcallback = luamgr.executecallback

-- temp db's
luamgr.scriptdb = {}

-- converts a name to lua conventions (lowercase) and checks that it's a legal
-- name as well.
--
function luamgr.convertname(name)
	if string.sub(name, 1, 1) == "_" then
		error("Names exported to Lua cannot start with an underscore ('_') - bad name is '%s'", name)
		return nil
	end
	return string.lower(name)
end

-- this is called by CLuaMgr during startup to register every fuse export
-- in the global 'fuse' table. does it hierarchically by fuse command name,
-- so the fuse command report.logline ends up as the 'logline' function in
-- the 'fuse.report' table.
--
function luamgr.registerfuseexport(name, fusecommand)
	name = luamgr.convertname(name)
	setnewvar(fuse, name,
		function(...) luamgr.executefuseexport(fusecommand, ...) end)
end

-- this is called by CLuaMgr during startup to register every singleton
-- table. just installs the class's metatable into the global space. the
-- actual callbacks are registered after this, filling up the empty class
-- tables we're creating here.
function luamgr.registersingleton(classname, parentclassname, singletonname)
	classname = luamgr.convertname(classname)
	parentclassname = parentclassname and luamgr.convertname(parentclassname)
	singletonname = luamgr.convertname(singletonname)
	local class = { _singleton=true, _parent=parentclassname }
	rawsetnew(classes, classname, class, "global class") -- register in class table
	rawsetnew(_G, singletonname, setmetatable({}, class), "singleton") -- register as a singleton
end

local function nomodify(classname, table, key, value)
	local class = getmetatable(table)
	if class._getters and class._getters[key] then
		syserror(format("Property '%s' in class '%s' is read-only!", key, classname), 2)
	elseif class[key] then
		syserror(format("Can't modify method '%s' of class '%s'", key, classname), 2)
	else
		syserror(format("Can't modify class '%s' (trying to add member '%s')", classname, key), 2)
	end
end

-- this is called by CLuaMgr during startup to register every exported
-- enum and value.
function luamgr.registerenum(enumname, valuetable)
	-- convert to lowercase, drop the 'e'
	enumname = luamgr.convertname(enumname)
	if enumname:sub(1, 1) ~= 'e' then
		die("Illegal enum name '%s' - must start with E!", enumname)
	end
	enumname = enumname:sub(2)

	-- build new table with lowercased names and lookups both directions
	local enum = {}
	for k, v in pairs(valuetable) do
		local valuestr = luamgr.convertname(k)
		enum[valuestr] = v
		enum[v] = valuestr
	end

	-- utility functions
	enum.tostring = function(e) return enum[e] end

	-- mt functions
	enum.__index = enum
	enum.__newindex = function(...) nomodify(enumname, ...) end
	enum.__metatable = enum.__metatable

	-- register
	rawsetnew(enums, enumname, enum, "global enum")
	rawsetnew(_G, enumname, setmetatable({}, enum), "enum")
end

-- this is used to call a lua c callback that takes default params. we can
-- leave out some of the last params and lua will fill in with defaults it
-- got from function registration.
local function callwithdefaults(classname, methodname, needsthisptr, numparams, defaults, isnotify, callback, ...)

	-- adjust counts based on call
	if needsthisptr then numparams = numparams+1 end    -- 'this' is the first param
	if isnotify then numparams = numparams-1 end        -- the 'notify' param is not considered as part of defaults

	-- figure out what's missing
	local numargs = select('#', ...)
	local missing = numparams - numargs
	local numdefaults = #defaults

	if missing > numdefaults then
		die("Not enough parameters, even with defaults")
	elseif missing > 0 then
		-- insert the missing parameters
		local args = {...}
		local offset = numdefaults - missing
		for i = 1, missing do
			table.insert(args, i + numargs, defaults[i + offset])
		end
		if isnotify then
			return execcallback(getmetatable(getfenv(0)).go, callback, unpack(args, 1, numparams))
		else
			return execcallback(callback, unpack(args, 1, numparams))
		end
	else
		-- cool, we can just call it as is
		if isnotify then
			return execcallback(getmetatable(getfenv(0)).go, callback, ...)
		else
			return execcallback(callback, ...)
		end
	end
end

-- this is called by CLuaMgr during startup to register every callback. each
-- is stored as 'classes.class.method'.
--
function luamgr.registercallback(classname, methodname, needsthisptr, numparams, numreturns, optionsstr, isnotify, callback)

	-- clean up params
	classname = luamgr.convertname(classname)
	methodname = luamgr.convertname(methodname)

	-- get options
	local options = {}
	if optionsstr then
		for _, option in pairs(optionsstr:split(';')) do
			option = option:split('=')
			if not option[2] then
				die("Illegal options string '%s' for %s.%s expecting 'a=b;c=d' format", optionsstr, classname, methodname)
			end
			options[option[1]] = option[2]
		end
	end

	-- build the function
	local method
	if options.defaults then
		-- convert nil to NIL so it gets our special placeholder
		options.defaults = string.gsub(options.defaults, "%w+",
				function(str)
					if str=='nil' then str = 'NIL' end
					return str
				end)
		local defaults = loadstring("return {"..options.defaults.."}")()
		method = function(...) return callwithdefaults(classname, methodname, needsthisptr, numparams, defaults, isnotify, callback, ...) end
	elseif isnotify then
		method = function(...) return execcallback(getmetatable(getfenv(0)).go, callback, ...) end
	else
		method = function(...) return execcallback(callback, ...) end
	end

	-- register the callback
	setnewvar(classes, classname .. "." .. methodname, method)

	-- remember the name of the class (for error reporting)
	classes[classname]._name = classname

	-- $$ future: support a type "indexer" that adds to _indexers table in a
	-- general way what i'm doing with 'children' works.

	-- postprocess option 'type'
	if options.type == "getter" then
		if (string.sub(methodname, 1, 3) == "get") and (numparams == 0) and (numreturns ~= 0) then
			setnewvar(classes, classname .. "._getters." .. string.sub(methodname, 4),
				classes[classname][methodname])
		else
			error("Bad format for getter '%s:%s' - must start with 'get', take no params, and return one or more values", classname, methodname)
		end
	elseif options.type == "setter" then
		if (string.sub(methodname, 1, 3) == "set") and (numparams == 1) then
			setnewvar(classes, classname .. "._setters." .. string.sub(methodname, 4),
				classes[classname][methodname])
		else
			error("Bad format for setter '%s:%s' - must start with 'set' and take one param", classname, methodname)
		end
	elseif options.type and options.type ~= "normal" then
		error("Unexpected callback type '%s'", options.type)
	end

end

-- this is called by CLuaMgr during startup to register every go class. a
-- parent id of -1 means it's the root.
--
goclassids = {}
goclasstoparentids = {}
function luamgr.registergoclass(classname, classid, parentclassid)
	classname = luamgr.convertname(classname)
	ensurechild(classes, classname)
	classes[classname]._name = classname
	classes[classname]._id = classid
	goclassids[classid] = classname
	goclasstoparentids[classname] = parentclassid
end

local function gogetcanwait(mt)
	if mt.thread and coroutine.status(mt.thread) == 'running' then
		return true
	else
		return false
	end
end

local function gobeginwait(mt)
	if mt.thread then
		if coroutine.status(mt.thread) == 'running' then
			mt.waitdepth = mt.waitdepth and mt.waitdepth + 1 or 1
		else
			syserror(format("Illegal recursion! Can't wait while this script is already waiting. You smoking some crazy.\n\nContext = %s\n\nWaiting thread stack:\n%s",
				mt.go, luamgr.stackdump(mt.thread, 0, true)), 1)
		end
	else
		die("Waiting has no effect when not in a thread - something weird going on?\n\nContext = %s", mt.go)
	end
end

local function goendwait(mt)
	if mt.waitdepth then
		mt.waitdepth = mt.waitdepth - 1
		if mt.waitdepth == 0 then
			coroutine.yield()
		end
	else
		die("What you say? You wait end with no begin??")
	end
end

-- table of special utility functions for go's
--
local goenvutils = {
		pause = function(mt, ...)
				gobeginwait(mt)
				luamgr.pause(mt.go, ...)
				goendwait(mt)
			end,
		beginwait = gobeginwait,
		endwait = goendwait,
		clearwaits = function(mt)
				mt.waitdepth = nil
				mt.go:clearwaits()
			end,
		getcanwait = gogetcanwait,
		settimer = function(mt, ...)
				timers.set(mt.go, ...)
			end,
		killtimer = function(mt, ...)
				timers.kill(mt.go, ...)
			end,
		wait = goendwait,   -- special: 'wait' implicitly calls beginwait on lookup, so the call to wait() should result in endwait
	}
goenvutils.killtimers = goenvutils.killtimer -- alias (may be more clear)

-- this is the smartypants lookup function that fakes c++ style scopes,
-- implicit 'this' and fallback to global.
--
local function goenvindex(table, key)
	local v = rawget(table, key)    -- try local environment
	if v ~= nil then return v end
	local mt = getmetatable(table)
	v = goenvutils[key]             -- special: try goenv utility table
	if v ~= nil then
		if key == 'wait' then gobeginwait(mt) end   -- the lookup opens the wait, then the args passed set up the notifies, then the wait function itself closes the wait
		return function(...) return v(mt, ...) end
	end
	v = mt.go[key]                  -- try 'this'
	if v ~= nil then
		if type(v) == 'function' then -- have to pass in 'this'
			return function(...) return v(mt.go, ...) end
		else
			return v
		end
	end
	return rawget(mt._G, key)       -- fall back to global (using raw access to avoid errors we don't want from global __index)
end

-- smartypants setter. look up local env, if not there then try 'this',
-- then if not there just set it in the local env. if it turns out to
-- be a getter then give an error to avoid stupid mistakes.
--
local function goenvnewindex(table, key, value)
	local v = rawget(table, key)      -- try local environment
	if v ~= nil then
		rawset(table, key, value)       -- already in env, just set it
	else
		local mt = getmetatable(table)
		local setters = rawget(mt.class, "_setters")
		if setters ~= nil then
			local setter = setters[key]
			if setter then
				setter(mt.go, value)        -- it's a setter, just call it
			else
				local getters = rawget(mt.class, "_getters")
				if getters and getters[key] then
					error("Can't assign to read-only property '%s' of Go type '%s'", key, mt.class._name)
				else
					rawset(table, key, value) -- set new var in local env
				end
			end
		else
			rawset(table, key, value)     -- set new var in local env
		end
	end
end

-- this is called from c++ on loading a game object to install its custom
-- lua scripts.
--
-- $$ future: install script and chunkname into the environment so we can
-- recompile and reload through fuse on the fly.
--
function luamgr.loadgo(go, ...) -- returns index of environment

	-- build the environment - note that we preinstall 'this' and 'env'
	local envindex = #envs + 1
	local env = { this = go }
	env.env = env
	local envmt = {
			go          = go,
			class       = getmetatable(go),
			_G          = getfenv(0),
			__index     = goenvindex,
			__newindex  = goenvnewindex,
		}

	-- give the environment its mt, install it
	envmt.__metatable = envmt
	envs[envindex] = setmetatable(env, envmt)

	-- for each paths+script pair
	local scripts = {...}
	for ilevel = 1, #scripts, 3 do

		-- load in each of our scripts and install them into the custom environment
		local filename = scripts[ilevel]
		local refid    = scripts[ilevel+1]
		local script   = scripts[ilevel+2]

		-- make 1-based for array storage (-1 means "uncached"; for testing only)
		if refid ~= -1 then refid = refid + 1 end

		-- mem-optimized builds don't use this
		if buildconfig.ismemoptimized then filename = "" end

		-- utility function for error reporting
		local function goerror(type, msg)
			error("%s error in script attached to %s '%s' from '%s' (inheritance level %d):\n\n%s",
				type, go:getclassname(), go:getname() or "<NO NAME>", filename, (ilevel+1) / 2, msg)
		end

		-- lookup/compile func
		local func
		if script ~= '' then
			-- compile the script
			local err
			func, err = loadstring(script, filename)
			if func then
				if refid ~= -1 then
					table.insert(luamgr.scriptdb, func)
					assert(luamgr.scriptdb[refid] == func)  -- the next index should have matched refid
				end
			else
				goerror("Compile error", err)
			end
		elseif refid ~= -1 then
			func = luamgr.scriptdb[refid]
			assert(func ~= nil)
		end

		-- attach to go's environment
		if func then

			-- remember parent in 'super' table
			if ilevel ~= 1 then
				local super = {}
				for k, v in pairs(env) do super[k] = v end
				env.super = super
			end

			-- call the script to install functions into the environment, run startup code etc
			setfenv(func, env)
			local status, err = xpcall(func, debug.traceback)
			if not status then
				goerror("Init execution", err)
			end

			-- now do some checking on what got installed
			for k, v in pairs(env) do
				if string.lower(string.sub(k, 1, 3)) == "on_" then
					if type(v) ~= "function" then
						goerror("Naming convention",
								format("Any 'on_' variables must be functions for event handling, not objects of type '%s' (name is '%s')", type(v), k))
					elseif not luamgr.goeventnames[k] then
						goerror("Illegal event",
								format("Function '%s' is not a valid event name", k))
					end
				end
			end
		end
	end

	-- return the environment index for c++ to hang onto for future calls into lua
	return envindex
end

-- called after all lua startup completed, all types registered, all splines
-- reticulated, etc.
--
function luamgr.poststartup()

	-- swap it over to our own version
	syserror = luamgr.die

	-- add in some niceness
	classes.cgo.__tostring = function(go) return format("'%s' [%s]", go.name, go.classname)  end
	classes.cgo.__eq = function(a, b) return luamgr.isequal(a, b) end

	-- set up the go hierarchy
	for k, v in pairs(goclasstoparentids) do
		classes[k]._parent = classes[goclassids[v]]
	end

	-- set up any remaining parent-child relationships
	for k, v in pairs(classes) do
		if type(v._parent) == "string" then
			local parent = classes[v._parent]
			if not parent then die("Can't find parent class of %s named '%s'", k, v._parent) end
			v._parent = parent
		end
	end

	-- this copies entries from the parent to the child if not overridden in the child
	local function shallowcopy(child, parent)
		if child == parent then return end
		if parent == nil then return end
		for k, v in pairs(parent) do
			if child[k] == nil then child[k] = v end
		end
	end

	-- this recursively flattens a class up through its parents
	local function flatten(class)
		if class._flattened then return end
		local parent = class._parent
		if parent then
			flatten(parent)
			shallowcopy(class, parent)
			shallowcopy(class._getters, parent._getters)
			shallowcopy(class._setters, parent._setters)
		end
		class._flattened = true
	end

	-- make sure all classes are flattened (this hits all classes including singletons)
	for k, v in pairs(classes) do
		flatten(v)
	end

	-- postprocess all classes
	for k, v in pairs(classes) do

		local index, newindex

		local findchild = rawget(v, "findchild")
		local getters = rawget(v, "_getters")
		local setters = rawget(v, "_setters")

		if getters or findchild then
			index = function(table, key)
					if findchild and key == "children" then   -- special support for 'children' virtual table
						return setmetatable({}, {
							__index = function(_, key)
									return findchild(table, key)
								end })
					end
					if getters then
						local getter = getters[key]
						if getter then return getter(table) end -- try getters first (note that singleton methods will still get the table as first param, but will ignore)
					end
					local member = v[key]
					if member ~= nil then return member end   -- fall back to the class
					if getters and setters and setters[key] then
						syserror(format("Property '%s' in class '%s' is write-only!", key, k), 2)
					end
				end
		else
			index = v -- mt contains all class methods
		end

		if setters then
			newindex = function(table, key, value)
					local setter = setters[key]
					if setter then
						if v._singleton then
							setter(value)   -- have to leave off the preceding 'this' which singleton does not want
						else
							setter(table, value)
						end
					else
						nomodify(k, table, key, value)
					end
				end
		else
			newindex = function(...) nomodify(k, ...) end
		end

		rawset(v, "__index", index)
		rawset(v, "__newindex", newindex)
		rawset(v, "__metatable", v.__metatable) -- once any object gets a class mt it's permanent

	end

	-- don't need these any more
	goclassids = nil
	goclasstoparentids = nil

	-- set up gomgr lookup db helpers
	rawset(gomgr, "db", setmetatable({},
		{ __index = function(_, key) return gomgr.findforscript(key) end,
			__newindex = function(_, key, _) syserror(format("Attempt to modify read-only table (can't assign to '%s')", key), 2) end,
			__metatable = false
		}))

	-- reroute the world singleton to the game's world (leave taworld as an alias to be consistent with c++)
	rawset(_G, "world", taworld)

	-- add some camera lookups
	rawset(_G, "cameras", table.readonlytable({
			cinematic = cameramgr.cinematiccamera,
		}))

end

-- search for this function in our database. used for prettier stack traces and such.
--
function luamgr.lookupfunction(func)
	for k0, v0 in pairs(classes) do
		if type(v0) == 'table' then
			for k1, v1 in pairs(v0) do
				if func == v1 then
					-- find the actual function (remember, it's flattened)
					while true do
						if not v0._parent or v0._parent[k1] ~= func then break end
						v0 = v0._parent
						k0 = v0._name
					end
					return k0 .. "." .. k1
				end
			end
		end
	end
	return nil
end

-- stack dump function! returns a string with the results.
--
-- FUTURE (SSB) - this needs to be moved into the core somehow. or in the
-- debug table/class. even with the 'go' dependencies. maybe have a callback
-- that gets overridden when luamgr loaded...
function luamgr.stackdump(thread, startlevel, includelocals)
	-- thread is optional
	if type(thread) ~= 'thread' then
		thread, startlevel, includelocals = nil, thread, startlevel
	end

	-- set defaults
	thread = thread or luamgr.currentthread()
	startlevel = startlevel or 0

	-- skip this function from the dump if it's the current thread
	if thread == luamgr.currentthread() then
		startlevel = startlevel + 1
	end

	-- constants
	local firstlevels  = 12;   -- size of the first part of the stack
	local secondlevels = 10;   -- size of the second part of the stack

	-- walk stack
	local lines = {}
	local firstpart = true
	for level = startlevel, math.huge do

		local info = debug.getinfo(thread, level, "Snlf")
		if not info then break end
		level = level + 1

		-- this section does the '...' in the middle of the stack report for deep stacks
		if firstpart and level > firstlevels then
			if not debug.getinfo(thread, level + secondLevels) then  -- no more than 'secondLevels' more levels?
				level = level - 1  -- keep going
			else
				table.insert(lines, "...")  -- too many levels
				while debug.getinfo(thread, level + secondLevels) do -- find last levels
					level = level + 1
				end
			end
			firstpart = false
		else

			-- can we translate the function name?
			local funcname = luamgr.lookupfunction(info.func)
			if not funcname then
				if info.namewhat ~= "" then
					funcname = format("function '%s' (a %s)", info.name, info.namewhat)
				elseif info.what == "main" then
					funcname = "main chunk"
				elseif info.what == "C" then
					funcname = "c function"
				elseif info.what == "tail" then
					funcname = "tail call"
				else
					funcname = format("function at <%s:%d>", info.source, info.linedefined)
				end
			end

			-- add the line
			if info.currentline > 0 then
				table.insert(lines, format("  %s:%d: in %s", info.source, info.currentline, funcname));
			else
				table.insert(lines, format("  %s: in %s", info.source, funcname));
			end

			-- add locals?
			if includelocals then

				local function cleanupvalue(value)
					if type(value) == 'string' then
						value = value:escape()
						if #value > 60 then
							value = value:sub(1, 57) .. "..."
						end
					elseif type(value) == 'function' then
						local funcname = luamgr.lookupfunction(value)
						if funcname then return "<" .. funcname .. ">" end
					end
					return tostring(value) or "<nil>"
				end

				local vars = {}
				for i = 1, math.huge do
					local name, value = debug.getlocal(thread, level - 1, i)
					if not name then break end
					table.insert(lines, format("      [L: %s = %s]", name, cleanupvalue(value)))
				end
				if info.func then
					for i = 1, math.huge do
						local name, value = debug.getupvalue(info.func, i)
						if not name then break end
						table.insert(lines, format("      [U: %s = %s]", name, cleanupvalue(value)))
					end
				end
			end
		end
	end

	return table.concat(lines, "\n")
end

-- special error reporting function! for when ResumeThread fails.
--
function luamgr.reportresumeerror(msg, env)
	local mt = getmetatable(env)
	luamgr.error(format("%s\n\nContext = %s\n\nThread stack:\n%s",
		msg or "Error during thread execution on a Go.", mt.go, luamgr.stackdump(mt.thread, 0, true)), 1)
end

------------------------------------------------------------------------------
-- CLuaMgr::CSubsystem callbacks

function luamgr.on_preworldload()
end

function luamgr.on_postworldload()

	-- clear the load-time-only script db
	luamgr.scriptdb = {}

	-- add per-world singletons
	rawset(_G, "goworld", world.gotaworld)

end

function luamgr.on_postpostworldload()
end

function luamgr.on_preworldunload()
end

function luamgr.on_postworldunload()

	-- clear out custom environments
	envs = {}

	-- clear out timers
	timers.killall()

	-- clear out per-world singletons
	rawset(_G, "goworld", nil)

end

function luamgr.on_preworldupdate()

	-- $ careful what you put here! this is called every frame.

	timers.update()

end

function luamgr.on_modechanged()
end

------------------------------------------------------------------------------
