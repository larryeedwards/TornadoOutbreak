--   Owner(s): Scott Bilas
-- $Copyright: $
--        $Id: //depot/lcs/ta/main/c1/game/lua/table.lua#1 $
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Class: table

-- these are extensions to the built-in lua class 'table'

-- given a table, returns a "read only" version of it that errors on attempts
-- to modify contents. also can give an error if looking up a nonexistent
-- value. so we can catch spelling errors on constants etc.
--
-- based on http://lua-users.org/wiki/ReadOnlyTables
--
function table.readonlytable(table, checkreads)

	local mt =
		{
			__index = table,
			__newindex = function(table, key, value)
					syserror("Attempt to modify read-only table", 2)
				end,
			__metatable = false
		}

	local newTable = setmetatable({}, mt)

	if checkreads then
		mt.__index = function(_, key)
				local value = rawget(table, key)
				if value == nil then
					syserror("Reading nonexistent value '" .. key .. "' from table - spelling error?", 2)
					return nil
				end
				return value
			end
	end

	return newTable
end

-- now that we have this function, protect the buildconfig
rawset(_G, "buildconfig", table.readonlytable(buildconfig, true))

-- support function
local function table_val_to_str (v, depth)
	if "string" == type(v) then
		v = string.gsub(v, "\n", "\\n")
		if string.match(string.gsub(v,"[^'\"]",""), '^"+$') then
			return "'" .. v .. "'"
		end
		return '"' .. string.gsub(v,'"', '\\"') .. '"'
	elseif "function" == type(v) then
		return "<func>"
	elseif "table" == type(v) then
		if depth > 0 then
			return table.tostring(v, depth)
		else
			return "{...}"
		end
	else
		return tostring(v)
	end
end

-- support function
local function table_key_to_str (k, depth)
	if "string" == type(k) and string.match(k, "^[_%a][_%a%d]*$") then
		return k
	else
		return "[" .. table_val_to_str(k, depth) .. "]"
	end
end

-- recursively convert a table into a string
--
-- based on http://lua-users.org/wiki/TableUtils
--
function table.tostring(tbl, depth)
	depth = depth or 99999
	local result, done = {}, {}
	if not depth or depth > 0 then
		for k, v in ipairs(tbl) do
			table.insert(result, table_val_to_str(v, depth - 1))
			done[k] = true
		end
		for k, v in pairs(tbl) do
			if not done[k] then
				table.insert(result,
					table_key_to_str(k, depth - 1) .. "=" .. table_val_to_str(v, depth - 1))
			end
		end
	end
	return "{" .. table.concat(result, ",") .. "}"
end

-- moves array elements into hash keys
function table.fromarray(a)
	local t = {}
	for i, v in ipairs(a) do t[v] = v end
	return t
end

-- converts all keys to an array
function table.keystoarray(t)
	local a = {}
	for k in pairs(t) do table.insert(a, k) end
	return a
end

-- converts all values to an array
function table.valuestoarray(t)
	local a = {}
	for _, v in pairs(t) do table.insert(a, v) end
	return a
end

-- returns an array of sorted keys
function table.sortedkeys(t)
	local keys = {}
	for k, v in pairs(t) do table.insert(keys, k) end

	-- sort by key type then by key name
	table.sort(keys,
		function(a, b)
			local at, bt = type(a), type(b)
			if at == bt then
				return tostring(a) < tostring(b)
			else
				return at < bt
			end
		end)
	return keys
end

function table.logline(tbl, depth)
	logline(table.tostring(tbl, depth))
end

-- here's a version that doesn't stick the whole thing on one line
--
-- based on http://lua-users.org/wiki/TableUtils
--
function table.tostringbig(tt, depth, indent, done)
	depth = depth or 99999
	done = done or {}
	indent = indent or 0
	local s = ""
	if type(tt) == "table" then
		for key, value in pairs (tt) do
			s = s .. string.rep (" ", indent) -- indent it
			if type (value) == "table" and not done [value] and depth > 0 then
				done [value] = true
				s = s .. string.format("[%s] => table\n", tostring (key))
				s = s .. string.rep (" ", indent+4) -- indent it
				s = s .. "(\n"
				s = s .. table.tostringbig (value, depth - 1, indent + 7, done)
				s = s .. string.rep (" ", indent+4) -- indent it
				s = s .. ")\n"
			else
				s = s .. string.format("[%s] => %s\n", tostring (key), tostring(value))
			end
		end
	else
		s = s .. tt .. "\n"
	end
	return s
end

function table.loglinebig(tbl, depth)
	logline(table.tostringbig(tbl, depth))
end

------------------------------------------------------------------------------
-- Table-manipulation metatables.

-- mix and match these. just don't modify them! make a copy first if you want
-- them to do something different.

table.mts = {}

-- attach this metatable to a table to have any references to nonexistent
-- children create sub-tables on-demand.
table.mts.autochildcreator =
 	{
		__index = function(t, k)
				local v = rawget(t, k)
				if v == nil then
					v = setmetatable({}, automt)
					rawset(t, k, v)
				end
				return v
			end
	}

function table.newautochildcreator()
	return setmetatable({}, table.mts.autochildcreator)
end
------------------------------------------------------------------------------
