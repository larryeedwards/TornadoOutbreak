C:\TornadoAlley\main\c1\game\lua\range.lua------------------------------------------------------------------------------
--   Owner(s): Scott Bilas
-- $Copyright: $
--        $Id: //depot/lcs/ta/main/c1/game/lua/range.lua#1 $
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- range class

ensurechild("range")

function range.create(min, max)
	return setmetatable({ min = min or 0, max = max or min or 0 }, range)
end

-- 1/0 means "infinity" and is used as an error code

function range:__tostring()
	return format("%g,%g", self.min or 1/0, self.max or 1/0)
end

------------------------------------------------------------------------------