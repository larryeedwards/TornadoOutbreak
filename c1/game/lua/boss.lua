--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
  A   Dú         p?€          ÿÿÿÿ           d            =ÌÌÍÿÿÿÿ          BH      D–      B4      Bð      ÿÿÿÿ  c    ÿÿÿÿÿÿÿÿ   Dz                     ?€                  ?€                  ?€                  ?€  B1(BH             ¿€  ¿€  ¿€  ¿€  ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ                   |sunlight_polling    boss.lua: line 84    <ÿ  ƒ--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--                                
--                             
--                                      
--                                                 
in_recharge = false
in_recharge2 = false
world_sprites = {}
world_sprites2 = {}
in_struggle = false

function on_postload()
  world_sprites[1] = gomgr.getbyoid(3584)
  world_sprites[2] = gomgr.getbyoid(3586)
  world_sprites[3] = gomgr.getbyoid(3587)
  world_sprites[4] = gomgr.getbyoid(3588)
  world_sprites[5] = gomgr.getbyoid(3589)
  
  world_sprites2[1] = gomgr.getbyoid(3590)
  world_sprites2[2] = gomgr.getbyoid(3591)
  world_sprites2[3] = gomgr.getbyoid(3592)
  world_sprites2[4] = gomgr.getbyoid(3593)
  world_sprites2[5] = gomgr.getbyoid(3594)
end

function on_label(label)

  if label == "begin" then
    startpolling()
  elseif label == "in_struggle" then
    in_struggle = true
  elseif label == "out_struggle" then
    in_struggle = false
  elseif label == "inrecharge" then
    in_recharge = true
  elseif label == "outrecharge" then
    in_recharge = false
  elseif label == "inrecharge2" then
    in_recharge2 = true
  elseif label == "outrecharge2" then
    in_recharge2 = false
  elseif label == "useapproachwarp2" then
    useapproachwarp2 = true
    
  elseif label == "zerohealth" then
    gomgr.getbyoid(16):postaudioevent("PLAY_BOSS_STRUGGLE_RESET_SUCCESS")
    gomgr.getbyoid(16).currenthealth = 5
    gomgr.getbyoid(3550).currenthealth = 5
    gomgr.getbyoid(3600):dispatchlabel("launch_totem")
  
  elseif label == "zerohealth_success" then
    gomgr.getbyoid(16):postaudioevent("PLAY_BOSS_STRUGGLE_RESET_SUCCESS")
    gomgr.getbyoid(16).currenthealth = 5
    gomgr.getbyoid(3550).currenthealth = 5
    gomgr.getbyoid(3600):dispatchlabel("launch_totem_success")
  
  elseif label == "zerohealth2" then
    gomgr.getbyoid(3550):postaudioevent("PLAY_BOSS_STRUGGLE_RESET_SUCCESS")
    gomgr.getbyoid(16).currenthealth = 5
    gomgr.getbyoid(3550).currenthealth = 5
    gomgr.getbyoid(3600):dispatchlabel("launch_totem2")
    
  elseif label == "zerohealth2_success" then
    gomgr.getbyoid(3550):postaudioevent("PLAY_BOSS_STRUGGLE_RESET_SUCCESS")
    gomgr.getbyoid(16).currenthealth = 5
    gomgr.getbyoid(3550).currenthealth = 5
    gomgr.getbyoid(3600):dispatchlabel("launch_totem2_success")
  end
end

function reset_sprites(health)
  for i = 1, 5 do
    world_sprites[i]:stopflying()
    world_sprites[i]:addtoworld()
  end

  for i = 1, health do
    world_sprites[i]:startflying(i - 1)
  end
end

function reset_sprites2(health)
  for i = 1, 5 do
    world_sprites2[i]:stopflying()
    world_sprites2[i]:addtoworld()
  end

  for i = 1, health do
    world_sprites2[i]:startflying(i - 1)
  end
end

function update_sprites(oldhealth, newhealth)
  if oldhealth == newhealth then
    return
  end
  
  if taworld.gettornado(0) ~= nil then
    tornadomgr.updatewindsoldiermeter(newhealth)
  end
  
  if oldhealth < newhealth then
    for i = oldhealth + 1, newhealth do
      world_sprites[i]:startflying(i - 1)
    end
  else
    for i = oldhealth, newhealth + 1, -1 do
      world_sprites[i]:stopflying()
      world_sprites[i]:dispatchlabel("poof")
    end
  end
end

function update_sprites2(oldhealth, newhealth)
  if oldhealth == newhealth then
    return
  end
  
  if taworld.gettornado(1) ~= nil then
    tornadomgr.updatewindsoldiermeter(newhealth)
  end
  
  if oldhealth < newhealth then
    for i = oldhealth + 1, newhealth do
      world_sprites2[i]:startflying(i - 1)
    end
  else
    for i = oldhealth, newhealth + 1, -1 do
      world_sprites2[i]:stopflying()
      world_sprites2[i]:dispatchlabel("poof")
    end
  end
end

function startpolling()

  poll = true
  tornadomgr.showwindsoldiermeter()
  reset_sprites(gomgr.getbyoid(16).currenthealth)
  reset_sprites2(gomgr.getbyoid(3550).currenthealth)
  pause(1)

  while poll == true do
  
    local oldhealth = gomgr.getbyoid(16).currenthealth
    local oldhealth2 = gomgr.getbyoid(3550).currenthealth

    if in_struggle == false then
      --                                        
      --                                        
      --                                        
      
      if in_recharge == false and taworld.gettornado(0) ~= nil then
        if gomgr.getbyoid(210).fujitarating < 0 then
          if gomgr.getbyoid(16).currenthealth > 0 then
            gomgr.getbyoid(16):removefromcurrenthealth(1)
          end
        end
      else
        if gomgr.getbyoid(16).currenthealth < 5 then
          gomgr.getbyoid(16):addtocurrenthealth(1)
        end
      end

      --                                        
      --                                        
      --                                        

      if in_recharge2 == false and taworld.gettornado(1) ~= nil then
        if gomgr.getbyoid(3595).fujitarating < 0 then
          if gomgr.getbyoid(3550).currenthealth > 0 then
            gomgr.getbyoid(3550):removefromcurrenthealth(1)
          end
        end
      else
        if gomgr.getbyoid(3550).currenthealth < 5 then
          gomgr.getbyoid(3550):addtocurrenthealth(1)
        end
      end

    end

    pause(0.5)
    
    local newhealth = gomgr.getbyoid(16).currenthealth
    update_sprites(oldhealth, newhealth)
    local newhealth2 = gomgr.getbyoid(3550).currenthealth
    update_sprites2(oldhealth2, newhealth2)

    if in_struggle == false then
      if gomgr.getbyoid(16).currenthealth == 0 then
        pause(0.75)
        gomgr.getbyoid(16):postaudioevent("PLAY_BOSS_STRUGGLE_RESET_FAILURE")
        reset_sprites(0)
        gomgr.getbyoid(3600):dispatchlabel("launch")
      end
    
      if gomgr.getbyoid(3550).currenthealth == 0 then
        pause(0.75)
        gomgr.getbyoid(3550):postaudioevent("PLAY_BOSS_STRUGGLE_RESET_FAILURE")
        reset_sprites2(0)
        gomgr.getbyoid(3600):dispatchlabel("launch2")
      end
    end
  end
end

--                                                 
--                                                 
--                                               
--                                                 
--                                                 

--                                                 
--                                           
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--                                
--                                      
--                                
--                                                 
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
    the_tornado = gomgr.getbyoid(3550)
  end
  
  gomgr.getbyoid(3600):warp(the_tornado)

  local orbitcam = cameramgr.getorbitcamera(i_player)
  orbitcam.offsetx = 0
  orbitcam.offsety = 300
  cameramgr.orbitoffsetz = 5000
  
  --                                                                                  
  local knockback_object
  
  if success == true then
    knockback_object = gomgr.getbyoid(3599)
  else
    knockback_object = gomgr.getbyoid(3598)
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
    knockback_object:childbyoid(3548):reset()
    knockback_object:childbyoid(3548):start()
    knockback_object:childbyoid(3549):reset()
    knockback_object:childbyoid(3549):start()
  end
  
  the_tornado:warp(gomgr.getbyoid(213))
  cameramgr.orbitlookat = gomgr.getbyoid(3600)

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
    gomgr.getbyoid(3597):warp(knockback_object)
    gomgr.getbyoid(3597):reset()
    gomgr.getbyoid(3597):start()
    
  end
  
  --                                      
  if success == false then
    knockback_object:stopallanims()
    knockback_object:startanim("flipping")
  end
  
  --                                                                                           
  pause(0.01)
  
  --                                                              
  knockback_object:launchtogameobject(gomgr.getbyoid(3598), gomgr.getbyoid(256), 2, 0.5)
  
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
  cameramgr.orbitlookat = gomgr.getbyoid(256)
  cameramgr.bosssvfocuslimit = 50000000.0
  cameramgr.bosssvoffsetlimit = 50000000.0
  cameramgr.bosssvelevlimit = 50000000.0

  if from_field == true then
	pause(1.25)
  else
    pause(0.75)
  end
  
  the_tornado:warp(gomgr.getbyoid(212))
  
  if success == true then
    knockback_object:launchtogameobject(gomgr.getbyoid(256), gomgr.getbyoid(256), 1.0)
    pause(0.65)

    knockback_object:removefromworld()
    knockback_object:stopallanims()
    knockback_object:childbyoid(3548):stop()
    knockback_object:childbyoid(3549):stop()
  else
    knockback_object:launchtogameobject(gomgr.getbyoid(256), gomgr.getbyoid(256), 0.75)
    pause(0.75)
    --                
    gomgr.getbyoid(170):stop()

    knockback_object:stopallanims()
    knockback_object:startanim("stunned")
  
    pause(1.15)
  end
  
  knockback_object:removefromworld()
  the_tornado:warp(gomgr.getbyoid(256))

  pause(0.1)  
  cameramgr.bosssvfocuslimit = 50000.0
  cameramgr.bosssvoffsetlimit = 50000.0
  cameramgr.bosssvelevlimit = 1.0

  --                                                 
  cameramgr.deactivatecamera(i_player, 4, 0)
  engine.popmode(1)

  knockback_active = false
end
--
--
--
--
--
--
--
--                            
--                                 
--                       
--                   
--                                                 
function on_label(label)
  if label == "inspot" then
    this.fujitarating = this.fujitarating + 1
  elseif label == "outspot" then
    this.fujitarating = this.fujitarating - 1
  elseif label == "safe" then
    this.fujitarating = this.fujitarating + 1
  elseif label == "unsafe" then
    this.fujitarating = this.fujitarating - 1
  elseif label == "super_safe" then
    this.fujitarating = this.fujitarating + 10
  elseif label == "super_unsafe" then
    this.fujitarating = this.fujitarating - 10
  end
end
--                                                 
--                                
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
  A   Dú         p?€          ÿÿÿÿ           d            =ÌÌÍÿÿÿÿ          BH      D–      B4      Bð      ÿÿÿÿ  c    ÿÿÿÿÿÿÿÿ   Dz                     ?€                  ?€                  ?€                  ?€  B1(BH             ¿€  ¿€  ¿€  ¿€  ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ                   |sunlight_polling    boss.lua: line 84    <ÿ  ƒ--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--                                
--                             
--                                      
--                                                 
in_recharge = false
in_recharge2 = false
world_sprites = {}
world_sprites2 = {}
in_struggle = false

function on_postload()
  world_sprites[1] = gomgr.getbyoid(3584)
  world_sprites[2] = gomgr.getbyoid(3586)
  world_sprites[3] = gomgr.getbyoid(3587)
  world_sprites[4] = gomgr.getbyoid(3588)
  world_sprites[5] = gomgr.getbyoid(3589)
  
  world_sprites2[1] = gomgr.getbyoid(3590)
  world_sprites2[2] = gomgr.getbyoid(3591)
  world_sprites2[3] = gomgr.getbyoid(3592)
  world_sprites2[4] = gomgr.getbyoid(3593)
  world_sprites2[5] = gomgr.getbyoid(3594)
end

function on_label(label)

  if label == "begin" then
    startpolling()
  elseif label == "in_struggle" then
    in_struggle = true
  elseif label == "out_struggle" then
    in_struggle = false
  elseif label == "inrecharge" then
    in_recharge = true
  elseif label == "outrecharge" then
    in_recharge = false
  elseif label == "inrecharge2" then
    in_recharge2 = true
  elseif label == "outrecharge2" then
    in_recharge2 = false
  elseif label == "useapproachwarp2" then
    useapproachwarp2 = true
    
  elseif label == "zerohealth" then
    gomgr.getbyoid(16):postaudioevent("PLAY_BOSS_STRUGGLE_RESET_SUCCESS")
    gomgr.getbyoid(16).currenthealth = 5
    gomgr.getbyoid(3550).currenthealth = 5
    gomgr.getbyoid(3600):dispatchlabel("launch_totem")
  
  elseif label == "zerohealth_success" then
    gomgr.getbyoid(16):postaudioevent("PLAY_BOSS_STRUGGLE_RESET_SUCCESS")
    gomgr.getbyoid(16).currenthealth = 5
    gomgr.getbyoid(3550).currenthealth = 5
    gomgr.getbyoid(3600):dispatchlabel("launch_totem_success")
  
  elseif label == "zerohealth2" then
    gomgr.getbyoid(3550):postaudioevent("PLAY_BOSS_STRUGGLE_RESET_SUCCESS")
    gomgr.getbyoid(16).currenthealth = 5
    gomgr.getbyoid(3550).currenthealth = 5
    gomgr.getbyoid(3600):dispatchlabel("launch_totem2")
    
  elseif label == "zerohealth2_success" then
    gomgr.getbyoid(3550):postaudioevent("PLAY_BOSS_STRUGGLE_RESET_SUCCESS")
    gomgr.getbyoid(16).currenthealth = 5
    gomgr.getbyoid(3550).currenthealth = 5
    gomgr.getbyoid(3600):dispatchlabel("launch_totem2_success")
  end
end

function reset_sprites(health)
  for i = 1, 5 do
    world_sprites[i]:stopflying()
    world_sprites[i]:addtoworld()
  end

  for i = 1, health do
    world_sprites[i]:startflying(i - 1)
  end
end

function reset_sprites2(health)
  for i = 1, 5 do
    world_sprites2[i]:stopflying()
    world_sprites2[i]:addtoworld()
  end

  for i = 1, health do
    world_sprites2[i]:startflying(i - 1)
  end
end

function update_sprites(oldhealth, newhealth)
  if oldhealth == newhealth then
    return
  end
  
  if taworld.gettornado(0) ~= nil then
    tornadomgr.updatewindsoldiermeter(newhealth)
  end
  
  if oldhealth < newhealth then
    for i = oldhealth + 1, newhealth do
      world_sprites[i]:startflying(i - 1)
    end
  else
    for i = oldhealth, newhealth + 1, -1 do
      world_sprites[i]:stopflying()
      world_sprites[i]:dispatchlabel("poof")
    end
  end
end

function update_sprites2(oldhealth, newhealth)
  if oldhealth == newhealth then
    return
  end
  
  if taworld.gettornado(1) ~= nil then
    tornadomgr.updatewindsoldiermeter(newhealth)
  end
  
  if oldhealth < newhealth then
    for i = oldhealth + 1, newhealth do
      world_sprites2[i]:startflying(i - 1)
    end
  else
    for i = oldhealth, newhealth + 1, -1 do
      world_sprites2[i]:stopflying()
      world_sprites2[i]:dispatchlabel("poof")
    end
  end
end

function startpolling()

  poll = true
  tornadomgr.showwindsoldiermeter()
  reset_sprites(gomgr.getbyoid(16).currenthealth)
  reset_sprites2(gomgr.getbyoid(3550).currenthealth)
  pause(1)

  while poll == true do
  
    local oldhealth = gomgr.getbyoid(16).currenthealth
    local oldhealth2 = gomgr.getbyoid(3550).currenthealth

    if in_struggle == false then
      --                                        
      --                                        
      --                                        
      
      if in_recharge == false and taworld.gettornado(0) ~= nil then
        if gomgr.getbyoid(210).fujitarating < 0 then
          if gomgr.getbyoid(16).currenthealth > 0 then
            gomgr.getbyoid(16):removefromcurrenthealth(1)
          end
        end
      else
        if gomgr.getbyoid(16).currenthealth < 5 then
          gomgr.getbyoid(16):addtocurrenthealth(1)
        end
      end

      --                                        
      --                                        
      --                                        

      if in_recharge2 == false and taworld.gettornado(1) ~= nil then
        if gomgr.getbyoid(3595).fujitarating < 0 then
          if gomgr.getbyoid(3550).currenthealth > 0 then
            gomgr.getbyoid(3550):removefromcurrenthealth(1)
          end
        end
      else
        if gomgr.getbyoid(3550).currenthealth < 5 then
          gomgr.getbyoid(3550):addtocurrenthealth(1)
        end
      end

    end

    pause(0.5)
    
    local newhealth = gomgr.getbyoid(16).currenthealth
    update_sprites(oldhealth, newhealth)
    local newhealth2 = gomgr.getbyoid(3550).currenthealth
    update_sprites2(oldhealth2, newhealth2)

    if in_struggle == false then
      if gomgr.getbyoid(16).currenthealth == 0 then
        pause(0.75)
        gomgr.getbyoid(16):postaudioevent("PLAY_BOSS_STRUGGLE_RESET_FAILURE")
        reset_sprites(0)
        gomgr.getbyoid(3600):dispatchlabel("launch")
      end
    
      if gomgr.getbyoid(3550).currenthealth == 0 then
        pause(0.75)
        gomgr.getbyoid(3550):postaudioevent("PLAY_BOSS_STRUGGLE_RESET_FAILURE")
        reset_sprites2(0)
        gomgr.getbyoid(3600):dispatchlabel("launch2")
      end
    end
  end
end

--                                                 
--                                                 
--                                               
--                                                 
--                                                 

--                                                 
--                                           
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--