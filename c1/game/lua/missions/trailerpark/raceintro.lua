function on_gameplaymoduleactive()

  --                                              
  gomgr.getbyoid(229):dispatchlabel("weatherphase1")
  gomgr.getbyoid(228):dispatchlabel("weatherphase0")
  
  --                                  
  gomgr.getbyoid(483):addtoworld()
  gomgr.getbyoid(484):addtoworld()
  gomgr.getbyoid(485):addtoworld()
  
  --               
--                                           
  engine.pushmode(1)
  beginwait()
    cinematic.play("raceIntro")
  endwait()
  engine.popmode(1)
  cameramgr.screenfade(0, 0.7, 1.5, 1.5)
  pause(0.8)
  requestcomplete(true)
end