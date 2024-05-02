function on_animtag(animname, animtag)
  if animname == "spinup" then 
    if animtag == "fx_swirlies" then
      fx = childbyoid(3135)
      fx:addtoworld()
      fx:reset()
      fx:start()
    end
  end
end

landing = false
function on_label(label)

  if label == "land" and not landing then
    landing = true
    addtoworld()
    movingalongpath = false
    wandervelocity = 0
    stopallanims()
    beginwait()
      startanimandwait("fly_up")
    endwait()
    startanim("cine_idle", 0.0, 1.0, 1.0, 0)
    landing = false
     
  elseif label == "idle" then
    addtoworld()
    movingalongpath = false
    wandervelocity = 0
    stopallanims()
    startanim("cine_idle", 0.0, 1.0, 1.0, 0)
  elseif label == "reset" then
    movingalongpath = false
  end
end


function on_atpathend()
  movingalongpath = false
--                 
--                                           
end