canbreakoutoffence = false

function on_gameplaymoduleactive()
  --                           
  gomgr.getbyoid(3082):dispatchlabel("weatherphase2")
  canbreakoutoffence = false
  gomgr.getbyoid(3143):addtoworld()
  gomgr.getbyoid(3143):dispatchlabel("idle")
  gomgr.getbyoid(3141):childbyoid(3125):childbyoid(3129):dispatchlabel("opened")
end


function on_gameplaymoduleupdate()
  if tornadomgr.getcombinedfujita() >= 2.7 and canbreakoutoffence == false then
    canbreakoutoffence = true
    gomgr.getbyoid(3082):dispatchlabel("weatherphase1")
  end
  
end

function on_gameplaymodulecomplete(succeeded)
  if succeeded then
  	--                                              
  	gomgr.getbyoid(3083):dispatchlabel("weatherphase1")
  	gomgr.getbyoid(3082):dispatchlabel("weatherphase0")

  	--               
  	tornadomgr.stormchambertimer:finish()
	--                         
	gomgr.getbyoid(3143):removefromworld()
  end
end