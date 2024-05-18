function on_animtag(animname, animtag)
  if animname == "spinup" then
    if animtag == "fx_swirlies" then
      fx = childbyoid(388)
      fx:addtoworld()
      fx:reset()
      fx:start()
    end
  end
end

function on_label(label)
  logline("on_label: " .. label)
  
  if label == "trainer_fly" then
    shouldfacetornado = false
    stopallanims()
    --                             
    startanim("fly_away")
    pause(0.25)
    stopallanims()
    startanim("flying", 0.0, 1.0, 1.0, 0)
    movingalongpath = true
    wandervelocity = 1600
  end
  
  if label == "idle" then
    movingalongpath = false
    wandervelocity = 0
    stopallanims()
    startanim("tute_idle", 0.0, 1.0, 1.0, 0)
  end
  
  if label == "reset" then
    movingalongpath = false
    shouldfacetornado = false
  end
end

function on_atpathend()
  logline("on_atpathend")
  movingalongpath = false
  stopallanims()
  startanim("tute_idle", 0.0, 1.0, 1.0, 0)
  shouldfacetornado = true
  gameplaymgr.currentgameplaymodule:dispatchlabel("on_atpathend")
end

function on_postload()
  shouldfacetornado = true
  stopallanims()
  startanim("tute_idle", 0.0, 1.0, 1.0, 0)
end