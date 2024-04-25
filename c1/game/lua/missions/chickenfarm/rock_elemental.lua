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
	   
    childbyoid(473):reset()
    childbyoid(473):start()
	pause(.25)
	   
	if (hitsleft > 0) then
		return
	end
	   
    childbyoid(474):reset()
    childbyoid(474):start()
	pause(.5)
	   
	if (hitsleft > 0) then
		return
	end
	   
	removefromworld()
end