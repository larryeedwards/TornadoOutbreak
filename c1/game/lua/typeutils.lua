typeutils  C:\TornadoAlley\main\c1\game\lua\typeutils.lua ------------------------------------------------------------------------------
--   Owner(s): Scott Bilas
-- $Copyright: $
--        $Id: //depot/lcs/ta/main/c1/game/lua/typeutils.lua#1 $
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Class: typeutils

ensurechild("typeutils")

-- returns 'value' or 'ref' depending on object type or typename
function typeutils.valueorreftype(obj)
	if not obj then return nil end

	-- try obj-is-its-typename first
	if obj == 'number' or obj == 'string' or obj == 'boolean' then return 'value' end
	if obj == 'table' or obj == 'function' or obj == 'thread' or obj == 'userdata' then return 'ref' end

	-- try again as its typename
	return typeutils.valueorreftype(type(obj))
end

function typeutils.isvaluetype(obj)
	return typeutils.valueorreftype(obj) == 'value'
end

function typeutils.isreftype(obj)
	return typeutils.valueorreftype(obj) == 'ref'
end

------------------------------------------------------------------------------
