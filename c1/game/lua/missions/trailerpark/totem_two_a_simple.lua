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
    removefromworld()
	
  elseif label == "restartfires" then
    childbyoid(152):stop()
    childbyoid(152):reset()
    childbyoid(152):start()
    childbyoid(151):stop()
    childbyoid(151):reset()
    childbyoid(151):start()
  end

end


function on_animtag(animname, animtag)

  if animtag == "lava" then
    childbyoid(366):reset()
    childbyoid(366):start()

  elseif animtag == "lightup" then
    childbyoid(152):reset()
    childbyoid(152):start()
    childbyoid(151):reset()
    childbyoid(151):start()

  elseif animtag == "risen" then
    stopallanims()
    childbyoid(366):stop()
    startanim("risen_anim") 
  end
  
end