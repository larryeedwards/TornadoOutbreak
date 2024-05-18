function on_gameplaymoduleactive()
  gomgr.getbyoid(396):addtoworld()
  gomgr.getbyoid(396):dispatchlabel("idle")
  gomgr.getbyoid(394):childbyoid(377):childbyoid(381):dispatchlabel("opened")
end

function on_gameplaymodulecomplete(success)
  if success then
    --                                              
    gomgr.getbyoid(235):dispatchlabel("weatherphase1")
    gomgr.getbyoid(234):dispatchlabel("weatherphase0")
    

  	--               
  	tornadomgr.stormchambertimer:finish()
	--                         
	gomgr.getbyoid(396):removefromworld()
  end
end