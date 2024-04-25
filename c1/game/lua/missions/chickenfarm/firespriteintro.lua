siloDeadText = {
    1139,
    1140,
    1141
  }
  
  function on_gameplaymoduleactive()
    
    --             
    gomgr.getbyoid(262):dispatchlabel("weatherphase1")
    tornadomgr.stormchambertimer.isforcingdisplay = false
    tornadomgr.stormchambertimer:finish()
  
    --                
    pause(0.1)
    engine.pushmode(1)
    cinematic.play("siloIntro")
    gomgr.getbyoid(447):removefromworld()
    
    --          
    for i = 1, #siloDeadText do
      
      if (i == 2) then
        gomgr.getbyoid(447):addtoworld()
        gomgr.getbyoid(447):resetmovingalongpath()
        gomgr.getbyoid(447):dispatchlabel("reset")
        gomgr.getbyoid(447):stopallanims()
        audio.postevent("CHK_Firesprite_First_Appear")
        beginwait()
          gomgr.getbyoid(447):startanimandwait("spawn")
        endwait()
        gomgr.getbyoid(447):stopallanims()
        gomgr.getbyoid(447):startanim("idle", 0.0, 1.0, 1.0, 0)
      end
      
      if (i == 3) then
        gomgr.getbyoid(447):stopallanims()
        audio.postevent("CHK_Firesprite_Escape")
        beginwait()
          gomgr.getbyoid(447):startanimandwait("wander_start")
        endwait()
        gomgr.getbyoid(447):stopallanims()
        gomgr.getbyoid(447):startanim("wander", 0.0, 1.0, 1.0, 0)
        gomgr.getbyoid(447).path = gomgr.getbyoid(241)
        gomgr.getbyoid(447):dispatchlabel("firesprite_fly")
        cameramgr.screenfade(0, 0.3, 0.2, 0.3)
        engine.pushmode(1)
        pause(0.3)
        cinematic.play("followSprites2")
        pause(5.0)
        engine.popmode(1)
      end
      
      gomgr.getbyoid(3568).location = 0
      gomgr.getbyoid(3568).portrait = 1
      gomgr.getbyoid(3568).buttonon = true
      gomgr.getbyoid(3568):settext(" textbox ", siloDeadText[i])
      gomgr.getbyoid(3568).finishonbuttonpress = true
      beginwait()
        gomgr.getbyoid(3568):start()
      endwait()
    end
    
    --                                  
    cinematic.stop()
    engine.popmode(1)
    world.load("training_firesprite", "")
  end