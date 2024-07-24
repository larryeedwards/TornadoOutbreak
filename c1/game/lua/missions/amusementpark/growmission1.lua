function on_growmissiontimeout()
	beginwait()
		uimgr.playoutoftime();
	endwait()
  
	cameramgr.screenfade(0, 0.7, 0.25, 1.0)
	pause(0.8)
  
end

function on_gameplaymoduleactive()
  gomgr.getbyoid(248):dispatchlabel("weatherphase0")
  gomgr.getbyoid(312):addtoworld()
  gomgr.getbyoid(312):dispatchlabel("idle")
  
  gomgr.getbyoid(16).ignoreallinput = false
  gomgr.getbyoid(3786).ignoreallinput = false
  
  --             
  gomgr.getbyoid(417):dispatchlabel("remove")
  gomgr.getbyoid(413):dispatchlabel("remove")
  gomgr.getbyoid(418):dispatchlabel("remove")
end

function on_gameplaymodulecomplete(succeeded)
  if succeeded then
    cameramgr.screenfade(0, 0.0, 0.1, 0.5)
    gomgr.getbyoid(312):removefromworld()
  end
end