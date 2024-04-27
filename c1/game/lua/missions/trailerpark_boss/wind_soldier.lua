function on_label(label)
  logline("on_label: " .. label)
  
  if label == "trainer_fly" then
    facingtornado = false
    stopallanims()
    --                             
    startanim("fly_away")
    pause(0.25)
    stopallanims()
    startanim("flying", 0.0, 1.0, 1.0, 0)
    movingalongpath = true
    wandervelocity = 1600
  end
  
  if label == "reset" then
    movingalongpath = false
    facingtornado = false
  end
end

function on_atpathend()
  logline("on_atpathend")
  movingalongpath = false
  stopallanims()
  startanim("tute_idle", 0.0, 1.0, 1.0, 0)
  facingtornado = true
  gameplaymgr.currentgameplaymodule:dispatchlabel("on_atpathend")
end
--
function on_postload()
  stopallanims()
  startanim("idle")
end

function on_atpathend()

end