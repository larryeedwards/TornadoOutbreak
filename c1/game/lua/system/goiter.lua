C:\TornadoAlley\main\c1\game\lua\goiter.lua------------------------------------------------------------------------------
--   Owner(s): Scott Bilas
-- $Copyright: $
--        $Id: //depot/lcs/ta/main/c1/game/lua/goiter.lua#1 $
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- goiter class

ensurechild("goiter")

goiter.__index = goiter

function goiter.createbyclass(class, onlyinworld)
	if onlyinworld == nil then onlyinworld = true end   -- default

	-- if we get a name, it should be a string
	if type(class) == "string" then
		local c = classes[string.lower(class)]
		if not c then die("Can't find class named '%s'", class) end
		class = c
	end

	-- if we get a table, it better be a go class
	if not class._id then die("Class '%s' is not a CGo-type class", class._name) end

	-- ok now get the start of the list
	return setmetatable({ go = gomgr.findfirstbyclass(class._id) }, goiter)
end

function goiter:next()
	self.go = gomgr.findnextbyclass(self.go)
	return self.go
end

------------------------------------------------------------------------------