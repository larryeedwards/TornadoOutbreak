function on_collected()
      childbyoid(566):removefromworld()
	stopallanims()
	beginwait()
		startanimandwait("dive")
		childbyoid(568):reset()
		childbyoid(568):start()
		childbyoid(567):reset()
		childbyoid(567):start()
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
	    matchingwatersprite:childbyoid(566):removefromworld()
		matchingwatersprite:removefromworld()
	end
	childbyoid(566):removefromworld()
end

function on_watersprintprep()
      childbyoid(566):removefromworld()
	stopallanims()
	beginwait()
		startanimandwait("dash_intro")
	endwait()
	startanim("dash")
end

function on_watersprintfail()
      childbyoid(566):addtoworld()
	stopallanims()
	startanim("idle")
	resetforwatersprint()
end

function on_label(label)
	if (label == "addbubble") then
		childbyoid(566):addtoworld()
	elseif (label == "removebubble") then
		childbyoid(566):removefromworld()
	end
end
function on_postload()
--                                                         
    matchingwatersprite = gomgr.getbyoid(569)
    cameravolume = gomgr.getbyoid(270)
    cameravolume.fixedazimuthobj = this
	
end