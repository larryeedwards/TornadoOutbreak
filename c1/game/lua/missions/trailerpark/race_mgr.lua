gear = 0
realfinish = false

function on_label(label)

  if label == "cinematic_start" then
    addstormendfx()
    
  end
end

function addstormendfx()
    --                
    gomgr.getbyoid(456):addtoworld()
    gomgr.getbyoid(461):addtoworld()
    gomgr.getbyoid(463):addtoworld()
    
--                                                
--                                                
--                                                

    gomgr.getbyoid(438):addtoworld()
    gomgr.getbyoid(438):childbyoid(439):reset()
    gomgr.getbyoid(438):childbyoid(439):start()
    gomgr.getbyoid(440):addtoworld()
    
--                                                               
    gomgr.getbyoid(485):dispatchlabel("up")
    gomgr.getbyoid(486):start()
end

function on_raceaction(message, addtl)
  if message == "finished" then

    gomgr.getbyoid(252):removefromworld()

    realfinish = true
    gomgr.getbyoid(365):dispatchlabel("restartfires")
    gomgr.getbyoid(367):dispatchlabel("restartfires")
    gomgr.getbyoid(368):dispatchlabel("restartfires")

    beginwait()
      cinematic.play("cine_bosssetupB")
    endwait()
    gomgr.getbyoid(2953):requestcomplete(true)

  elseif message == "flyover" then
    engine.pushmode(1)
    gomgr.getbyoid(252).zoomfactor = 5.0
    
    cameramgr.matchcameras(4, 1)
    cameramgr.orbitlookat = gomgr.getbyoid(2954)
    cameramgr.activatecamerakind(4)
    gomgr.getbyoid(2954):startanim("flying")
    
    gomgr.getbyoid(16):setfujitarating(0.1)
    gomgr.getbyoid(2957):dispatchlabel("doit")
    
  elseif message == "failed" then
    pause(1)
    
    beginwait()
      uimgr.playracefail()
    endwait()

    if gear > 0 then
      gomgr.getbyoid(483):stopallanims()
      gomgr.getbyoid(483):startanim("down", 0, 1, 1, 1)
      if gear > 1 then
        gomgr.getbyoid(484):stopallanims()
        gomgr.getbyoid(484):startanim("down", 0, 1, 1, 1)
      end
    end
    
    gear = 0

    gomgr.getbyoid(454):removefromworld()
    gomgr.getbyoid(455):removefromworld()
    gomgr.getbyoid(456):removefromworld()
    gomgr.getbyoid(457):removefromworld()
    gomgr.getbyoid(458):removefromworld()
    gomgr.getbyoid(459):removefromworld()
    gomgr.getbyoid(460):removefromworld()
    gomgr.getbyoid(461):removefromworld()
    gomgr.getbyoid(462):removefromworld()
    gomgr.getbyoid(463):removefromworld()
    
    gomgr.getbyoid(16):warp(gomgr.getbyoid(251))
    gomgr.getbyoid(2958):startrace()
    
    audio.postevent("LOOP_BOSS_SETUP_STORM_BUILDING_STAGE1")
    audio.setstate("EXCITEMENT_LEVEL", "world1_tornado1")

  elseif message == "gearup" then
    if addtl == 1 then
      --      
      audio.postevent("LOOP_BOSS_SETUP_STORM_BUILDING_STAGE2")
      audio.setstate("EXCITEMENT_LEVEL", "world1_tornado2")

      --           
      gomgr.getbyoid(454):addtoworld()
      gomgr.getbyoid(457):addtoworld()
      gomgr.getbyoid(458):addtoworld()
      gomgr.getbyoid(462):addtoworld()
      
      gomgr.getbyoid(483):dispatchlabel("up")

--                                        
--                                         
      
      gear = 1
    elseif addtl == 2 then
      --      
      audio.postevent("LOOP_BOSS_SETUP_STORM_BUILDING_STAGE3")
      audio.setstate("EXCITEMENT_LEVEL", "world1_tornado3")

      --                
      gomgr.getbyoid(455):addtoworld()
      gomgr.getbyoid(459):addtoworld()
      gomgr.getbyoid(460):addtoworld()

      gomgr.getbyoid(484):dispatchlabel("up")

--                                       
--                                         
      
      gear = 2
    end
  elseif message == "speedup" then
    gomgr.getbyoid(252):addtoworld()
    gomgr.getbyoid(480):addtoworld()
    gomgr.getbyoid(481):addtoworld()
    gomgr.getbyoid(482):addtoworld()
  elseif message == "slowdown" then
    gomgr.getbyoid(252):removefromworld()
    gomgr.getbyoid(480):removefromworld()
    gomgr.getbyoid(481):removefromworld()
    gomgr.getbyoid(482):removefromworld()
  end
end