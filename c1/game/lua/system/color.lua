C:\TornadoAlley\main\c1\game\lua\color.lua------------------------------------------------------------------------------
--   Owner(s): Scott Bilas
-- $Copyright: $
--        $Id: //depot/lcs/ta/main/c1/game/lua/color.lua#1 $
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- color class

ensurechild("color")

function color.create(r, g, b, a)
	local c = {}
	setmetatable(c, color)
	c.r, c.g, c.b, c.a = r, g, b, a or 255        -- assign here to pick up the clamping
	c[0], c[1], c[2], c[3] = c.r, c.g, c.b, c.a   -- support indexing into color too
	return c
end

function color:__newindex(n, v)
	rawset(self, n, math.min(255, math.max(0, v))) -- clamp
end

function color:__tostring()
	return format("%d,%d,%d,%d", self.r or 1/0, self.g or 1/0, self.b or 1/0, self.a or 1/0)
end

------------------------------------------------------------------------------
-- color globals

-- convenience helpers
rgba = color.create
rgb = color.create

------------------------------------------------------------------------------
