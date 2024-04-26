function on_gameplaymoduleactive()
  gomgr.getbyoid(284):addtoworld()
  gomgr.getbyoid(284):dispatchlabel("idle")
  gomgr.getbyoid(282):childbyoid(273):childbyoid(277):dispatchlabel("opened")
end

function on_gameplaymodulecomplete(succeeded)
  if succeeded then
  	--                                              
  	gomgr.getbyoid(229):dispatchlabel("weatherphase1")
  	gomgr.getbyoid(228):dispatchlabel("weatherphase0")
  	
  	--               
  	tornadomgr.stormchambertimer:finish()
	
	--                         
	gomgr.getbyoid(284):removefromworld()
  end
end