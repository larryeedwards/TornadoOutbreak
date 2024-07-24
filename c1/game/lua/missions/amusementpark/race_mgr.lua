gear = 0
realfinish = false

function on_label(label)

  if label == "cinematic_start" then
    addstormendfx()
    
  end
end

function addstormendfx()
    --                
    gomgr.getbyoid(428):addtoworld()
    gomgr.getbyoid(433):addtoworld()
    gomgr.getbyoid(435):addtoworld()
    
    --                                                    
    
    gomgr.getbyoid(494):removefromworld()
    gomgr.getbyoid(495):removefromworld()
    gomgr.getbyoid(496):removefromworld()
    gomgr.getbyoid(497):removefromworld()
    gomgr.getbyoid(498):removefromworld()
    gomgr.getbyoid(499):removefromworld()
    gomgr.getbyoid(500):removefromworld()
    gomgr.getbyoid(501):removefromworld()
    gomgr.getbyoid(502):removefromworld()
    gomgr.getbyoid(503):removefromworld()
    gomgr.getbyoid(504):removefromworld()
    gomgr.getbyoid(505):removefromworld()
    gomgr.getbyoid(506):removefromworld()
    gomgr.getbyoid(507):removefromworld()
    gomgr.getbyoid(508):removefromworld()
    gomgr.getbyoid(509):removefromworld()
    gomgr.getbyoid(510):removefromworld()
    gomgr.getbyoid(511):removefromworld()
    gomgr.getbyoid(512):removefromworld()
    gomgr.getbyoid(513):removefromworld()
    gomgr.getbyoid(514):removefromworld()
    gomgr.getbyoid(515):removefromworld()
    gomgr.getbyoid(516):removefromworld()
    gomgr.getbyoid(517):removefromworld()
    gomgr.getbyoid(518):removefromworld()
    gomgr.getbyoid(519):removefromworld()
    gomgr.getbyoid(520):removefromworld()
    gomgr.getbyoid(521):removefromworld()
    gomgr.getbyoid(522):removefromworld()
    
    gomgr.getbyoid(485):removefromworld()
    gomgr.getbyoid(486):removefromworld()
    gomgr.getbyoid(487):removefromworld()
    gomgr.getbyoid(488):removefromworld()
    gomgr.getbyoid(489):removefromworld()
    gomgr.getbyoid(490):removefromworld()
    gomgr.getbyoid(491):removefromworld()
    gomgr.getbyoid(492):removefromworld()

    gomgr.getbyoid(436):addtoworld()
    gomgr.getbyoid(436):childbyoid(437):reset()
    gomgr.getbyoid(436):childbyoid(437):start()
    gomgr.getbyoid(438):addtoworld()
    
end

function on_raceaction(message, addtl)

  if message == "finished" then
  
    gomgr.getbyoid(259):removefromworld()
    
    realfinish = true
    gomgr.getbyoid(413):dispatchlabel("restartfires")
    gomgr.getbyoid(417):dispatchlabel("restartfires")
    gomgr.getbyoid(418):dispatchlabel("restartfires")
    beginwait()
      cinematic.play("cine_bosssetupB")
    endwait()
    gomgr.getbyoid(3816):requestcomplete(true)

  elseif message == "flyover" then
    engine.pushmode(1)
    gomgr.getbyoid(259).zoomfactor = 5.0
    
    cameramgr.matchcameras(4, 1)
    cameramgr.orbitlookat = gomgr.getbyoid(3817)
    cameramgr.activatecamerakind(4)
    gomgr.getbyoid(3817):startanim("flying")
    
    gomgr.getbyoid(16):setfujitarating(0.1)
    gomgr.getbyoid(3820):dispatchlabel("doit")

    gomgr.getbyoid(412):dispatchlabel("up")
--                                                                           
     
  elseif message == "failed" then
    pause(1)
    
    beginwait()
      uimgr.playracefail()
    endwait()
    
   if gear > 0 then
      gomgr.getbyoid(410):stopallanims()
      gomgr.getbyoid(410):startanim("down", 0, 1, 1, 1)
      if gear > 1 then
        gomgr.getbyoid(411):stopallanims()
        gomgr.getbyoid(411):startanim("down", 0, 1, 1, 1)
      end
    end
    
    gear = 0

    gomgr.getbyoid(426):removefromworld()
    gomgr.getbyoid(427):removefromworld()
    gomgr.getbyoid(428):removefromworld()
    gomgr.getbyoid(429):removefromworld()
    gomgr.getbyoid(430):removefromworld()
    gomgr.getbyoid(431):removefromworld()
    gomgr.getbyoid(432):removefromworld()
    gomgr.getbyoid(433):removefromworld()
    gomgr.getbyoid(434):removefromworld()
    gomgr.getbyoid(435):removefromworld()
    
    gomgr.getbyoid(16):warp(gomgr.getbyoid(234))
    gomgr.getbyoid(3821):startrace()
    
    audio.postevent("LOOP_BOSS_SETUP_STORM_BUILDING_STAGE1")
    audio.setstate("EXCITEMENT_LEVEL", "world1_tornado1")
    
elseif message == "gearup" then
    if addtl == 1 then
      --      
      audio.postevent("LOOP_BOSS_SETUP_STORM_BUILDING_STAGE2")
      audio.setstate("EXCITEMENT_LEVEL", "world1_tornado2")

      --           
      gomgr.getbyoid(426):addtoworld()
      gomgr.getbyoid(429):addtoworld()
      gomgr.getbyoid(430):addtoworld()
      gomgr.getbyoid(434):addtoworld()
      
      gomgr.getbyoid(410):stopallanims()
      gomgr.getbyoid(410):dispatchlabel("up")
--                                                                         

--                                        
--                                         
      
      gear = 1
    elseif addtl == 2 then
      --      
      audio.postevent("LOOP_BOSS_SETUP_STORM_BUILDING_STAGE3")
      audio.setstate("EXCITEMENT_LEVEL", "world1_tornado3")

      --                
      gomgr.getbyoid(427):addtoworld()
      gomgr.getbyoid(431):addtoworld()
      gomgr.getbyoid(432):addtoworld()

      gomgr.getbyoid(411):stopallanims()
      gomgr.getbyoid(411):dispatchlabel("up")
--                                                                             

--                                       
--                                         
      
      gear = 2
    end
  elseif message == "speedup" then
    gomgr.getbyoid(259):addtoworld()
    gomgr.getbyoid(303):childbyoid(304):childbyoid(308):childbyoid(309):removefromworld()
    gomgr.getbyoid(318):childbyoid(304):childbyoid(308):childbyoid(309):removefromworld()
    gomgr.getbyoid(321):childbyoid(304):childbyoid(308):childbyoid(309):removefromworld()
  elseif message == "slowdown" then
    gomgr.getbyoid(259):removefromworld()
    gomgr.getbyoid(303):childbyoid(304):childbyoid(308):childbyoid(309):addtoworld()
    gomgr.getbyoid(318):childbyoid(304):childbyoid(308):childbyoid(309):addtoworld()
    gomgr.getbyoid(321):childbyoid(304):childbyoid(308):childbyoid(309):addtoworld()
  end
end