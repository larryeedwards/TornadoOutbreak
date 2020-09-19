--   Owner(s): Scott Bilas
-- $Copyright: $
--        $Id: //depot/lcs/ta/main/c1/game/lua/flagmgr.lua#1 $
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- flagmgr class

ensurechild("flagmgr")

function flagmgr.set(name, val)
	if val == nil then val = true end
	modvalsmgr.setmodval("flag." .. name, tostring(val))
end

function flagmgr.clear(name)
	modvalsmgr.setmodval("flag." .. name, "false")
end

function flagmgr.get(name)
	return modvalsmgr.getmodbool("flag." .. name)
end

function flagmgr.toggle(name)
	local newval = flagmgr.get(name) == false
	flagmgr.set(name, newval)
	return newval
end

------------------------------------------------------------------------------
-- flag global

-- this lets you do stuff like...
--
--    flag.tornado.debuginfo = true
--    logline("flag = %s", flag.tornado.debuginfo.value)
--    flag.tornado.debuginfo.toggle()
--
flag = setmetatable({},
	{
		__index = function(t, n)

				-- special handlers
				if n == "value" then
					return flagmgr.get(t._name)
				end
				if n == "toggle" then
					return function()
						return flagmgr.toggle(t._name)
					end
				end

				-- this does recursive name building
				local name = rawget(t, "_name")
				if name ~= nil then
					name = name .. "." .. n
				else
					name = n
				end

				-- recursive names build a new table
				return setmetatable({_name = name}, getmetatable(t))
			end,

		__newindex = function(t, n, v)
				flagmgr.set(t._name .. "." .. n, v)
			end,

		__tostring = function(t)
				return t._name
			end,
	})

------------------------------------------------------------------------------
