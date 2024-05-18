function on_growmissiontimeout()
	beginwait()
		uimgr.playoutoftime();
	endwait()
  
	cameramgr.screenfade(0, 0.7, 0.25, 1.0)
	pause(0.8)
  
end
--                                              
scientistCollected = 0
isActive = false
candraindirt = false

function on_label(label)

  --                                          
  if isActive == true and label == "scientistsCollected" and gomgr.getbyoid(3556).inworld == false then
    scientistCollected = scientistCollected + 1
    
    --                                                      
    if scientistCollected >= 17 and gomgr.getbyoid(16).fujitarating < 2.33 then
      tagamestats.unlockaward(0, 29)
    end
    
  end
end 

function on_gameplaymoduleupdate()
  if tornadomgr.getcombinedfujita() >= 2 and candraindirt == false then
    candraindirt = true
    gomgr.getbyoid(2918):removefromworld()
  end
  
end

function on_gameplaymoduleactive()

  isActive = true
  
  --                                                              
  scientistCollected = 0

  gomgr.getbyoid(3132):addtoworld()
  gomgr.getbyoid(3132):dispatchlabel("idle")
  gomgr.getbyoid(3124):childbyoid(3125):childbyoid(3129):dispatchlabel("opened")
end

function on_gameplaymodulecomplete(succeeded)

  isActive = false
  cameramgr.screenfade(0, 0.0, 0.1, 0.5)
  gomgr.getbyoid(3132):removefromworld()

end