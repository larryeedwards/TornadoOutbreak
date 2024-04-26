function on_gameplaymoduleactive()
  cameramgr.activatecamera(0, 1, 0)

  --                                              
  gomgr.getbyoid(229):dispatchlabel("weatherphase1")
  gomgr.getbyoid(228):dispatchlabel("weatherphase0")
  
  gomgr.getbyoid(483):addtoworld()
  gomgr.getbyoid(484):addtoworld()
  gomgr.getbyoid(485):addtoworld()

  gomgr.getbyoid(16):setfujitarating(2.0)
  tornadomgr.setfujitamax(2.0)
  
  gomgr.getbyoid(2958):startrace()
  
  math.randomseed(time.t)
  local rand = math.random(1, 2)
  if rand == 1 then
    tornadomgr.toggletpotdriver()
  end

  --      
  audio.postevent("LOOP_BOSS_SETUP_STORM_BUILDING_STAGE1")
  audio.postevent("TRP_WIND_RACE")
  pause(0.1)
  audio.setstate("EXCITEMENT_LEVEL", "world1_tornado1")
end