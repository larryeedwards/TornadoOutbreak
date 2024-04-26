function on_collected()
      childbyoid(465):removefromworld()
	stopallanims()
	beginwait()
		startanimandwait("dive")
		childbyoid(467):reset()
		childbyoid(467):start()
		childbyoid(466):reset()
		childbyoid(466):start()
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
	    matchingwatersprite:childbyoid(465):removefromworld()
		matchingwatersprite:removefromworld()
	end
	childbyoid(465):removefromworld()
end

function on_watersprintprep()
      childbyoid(465):removefromworld()
	stopallanims()
	beginwait()
		startanimandwait("dash_intro")
	endwait()
	startanim("dash")
end

function on_watersprintfail()
      childbyoid(465):addtoworld()
	stopallanims()
	startanim("idle")
	resetforwatersprint()
end

function on_label(label)
	if (label == "addbubble") then
		childbyoid(465):addtoworld()
	elseif (label == "removebubble") then
		childbyoid(465):removefromworld()
	end
end

function on_postload()
--                                                         
    matchingwatersprite = gomgr.getbyoid(468)
    cameravolume = gomgr.getbyoid(247)
    cameravolume.fixedazimuthobj = this
	
end