gear = 0

realfinish = false

function on_label(label)

  if label == "cinematic_start" then
    addstormendfx()
    
  end
end

function addstormendfx()
    --                
    gomgr.getbyoid(3245):addtoworld()
    gomgr.getbyoid(3250):addtoworld()
    gomgr.getbyoid(3252):addtoworld()
    
    gomgr.getbyoid(3083):dispatchlabel("weatherphase0")
    
    gomgr.getbyoid(3253):addtoworld()
    gomgr.getbyoid(3253):childbyoid(3254):reset()
    gomgr.getbyoid(3253):childbyoid(3254):start()
    gomgr.getbyoid(3255):addtoworld()
    
    gomgr.getbyoid(3229):dispatchlabel("up")
--                                                                      
--                                   
end

function on_raceaction(message, addtl)
  if message == "finished" then

    gomgr.getbyoid(3098):removefromworld()
 
    realfinish = true
    beginwait()
      cinematic.play("cine_bosssetupB")
    endwait()
    gomgr.getbyoid(3585):requestcomplete(true)
    
  elseif message == "flyover" then
    engine.pushmode(1)
    gomgr.getbyoid(3098).zoomfactor = 5.0
    
    cameramgr.matchcameras(4, 1)
    cameramgr.orbitlookat = gomgr.getbyoid(3586)
    cameramgr.activatecamerakind(4)
    gomgr.getbyoid(3586):startanim("flying")
    
    gomgr.getbyoid(3589):dispatchlabel("doit")
     
  elseif message == "failed" then
    pause(1)
    
    beginwait()
      uimgr.playracefail()
    endwait()
    
    if gear > 0 then
      gomgr.getbyoid(3227):stopallanims()
      gomgr.getbyoid(3227):startanim("down", 0, 1, 1, 1)
      if gear > 1 then
        gomgr.getbyoid(3228):stopallanims()
        gomgr.getbyoid(3228):startanim("down", 0, 1, 1, 1)
      end
    end
    
    gear = 0

    gomgr.getbyoid(3243):removefromworld()
    gomgr.getbyoid(3244):removefromworld()
    gomgr.getbyoid(3245):removefromworld()
    gomgr.getbyoid(3246):removefromworld()
    gomgr.getbyoid(3247):removefromworld()
    gomgr.getbyoid(3248):removefromworld()
    gomgr.getbyoid(3249):removefromworld()
    gomgr.getbyoid(3250):removefromworld()
    gomgr.getbyoid(3251):removefromworld()
    gomgr.getbyoid(3252):removefromworld()
    
    gomgr.getbyoid(16):warp(gomgr.getbyoid(3068))
    gomgr.getbyoid(3590):startrace()
    
    audio.postevent("LOOP_BOSS_SETUP_STORM_BUILDING_STAGE1")
    audio.setstate("EXCITEMENT_LEVEL", "world1_tornado1")

  elseif message == "gearup" then
    if addtl == 1 then
      --      
      audio.postevent("LOOP_BOSS_SETUP_STORM_BUILDING_STAGE2")
      audio.setstate("EXCITEMENT_LEVEL", "world1_tornado2")

      --           
      gomgr.getbyoid(3243):addtoworld()
      gomgr.getbyoid(3246):addtoworld()
      gomgr.getbyoid(3247):addtoworld()
      gomgr.getbyoid(3251):addtoworld()
      
      gomgr.getbyoid(3227):dispatchlabel("up")

--                                        
--                                         
      
      gear = 1
    elseif addtl == 2 then
      --      
      audio.postevent("LOOP_BOSS_SETUP_STORM_BUILDING_STAGE3")
      audio.setstate("EXCITEMENT_LEVEL", "world1_tornado3")

      --                
      gomgr.getbyoid(3244):addtoworld()
      gomgr.getbyoid(3248):addtoworld()
      gomgr.getbyoid(3249):addtoworld()

      gomgr.getbyoid(3228):dispatchlabel("up")

--                                       
--                                         
      
      gear = 2
    end
  elseif message == "speedup" then
    gomgr.getbyoid(3098):addtoworld()
    gomgr.getbyoid(3141):childbyoid(3125):childbyoid(3129):childbyoid(619):removefromworld()
  elseif message == "slowdown" then
    gomgr.getbyoid(3098):removefromworld()
    gomgr.getbyoid(3141):childbyoid(3125):childbyoid(3129):childbyoid(619):addtoworld()
  end
end