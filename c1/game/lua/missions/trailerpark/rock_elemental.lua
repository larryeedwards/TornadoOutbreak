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
	   
    childbyoid(470):reset()
    childbyoid(470):start()
	pause(.25)
	   
	if (hitsleft > 0) then
		return
	end
	   
    childbyoid(471):reset()
    childbyoid(471):start()
	pause(.5)
	   
	if (hitsleft > 0) then
		return
	end
	   
	removefromworld()
end