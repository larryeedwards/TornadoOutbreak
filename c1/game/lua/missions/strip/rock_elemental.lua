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
	   
    childbyoid(571):reset()
    childbyoid(571):start()
	pause(.25)
	   
	if (hitsleft > 0) then
		return
	end
	   
    childbyoid(572):reset()
    childbyoid(572):start()
	pause(.5)
	   
	if (hitsleft > 0) then
		return
	end
	   
	removefromworld()
end