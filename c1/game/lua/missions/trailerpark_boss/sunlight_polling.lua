in_recharge = false
in_recharge2 = false
world_sprites = {}
world_sprites2 = {}
in_struggle = false

function on_postload()
  world_sprites[1] = gomgr.getbyoid(1666)
  world_sprites[2] = gomgr.getbyoid(1668)
  world_sprites[3] = gomgr.getbyoid(1669)
  world_sprites[4] = gomgr.getbyoid(1670)
  world_sprites[5] = gomgr.getbyoid(1671)
  
  world_sprites2[1] = gomgr.getbyoid(1672)
  world_sprites2[2] = gomgr.getbyoid(1673)
  world_sprites2[3] = gomgr.getbyoid(1674)
  world_sprites2[4] = gomgr.getbyoid(1675)
  world_sprites2[5] = gomgr.getbyoid(1676)
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
    gomgr.getbyoid(1639).currenthealth = 5
    gomgr.getbyoid(1682):dispatchlabel("launch_totem")
  
  elseif label == "zerohealth_success" then
    gomgr.getbyoid(16):postaudioevent("PLAY_BOSS_STRUGGLE_RESET_SUCCESS")
    gomgr.getbyoid(16).currenthealth = 5
    gomgr.getbyoid(1639).currenthealth = 5
    gomgr.getbyoid(1682):dispatchlabel("launch_totem_success")
  
  elseif label == "zerohealth2" then
    gomgr.getbyoid(1639):postaudioevent("PLAY_BOSS_STRUGGLE_RESET_SUCCESS")
    gomgr.getbyoid(16).currenthealth = 5
    gomgr.getbyoid(1639).currenthealth = 5
    gomgr.getbyoid(1682):dispatchlabel("launch_totem2")
    
  elseif label == "zerohealth2_success" then
    gomgr.getbyoid(1639):postaudioevent("PLAY_BOSS_STRUGGLE_RESET_SUCCESS")
    gomgr.getbyoid(16).currenthealth = 5
    gomgr.getbyoid(1639).currenthealth = 5
    gomgr.getbyoid(1682):dispatchlabel("launch_totem2_success")
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
  reset_sprites2(gomgr.getbyoid(1639).currenthealth)
  pause(1)

  while poll == true do
  
    local oldhealth = gomgr.getbyoid(16).currenthealth
    local oldhealth2 = gomgr.getbyoid(1639).currenthealth

    if in_struggle == false then
      --                                        
      --                                        
      --                                        
      
      if in_recharge == false and taworld.gettornado(0) ~= nil then
        if gomgr.getbyoid(431).fujitarating < 0 then
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
        if gomgr.getbyoid(1677).fujitarating < 0 then
          if gomgr.getbyoid(1639).currenthealth > 0 then
            gomgr.getbyoid(1639):removefromcurrenthealth(1)
          end
        end
      else
        if gomgr.getbyoid(1639).currenthealth < 5 then
          gomgr.getbyoid(1639):addtocurrenthealth(1)
        end
      end

    end

    pause(0.5)
    
    local newhealth = gomgr.getbyoid(16).currenthealth
    update_sprites(oldhealth, newhealth)
    local newhealth2 = gomgr.getbyoid(1639).currenthealth
    update_sprites2(oldhealth2, newhealth2)

    if in_struggle == false then
      if gomgr.getbyoid(16).currenthealth == 0 then
        pause(0.75)
        gomgr.getbyoid(16):postaudioevent("PLAY_BOSS_STRUGGLE_RESET_FAILURE")
        reset_sprites(0)
        gomgr.getbyoid(1682):dispatchlabel("launch")
      end
    
      if gomgr.getbyoid(1639).currenthealth == 0 then
        pause(0.75)
        gomgr.getbyoid(1639):postaudioevent("PLAY_BOSS_STRUGGLE_RESET_FAILURE")
        reset_sprites2(0)
        gomgr.getbyoid(1682):dispatchlabel("launch2")
      end
    end
  end
end