--                            
triggerslowdown = nil
cinematic = nil
zephyr = nil
targetspeed = 2500.0
minimumspeed = 100
startloops = 30
startloopspause = 0.1
endloops = 20
endloopspause = 0.05
looping = false

--   
function showAccoutrements()
  local accoutrement = tagamestats.getenabledaccoutrement(0)
  logline("changing accoutrement" .. accoutrement .. " none = " .. 0 .. " cape = " .. 1 ) 

  if accoutrement == 0 then
    --          
    logline(" hide all accoutrements.")
    setvisiblefromatomid(171, false)
    setvisiblefromatomid(172, false)
    setvisiblefromatomid(173, false)

  elseif accoutrement == 1 then
    --                             
    logline(" show all accoutrements.")
    setvisiblefromatomid(171, true)
    setvisiblefromatomid(172, true)
    setvisiblefromatomid(173, true)
  end
end


function on_postload()
--                                                 
--                                  
--                           
  showAccoutrements()
end

function on_addtoworld()
  showAccoutrements()
end

function on_label(label)
  logline("on_label: " .. label)
  

  
  if label == "cine_fly" then
    addtoworld()
    resetmovingalongpath()
    movingalongpath = true
    set_avatar_speed(targetspeed)
    stopallanims()
    startanim("wander", 0.0, 1.0, 1.0, 0)
    
    zephyr:addtoworld()
    zephyr:resetmovingalongpath()
    zephyr.movingalongpath = true
    set_zephyr_speed(targetspeed)
    zephyr:stopallanims()
    zephyr:startanim("cine_wander", 0.0, 1.0, 1.0, 0)
  
  elseif label == "cine_fly_rampup" then
    addtoworld()
    resetmovingalongpath()
    movingalongpath = true
    set_avatar_speed(10)
    stopallanims()
    startanim("wander", 0.0, 1.0, 1.0, 0)
    
    zephyr:addtoworld()
    zephyr:resetmovingalongpath()
    zephyr.movingalongpath = true
    set_zephyr_speed(10)
    zephyr:stopallanims()
    zephyr:startanim("cine_wander", 0.0, 1.0, 1.0, 0)
    showAccoutrements()
    pause(0.1)

    --                        
    for i = 1, startloops do
      pause(startloopspause)
      newspeedstart = i*(targetspeed/startloops)
      set_avatar_speed(newspeedstart)
      set_zephyr_speed(newspeedstart)
   end

  elseif label == "reset" then
    movingalongpath = false
    
  elseif label == "slowdown" then
    local dist = 1000
    local counter = 0
    while dist > 30 do
      dist = math.sqrt(math.pow(this.pos.x - triggerslowdown.pos.x, 2) + math.pow(this.pos.y - triggerslowdown.pos.y, 2))
      local newspeedend = (1000 - dist)/1000
      newspeedend = newspeedend * newspeedend
      newspeedend = targetspeed - (targetspeed * newspeedend)
      if newspeedend > minimumspeed then
        set_avatar_speed(newspeedend)    
      end
      counter = counter + 1
      if counter > 100 then
        error("Object never reaches destination along spline.  The spline for %s should pass through the center of %s", this, triggerslowdown)
      end
      pause(endloopspause)
    end
    movingalongpath = false
    triggerslowdown:removefromworld()
  
    stopallanims()
    beginwait()
      startanimandwait("land")
    endwait()
    removefromworld()
    
    cinematic:dispatchlabel("cinematic_avatar_at_end")
  
  elseif label == "idle" then
    addtoworld()
    movingalongpath = false
    wandervelocity = 0
    stopallanims()
    startanim("idle", 0.0, 1.0, 1.0, 0)
  
  elseif label == "loopingidleoff" then
    looping = false
    removefromworld()
  
  elseif label == "loopingidle" then
    looping = true
    addtoworld()
    movingalongpath = false
    wandervelocity = 0
    startanim("idle", 0.0, 1.0, 1.0, 0)
    
    while looping == true do
      if isplayinganyanim == false then
        startanim("idle", 0.0, 1.0, 1.0, 0)
      end
      pause(0.01)
    end
  end

  showAccoutrements()
end

function set_avatar_speed(clonespeed)
  wandervelocity = clonespeed
end

function set_zephyr_speed(clonespeed)
  zephyr.wandervelocity = clonespeed
end