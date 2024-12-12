		function on_collected()
	stopallanims()
	startanim("wake_up",0,1.0,1.0,1)
	pause(1.5)

	   
	if (hitsleft > 0) then
		return
	end
	   
	stopallanims()
	startanim("jump_offscreen")
	pause(1.5)
	   
	if (hitsleft > 0) then
		return
	end
	   
    childbyoid(290):reset()
    childbyoid(290):start()
	pause(.25)
	   
	if (hitsleft > 0) then
		return
	end
	   
    childbyoid(291):reset()
    childbyoid(291):start()
	pause(.5)
	   
	if (hitsleft > 0) then
		return
	end
	   
	removefromworld()
end

function on_rockhit(tornado)
	logline("on_rockhit")
	gameplaymgr.currentgameplaymodule:dispatchlabel("on_rockhit")
end