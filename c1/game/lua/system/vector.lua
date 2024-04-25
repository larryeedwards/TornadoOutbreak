C:\TornadoAlley\main\c1\game\lua\vector.lua------------------------------------------------------------------------------
--   Owner(s): Scott Bilas
-- $Copyright: $
--        $Id: //depot/lcs/ta/main/c1/game/lua/vector.lua#1 $
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- vector class

ensurechild("vector")

-- general method, tries to detect vec2/3
function vector.create(x, y, z)
	if z then return vector.create3(x, y, z) end
	return vector.create2(x, y)
end

function vector.create3(x, y, z)
	local v = { x = x or 0, y = y or 0, z = z or 0 }
	setmetatable(v, vector)
	v[0], v[1], v[2] = v.x, v.y, v.z
	return v
end

function vector.create2(x, y)
	local v = { x = x or 0, y = y or 0 }
	setmetatable(v, vector)
	v[0], v[1] = v.x, v.y
	return v
end

-- 1/0 means "infinity" and is used as an error code
function vector:__tostring()
	local x = self.x or 1/0
	local y = self.y or 1/0
	if self.z then
		return format("%g,%g,%g", x, y, self.z)
	else
		return format("%g,%g", x, y)
	end
end

------------------------------------------------------------------------------