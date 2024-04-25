C:\TornadoAlley\main\c1\game\lua\string.lua------------------------------------------------------------------------------
--   Owner(s): Scott Bilas
-- $Copyright: $
--        $Id: //depot/lcs/ta/main/c1/game/lua/string.lua#1 $
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Class: string

-- these are extensions to the built-in lua class 'string'

--From lua-users.org/wiki/SplitJoin.html
--Written for 5.0; could be made slightly cleaner with 5.1
--Splits a string based on a separator string or pattern;
--returns an array of pieces of the string.
--(May optionally supply a table as the third parameter which will be filled with the results.)
function string:split(inSplitPattern, outResults)
	if not outResults then
		outResults = {}
	end
	local theStart = 1
	local theSplitStart, theSplitEnd = string.find( self, inSplitPattern, theStart )
	while theSplitStart do
		table.insert( outResults, string.sub( self, theStart, theSplitStart-1 ) )
		theStart = theSplitEnd + 1
		theSplitStart, theSplitEnd = string.find( self, inSplitPattern, theStart )
	end
	table.insert( outResults, string.sub( self, theStart ) )
	return outResults
end

-- from PIL at http://www.lua.org/pil/20.3.html
function string.trim(s)
	return (string.gsub(s, "^%s*(.-)%s*$", "%1"))
end

function string.escape(s)
	return string.gsub(s, "%c", {["\n"]="\\n",["\t"]="\\t",["\r"]="\\r"})
end

------------------------------------------------------------------------------