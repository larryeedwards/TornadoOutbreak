function on_growmissiontimeout()
	beginwait()
		uimgr.playoutoftime();
	endwait()
  
	cameramgr.screenfade(0, 0.7, 0.25, 1.0)
	pause(0.8)
  
end

function on_gameplaymoduleactive()
  gomgr.getbyoid(385):addtoworld()
  gomgr.getbyoid(385):dispatchlabel("idle")
  gomgr.getbyoid(376):childbyoid(377):childbyoid(381):dispatchlabel("opened")
end

function on_gameplaymodulecomplete(succeeded)
  cameramgr.screenfade(0, 0.0, 0.1, 0.5)
  gomgr.getbyoid(385):removefromworld()
end
