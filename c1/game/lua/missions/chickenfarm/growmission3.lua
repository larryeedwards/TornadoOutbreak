function on_growmissiontimeout()
	beginwait()
		uimgr.playoutoftime();
	endwait()
  
	cameramgr.screenfade(0, 0.7, 0.25, 1.0)
	pause(0.8)
  
end
--
growIntroText = {
    1132,
    1133,
    1134
  } 
  
  collected25 = false
  collected100 = false
  
  function on_gameplaymoduleactive()
  
    tornadomgr.displayfirespritegoalinfo = true
    tornadomgr.displayfirespritetotalinfo = true
    
    --                                       
    while (tornadomgr.firstactivetornado == nil) do
        pause(0.1)
      end
      
    collected30 = false
    collected100 = false
  
      --                                            
    tornadomgr.stormchambertimer:removefromworld()
    pause(0.1)
    gomgr.getbyoid(462):dispatchlabel("reset")
    if tamodemgr.getgamemode() == 1 then
      chainmgr.clearchaincategories()
      chainmgr.activatechaincategory(chaincategory.fences)
    end
    tornadomgr.enableskill(4)
    
    --                
    tornadomgr.stormchambertimer:starttimerforboss(300)
    gomgr.getbyoid(247):freeze()
    engine.pushmode(1)
    
    --           
    gomgr.getbyoid(3568).location = 1
    gomgr.getbyoid(3568).buttonon = true
    for i = 1, #growIntroText do
      gomgr.getbyoid(3568):settext(" textbox ", growIntroText[i])
      gomgr.getbyoid(3568).finishonbuttonpress = (i==#growIntroText)
      beginwait()
        gomgr.getbyoid(3568):start()
      endwait()
    end
      
    --         
    gomgr.getbyoid(247):unfreeze()
    engine.popmode(1)
    
    --                           
    tornadomgr.stormchambertimer:addtoworld()
    tornadomgr.stormchambertimer:starttimerwithval(150)
    gomgr.getbyoid(462).path = gomgr.getbyoid(255)
    gomgr.getbyoid(462):dispatchlabel("trainer_fly")
  end
  
  function on_gameplaymodulecomplete(succeeded)
      if succeeded then
        --                                              
        gomgr.getbyoid(264):dispatchlabel("weatherphase1")
        gomgr.getbyoid(263):dispatchlabel("weatherphase0") 
    end
  end
  
  function on_gameplaymoduleupdate()
    --                                       
    if (tornadomgr.firstactivetornado == nil) then return end
    
    if (not collected30 and tornadomgr.firstactivetornado.firespritescollected >= 50) then 
      if tornadomgr.stormchambertimer.timervalue > 0 then
        collected30 = true
        beginwait()
          uimgr.playhint(1777)
        endwait()
      end
    elseif (not collected100 and tornadomgr.firstactivetornado.firespritescollected >= 100) then 
      if tornadomgr.stormchambertimer.timervalue > 0 then
        collected100 = true
        beginwait()
          uimgr.playhint(1778)
        endwait()
      end
    end
  end