knockback_active = false

function on_label(label)

  if label == "launch" then
    knockback_avatar(true, false, 0)
  elseif label == "launch2" then
    knockback_avatar(true, false, 1)
  elseif label == "launch_totem" then
    knockback_avatar(false, false, 0)
  elseif label == "launch_totem_success" then
    knockback_avatar(false, true, 0)
  elseif label == "launch_totem2" then
    knockback_avatar(false, true, 1)
  elseif label == "launch_totem2_success" then
    knockback_avatar(false, true, 1)
  end
end

function knockback_avatar(from_field, success, i_player)
  if engine.isingamemode == false then
    return
  end
  
  if knockback_active == true then
    return
  end
  
  if taworld.gettornado(i_player) == nil then
    return
  end
  
  knockback_active = true
  engine.pushmode(1)
  
  local the_tornado
  if i_player == 0 then
    logline("0")
    the_tornado = gomgr.getbyoid(16)
  else
    logline("1")
    the_tornado = gomgr.getbyoid(1639)
  end
  
  gomgr.getbyoid(1682):warp(the_tornado)

  local orbitcam = cameramgr.getorbitcamera(i_player)
  orbitcam.offsetx = 0
  orbitcam.offsety = 300
  cameramgr.orbitoffsetz = 5000
  
  --                                                                                  
  local knockback_object
  
  if success == true then
    knockback_object = gomgr.getbyoid(1681)
  else
    knockback_object = gomgr.getbyoid(1680)
    --           
    gomgr.getbyoid(170).particlesizepercentadjustment = 0.5
    gomgr.getbyoid(170).externalmatrix = knockback_object
    gomgr.getbyoid(170):stop()
    gomgr.getbyoid(170):reset()
    gomgr.getbyoid(170):start()
  end

  --                                                                       
  knockback_object:addtoworld()
  knockback_object:warp(the_tornado)
  
  if success == true then
    knockback_object:stopallanims()
    knockback_object:startanim("spin")
    knockback_object:childbyoid(1637):reset()
    knockback_object:childbyoid(1637):start()
    knockback_object:childbyoid(1638):reset()
    knockback_object:childbyoid(1638):start()
  end
  
  the_tornado:warp(gomgr.getbyoid(306))
  cameramgr.orbitlookat = gomgr.getbyoid(1682)

  --                                  
  if from_field == true then
    --                                       
    cameramgr.matchcameras(4, 7)
    cameramgr.activatecamera(i_player, 4, 0)
    orbitcam.offsetz = 3000

    --                                
    knockback_object:stopallanims()
    knockback_object:startanim("idle")
  
    pause (1)
    
    --                                        
    gomgr.getbyoid(1679):warp(knockback_object)
    gomgr.getbyoid(1679):reset()
    gomgr.getbyoid(1679):start()
    
  end
  
  --                                      
  if success == false then
    knockback_object:stopallanims()
    knockback_object:startanim("flipping")
  end
  
  --                                                                                           
  pause(0.01)
  
  --                                                              
  knockback_object:launchtogameobject(gomgr.getbyoid(1680), gomgr.getbyoid(263), 2, 0.5)
  
  --                  
  if from_field == true then
    pause(0.75)
  else
	cameramgr.matchcameras(4, 7)
    cameramgr.activatecamera(i_player, 4, 0)
    orbitcam.offsetz = 3000
    pause(1.25)
  end

  --                                     
  cameramgr.orbitlookat = gomgr.getbyoid(263)
  cameramgr.bosssvfocuslimit = 50000000.0
  cameramgr.bosssvoffsetlimit = 50000000.0
  cameramgr.bosssvelevlimit = 50000000.0

  if from_field == true then
	pause(1.25)
  else
    pause(0.75)
  end
  
  the_tornado:warp(gomgr.getbyoid(305))
  
  if success == true then
    knockback_object:launchtogameobject(gomgr.getbyoid(263), gomgr.getbyoid(263), 1.0)
    pause(0.65)

    knockback_object:removefromworld()
    knockback_object:stopallanims()
    knockback_object:childbyoid(1637):stop()
    knockback_object:childbyoid(1638):stop()
  else
    knockback_object:launchtogameobject(gomgr.getbyoid(263), gomgr.getbyoid(263), 0.75)
    pause(0.75)
    --                
    gomgr.getbyoid(170):stop()

    knockback_object:stopallanims()
    knockback_object:startanim("stunned")
  
    pause(1.15)
  end
  
  knockback_object:removefromworld()
  the_tornado:warp(gomgr.getbyoid(263))

  pause(0.1)  
  cameramgr.bosssvfocuslimit = 50000.0
  cameramgr.bosssvoffsetlimit = 50000.0
  cameramgr.bosssvelevlimit = 1.0

  --                                                 
  cameramgr.deactivatecamera(i_player, 4, 0)
  engine.popmode(1)

  knockback_active = false
end