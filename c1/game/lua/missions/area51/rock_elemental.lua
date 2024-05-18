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
	   
    childbyoid(3391):reset()
    childbyoid(3391):start()
	pause(.25)
	   
	if (hitsleft > 0) then
		return
	end
	   
    childbyoid(3392):reset()
    childbyoid(3392):start()
	pause(.5)
	   
	if (hitsleft > 0) then
		return
	end
	   
	removefromworld()
end