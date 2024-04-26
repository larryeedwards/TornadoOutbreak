--                            
splitpath = nil
triggerslowdown = nil
weathersystem = nil
weathersystemtransition = nil
movingshadow = nil
mission = nil
targetspeed = 0.0
minimumspeed = 500
startloops = 30
startloopspause = 0.05
endloops = 25
endloopspause = 0.07
clone_finished = false
cinematic_finished = false

--                                                                               
function on_postload()
--                                          
--                                                 
--                                                
--                                                              
--                                              
--                                    
end


function on_label(label)
  if label == "tornado_animate" then
    clone_animate()
    
--                                          
  elseif label == "slowdown" and clone_finished == false then
    triggerslowdown:removefromworld()
    --          
    for i = 1, endloops do
      newspeedend = targetspeed - (i * ((targetspeed / endloops) + 100))
      if newspeedend > minimumspeed then
        set_clone_speed(newspeedend)
      end
      --                                                                                     
      --                                                              
      pause(endloopspause)
--                                                
    end
    
--                                  
  elseif label == "cinematic_at_end" then
    if clone_finished == true then
      clone_cinematic_finish()
    else
      cinematic_finished = true
    end
  end
end


function clone_animate()
  clone_finished = false
  cinematic_finished = false
  --                                                  
  set_weather()

  --                                                      
  this:addtoworld()
  this.path = splitpath
  set_clone_speed(10)
  this:resetmovingalongpath()
  movingshadow.trackedobject = this
  pause(1.5)
  triggerslowdown:addtoworld()

  --                        
  for i = 1, startloops do
    pause(startloopspause)
    newspeedstart = i*(targetspeed/startloops)
    set_clone_speed(newspeedstart)
  end
end


function set_weather()
  weathersystemtransition:dispatchlabel("weatherphase1")
  weathersystem:dispatchlabel("weatherphase0")
end


function set_clone_speed(clonespeed)
  this.wandervelocity = clonespeed
  this.alertvelocity = clonespeed
  this.panicvelocity = clonespeed
end


function on_atpathend(path)
 if path == splitpath then
    --                      
    movingshadow:cleartrackedobject()
    --                                               
    set_clone_speed(0)
    if cinematic_finished == true then
      clone_finished = true
      clone_cinematic_finish()
    else
      clone_finished = true
    end
  end
end


function  clone_cinematic_finish()
    audio.postevent("Play_Tornado_Merge")
    this:removefromworld()
    mission:dispatchlabel("splitclone_at_end")
end