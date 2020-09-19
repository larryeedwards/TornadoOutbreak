-   Owner(s): Scott Bilas
-- $Copyright: $
--        $Id: //depot/lcs/ta/main/c1/game/lua/timers.lua#2 $
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- timers class

ensurechild("timers")

function timers.set(go, name, periodsec, repeatcount)

	-- defaults
	periodsec = periodsec or 0
	repeatcount = repeatcount or 0

	-- go timer set
	local timer = timers.timers[go]
	if not timer then
		timer = {}
		timers.timers[go] = timer
	end

	-- warn if we're at too many
	if not timer[name] then
		timers.count = timers.count + 1
		if timers.count > 20 then
			-- too many = maybe the timer stuff should be rewritten in c++
			warn("There sure are a lot of Lua timers! We're at %d now, maybe Scott should review this.", timers.count)
		end
	end

	-- new timer
	timer[name] = {
			-- state
			count       = 0,                    -- # iterations done so far
			expire      = time.t + periodsec,   -- time to next expiration
			-- spec
			periodsec   = periodsec,
			repeatcount = repeatcount
		}

end

function timers.kill(go, name)
	local t = timers.timers[go]
	if t ~= nil then
		if name ~= nil then
			-- remove only the requested timer, if it exists
			timers.count = timers.count - 1
			t[name] = nil
		else
			-- remove all registered timers
			for k,v in pairs(t) do
				timers.count = timers.count - 1    -- is there an easy way to count the # fields in a table? #table doesnt work (only on arrays)
			end
			timers.timers[go] = nil
		end
	end
end

function timers.killall()
	timers.count = 0
	timers.timers = {}
end

function timers.update()
	local t = time.t
	for go, gotimers in pairs(timers.timers) do
		for name, timer in pairs(gotimers) do
			if t >= timer.expire then
				-- update state
				timer.count = timer.count + 1
				timer.expire = t + timer.periodsec
				-- do callback
				luamgr.dispatchtimer(go, name, timer.count)
				-- remove timer if no more iterations to do
				if timer.repeatcount > 0 and timer.count >= timer.repeatcount then
					timers.count = timers.count - 1
					gotimers[name] = nil
				end
			end
		end
		if not next(gotimers) then timers.timers[go] = nil end
	end
end

-- init timers table
timers.killall()

------------------------------------------------------------------------------
