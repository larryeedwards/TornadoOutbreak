function on_label(label)

  if label == "add" then
    addtoworld()
    pause(.01)
    stopallanims()
    startanim("idle")

  elseif label == "rise" then
    stopallanims()
    startanim("rise_anim")
  end

end


function on_animtag(animname, animtag)

  if animtag == "risen" then
    stopallanims()
    startanim("risen_anim")
    removefromworld()
  end
  
end