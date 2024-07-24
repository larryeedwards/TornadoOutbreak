function on_gameplaymoduleactive()
  gomgr.getbyoid(248):dispatchlabel("weatherphase0")
  gomgr.getbyoid(323):addtoworld()
  gomgr.getbyoid(323):dispatchlabel("idle")
  
  --             
  gomgr.getbyoid(418):dispatchlabel("remove")
end

function on_gameplaymodulecomplete(succeeded)
	if succeeded then
  	--                                              
  	gomgr.getbyoid(241):dispatchlabel("weatherphase1")
  	gomgr.getbyoid(240):dispatchlabel("weatherphase0")
	
	--                         
	gomgr.getbyoid(323):removefromworld()
  end
end