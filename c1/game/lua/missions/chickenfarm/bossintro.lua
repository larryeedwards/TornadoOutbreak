function on_gameplaymoduleactive(resetCount)

    tornadomgr.displayfirespritegoalinfo = false
    tornadomgr.displayfirespritetotalinfo = false
    
    gomgr.getbyoid(264):dispatchlabel("weatherphase0")
    gomgr.getbyoid(265):dispatchlabel("weatherphase1")
    gomgr.getbyoid(3583):dispatchlabel("setupapproach1")
    audio.postevent("LOOP_BOSS_APPROACH_STORM_FULL")
  
    --                     
    --                                
    engine.pushmode(1)
    beginwait()
      cinematic.play("cine_opening")
    endwait()
    engine.popmode(1) 
    requestcomplete(true)
  end
  