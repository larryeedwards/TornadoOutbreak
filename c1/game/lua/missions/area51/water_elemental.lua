function on_collected()
      childbyoid(3386):removefromworld()
	stopallanims()
	beginwait()
		startanimandwait("dive")
		childbyoid(3388):reset()
		childbyoid(3388):start()
		childbyoid(3387):reset()
		childbyoid(3387):start()
	endwait()
	if (isavailableforminigame()) then
	   return
	end
	removefromworld()
end

function on_death()
	if cameravolume ~= nil then
		cameravolume:removefromworld()
	end

	if matchingwatersprite ~= nil then
	    matchingwatersprite:childbyoid(3386):removefromworld()
		matchingwatersprite:removefromworld()
	end
	childbyoid(3386):removefromworld()
end

function on_watersprintprep()
      childbyoid(3386):removefromworld()
	stopallanims()
	beginwait()
		startanimandwait("dash_intro")
	endwait()
	startanim("dash")
end

function on_watersprintfail()
      childbyoid(3386):addtoworld()
	stopallanims()
	startanim("idle")
	resetforwatersprint()
end

function on_label(label)
	if (label == "addbubble") then
		childbyoid(3386):addtoworld()
	elseif (label == "removebubble") then
		childbyoid(3386):removefromworld()
	end
end
--
function on_postload()
--                                                         
    matchingwatersprite = gomgr.getbyoid(3389)
    cameravolume = gomgr.getbyoid(3116)
    cameravolume.fixedazimuthobj = this
	
end