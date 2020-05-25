--   Owner(s): Scott Bilas
-- $Copyright: $
--        $Id: //depot/lcs/ta/main/c1/game/lua/report.lua#2 $
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Class: report

ensurechild("report")

function report:new(name, ...)
	local r = setmetatable({id = math.random(1, 2000000000)}, {__index = report})
	classes.cfusereport.sendrawpacket(r.id, true, format("<report name='%s' columns='%s'><![CDATA[", name, table.concat({...}, ",")))
	return r
end

function report:add(...)
	classes.cfusereport.sendrawpacket(self.id, true, table.concat({...}, ","))
end

function report:delete()
	classes.cfusereport.sendrawpacket(self.id, true, "]]></report>")
	self.id = 0
end

------------------------------------------------------------------------------
