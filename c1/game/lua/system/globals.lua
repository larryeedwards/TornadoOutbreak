C:\TornadoAlley\main\c1\game\lua\globals.lua------------------------------------------------------------------------------
--   Owner(s): Scott Bilas
-- $Copyright: $
--        $Id: //depot/lcs/ta/main/c1/game/lua/globals.lua#5 $
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Global methods

sysassert = assert
syserror = error

-- strict.lua
-- this checks uses of undeclared global variables
-- All global variables must be 'declared' through a regular assignment
-- (even assigning nil will do) in a main chunk before being used
-- anywhere or assigned to inside a function.
--
do -- scope
	local mt = getmetatable(_G)
	if not mt then
		mt = {}
		setmetatable(_G, mt)
	end

	mt.__declared = {}

	local function what ()
		local d = debug.getinfo(3, "S")
		return d and d.what or "C"
	end

	mt.__newindex = function (t, n, v)
		if not mt.__declared[n] then
			local w = what()
			if w ~= "main" and w ~= "C" then
				syserror("assign to undeclared global variable '"..n.."'", 2)
			end
			mt.__declared[n] = true
		end
		rawset(t, n, v)
	end

	mt.__index = function (t, n)
		if not mt.__declared[n] and what() ~= "C" then
			syserror("global variable '"..n.."' is not declared", 2)
		end
		return rawget(t, n)
	end
end

function ensurechild(Table, SubTableName, Value)
	if type(Table) ~= 'table' then
		Table, SubTableName, Value = _G, Table, SubTableName
	end

	if not Value then Value = {} end

	if not rawget(Table, SubTableName) then
		rawset(Table, SubTableName, Value)
	end
end

function rawsetnew(table, key, value, usage)
	local obj = rawget(table, key)
	if not obj then
		rawset(table, key, value)
	else
		syserror(string.format("%s named '%s' conflicts with same-named object of type '%s'", usage, key, type(obj)), 2)
	end
end

-- given A.B.C for the name, we'll create tables for each '.' in the path
-- with the last path component getting assigned 'value'.
function setnewvar(table, name, value, allowreplace)

	-- first param is optional, falls back to global
	if type(table) ~= 'table' then
		table, name, value, allowreplace = _G, table, name, value
	end

	-- process each level
	local parts = name:split('%.')
	for i = 1, #parts - 1 do
		local part = parts[i]
		if not table[part] then
			table[part] = {}
		elseif type(table[part]) ~= "table" then
			syserror(string.format("Can't register variable '%s' through level %d, type at location is %s",
					name, i, type(table[part])), 2)
		end
		table = table[part]
	end

	-- do last part
	local lastpart = parts[#parts]
	if allowreplace or table[lastpart] == nil then
		table[lastpart] = value
	else
		syserror(string.format("Can't do duplicate registrations (path = '%s', existing type = %s, new type = %s)",
				name, type(table[lastpart]), type(value)), 2)
	end
end

-- enhanced format that converts all its 'weird' args to strings
function format(fmt, ...)
	if type(fmt) == 'string' then
		local args = {...}
		for i, v in ipairs(args) do
			if type(v) == 'userdata' or type(v) == 'function' or type(v) == 'table' or type(v) == 'thread' or type(v) == 'boolean' then
				args[i] = tostring(v)
			end
		end
		return string.format(fmt, unpack(args))
	end
	if fmt == nil then return "(nil)" end
	return tostring(fmt)
end

-- this is here for debug support only when running commands direct from fuse.
-- this will never get used in release builds.
atoms = setmetatable({},
	{
		__index =
			function(table, name)
				return atommgr.findatomidfromatomname(name)
			end
	})

------------------------------------------------------------------------------
-- Reporting globals

-- note that these will not actually do anything until luamgr has registered
-- its callbacks. so for any logging or asserts that are supposed to print
-- during startup, use print() or syserror/sysassert.

-- $$ future: extend log to work like .net {0} style stuff, where i can put
-- formatting codes in to control depth of table/array traversal, etc.

function log(...)
	luamgr.report("log", format(...), false)
end

function logline(...)
	luamgr.report("log", format(...), true)
end

function assert(expr, ...)
	if not expr then
		local msg = {...}
		if #msg == 0 then
			msg = {"ASSERT FAILURE"}
		end
		luamgr.report("assert", format(unpack(msg)), true)
	end
end

function warn(...)
	luamgr.report("warning", format(...), true)
end

function error(...)
	luamgr.report("error", format(...), true)
end

function die(...)
	syserror(format(...))
end

-- clear this stuff out in release builds, don't need it
if buildconfig.isrelease then

	local function donothing() end

	log		= donothing
	logline = donothing
	assert	= donothing
	warn	= donothing
	error	= donothing
	die		= donothing

end

------------------------------------------------------------------------------
