barnIntroText = {
    1122,
    1123,
    1124,
    1125
  }
  
  --      
  function on_gameplaymoduleactive()
    --                                              
    gomgr.getbyoid(264):dispatchlabel("weatherphase0")
    gomgr.getbyoid(260):dispatchlabel("weatherphase1")
    
    gomgr.getbyoid(462):dispatchlabel("reset")
    
    cinematic.stop()
    
    --                                       
    while (tornadomgr.firstactivetornado == nil) do
        pause(0.1)
      end
    if (gomgr.getbyoid(16) == tornadomgr.firstactivetornado) then
      cameramgr.deactivatecamera(0, 14, 0)
    else
      cameramgr.deactivatecamera(1, 14, 0)
    end
    --                
    gomgr.getbyoid(216):freeze()
    
    --           
    gomgr.getbyoid(3568).location = 1
    gomgr.getbyoid(3568).buttonon = true
    engine.pushmode(1)
    for i = 1, #barnIntroText do
      if i == 2 then
        gomgr.getbyoid(216):unfreezecamera()
        pause(0.01)
        beginwait()
          cinematic.play("toBarn")
        endwait()
        cinematic.play("barnIntro")
        gomgr.getbyoid(3568).location = 0
        gomgr.getbyoid(3568).portrait = 1
      end
      gomgr.getbyoid(3568):settext(" textbox ", barnIntroText[i])
      gomgr.getbyoid(3568).finishonbuttonpress = (i==1 or i==2 or i==#barnIntroText)
      beginwait()
        gomgr.getbyoid(3568):start()
      endwait()
      if i == 2 then
        cinematic.stop()
        gomgr.getbyoid(3568).location = 1
        gomgr.getbyoid(216):freeze()
      end
    end
      
    --         
    gomgr.getbyoid(216):unfreeze()
    engine.popmode(1)
    
    --                           
    gomgr.getbyoid(462).path = gomgr.getbyoid(227)
    gomgr.getbyoid(462):dispatchlabel("trainer_fly")
    requestcomplete(true)
  end