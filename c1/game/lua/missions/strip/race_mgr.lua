gear = 0

function on_raceaction(message, addtl)
  if message == "finished" then
    gomgr.getbyoid(3998):requestcomplete(true)
    
  elseif message == "flyover" then
    engine.pushmode(1)
    gomgr.getbyoid(243).zoomfactor = 5.0
    
    cameramgr.matchcameras(4, 1)
    cameramgr.orbitlookat = gomgr.getbyoid(4000)
    cameramgr.activatecamerakind(4)
    gomgr.getbyoid(4000):startanim("flying")
    
    gomgr.getbyoid(4003):dispatchlabel("doit")

  elseif message == "failed" then

--                     
    if gear > 0 then
--                                                            
--                                                                           
      if gear > 1 then
--                                                             
--                                                                            
      end
    end
    
    gear = 0
    
    pause(1)
    
    beginwait()
      uimgr.playracefail()
    endwait()
    
    gomgr.getbyoid(544):removefromworld()
    gomgr.getbyoid(543):removefromworld()
    gomgr.getbyoid(542):removefromworld()
    gomgr.getbyoid(541):removefromworld()
    gomgr.getbyoid(540):removefromworld()
    gomgr.getbyoid(539):removefromworld()
    gomgr.getbyoid(538):removefromworld()
    gomgr.getbyoid(537):removefromworld()
    gomgr.getbyoid(536):removefromworld()
    gomgr.getbyoid(535):removefromworld()

    gomgr.getbyoid(16):warp(gomgr.getbyoid(226))
    gomgr.getbyoid(4004):startrace()
    
    audio.postevent("LOOP_BOSS_SETUP_STORM_BUILDING_STAGE1")
    audio.setstate("EXCITEMENT_LEVEL", "world1_tornado1")

  elseif message == "gearup" then
    if addtl == 1 then
      --      
      audio.postevent("LOOP_BOSS_SETUP_STORM_BUILDING_STAGE2")
      audio.setstate("EXCITEMENT_LEVEL", "world1_tornado2")

      --           
      gomgr.getbyoid(544):addtoworld()
      gomgr.getbyoid(541):addtoworld()
      gomgr.getbyoid(540):addtoworld()
      gomgr.getbyoid(536):addtoworld()
      
--                                                            
--                                                                         

--                                        
--                                         
      
      gear = 1
    elseif addtl == 2 then
      --      
      audio.postevent("LOOP_BOSS_SETUP_STORM_BUILDING_STAGE3")
      audio.setstate("EXCITEMENT_LEVEL", "world1_tornado3")

      --                
      gomgr.getbyoid(543):addtoworld()
      gomgr.getbyoid(539):addtoworld()
      gomgr.getbyoid(538):addtoworld()

--                                                           
--                                                                        

--                                       
--                                         
      
      gear = 2
    end
  elseif message == "speedup" then
    gomgr.getbyoid(243):addtoworld()
    gomgr.getbyoid(509):addtoworld()
    gomgr.getbyoid(510):addtoworld()
    gomgr.getbyoid(511):addtoworld()
    
  elseif message == "slowdown" then
    gomgr.getbyoid(243):removefromworld()
    gomgr.getbyoid(509):removefromworld()
    gomgr.getbyoid(510):removefromworld()
    gomgr.getbyoid(511):removefromworld()
  end
end