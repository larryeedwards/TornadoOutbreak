realcine = false

function on_gameplaymoduleactive()
  realcine = true
  engine.pushmode(1)

  beginwait()
    cinematic.play("cine_bossdestroy")
  endwait()

  pause(1)
  requestcomplete(true)
end

function on_label(label)

  if label == "cinematic_start" then

   tagamestats.unlockaward(0, 0)

--                                        
--                                                   
    gomgr.getbyoid(453):addtoworld()
    gomgr.getbyoid(2780):removefromworld()
    gomgr.getbyoid(264):dispatchlabel("weatherphase1")

   gomgr.getbyoid(3584):removefromworld()
   gomgr.getbyoid(3586):removefromworld()
   gomgr.getbyoid(3587):removefromworld()
   gomgr.getbyoid(3588):removefromworld()
   gomgr.getbyoid(3589):removefromworld()
   gomgr.getbyoid(429):dispatchlabel("remove")
   gomgr.getbyoid(60):dispatchlabel("reset")
   
    if realcine == false then
      gomgr.getbyoid(453):stopallanims()
--                                            
--                                                 
    end

 elseif label == "cinematic_explode" then
   gomgr.getbyoid(60):dispatchlabel("blowitup")
--                                                                     

--                                                  
--                                                                  
--                                         
--                                              
   gomgr.getbyoid(453):startanim("talking", 0.0, 1.0, 1.0, 0)

  elseif label == "cinematic_calming" then
--                                           
--                                                
--                                                     

  elseif label == "cinematic_at_end" then
    if realcine == false then
      fadeout()
    end
 end

end

function fadeout()
    cameramgr.screenfade(0, 0.1, 0.25, 1.5)
    pause(0.15)
end