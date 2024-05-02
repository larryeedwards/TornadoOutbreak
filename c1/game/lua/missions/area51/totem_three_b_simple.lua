		function on_postload()

  stopallanims()
  startanim("idle")
    
end


function on_label(label)

  if label == "rise" then
    addtoworld()
    stopallanims()
    startanim("totem_rise_anim")

  elseif label == "remove" then
    stopallanims()
    startanim("idle")
    childbyoid(152):stop()
    childbyoid(151):stop()
    childbyoid(153):stop()
    removefromworld()
  
  elseif label == "restartfires" then
    childbyoid(152):stop()
    childbyoid(152):reset()
    childbyoid(152):start()
    childbyoid(151):stop()
    childbyoid(151):reset()
    childbyoid(151):start()
    childbyoid(153):stop()
    childbyoid(153):reset()
    childbyoid(153):start()
  end

end


function on_animtag(animname, animtag)

  if animtag == "lava" then
    childbyoid(3233):reset()
    childbyoid(3233):start()

  elseif animtag == "lightup" then
    childbyoid(152):reset()
    childbyoid(152):start()
    childbyoid(151):reset()
    childbyoid(151):start()
    childbyoid(153):reset()
    childbyoid(153):start()

  elseif animtag == "risen" then
    stopallanims()
    childbyoid(3233):stop()
    startanim("risen_anim") 
  end
  
end