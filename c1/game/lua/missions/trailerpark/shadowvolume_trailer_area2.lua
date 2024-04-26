function on_label(label)

  if label == "grow" then
    stopallanims()
    startanim("anim_grow",0,1.0,1.0,0)
    pause(0.1)
    stopallanims()
    beginwait()
      startanimandwait("anim_grow")
    endwait()
    stopallanims()
    startanim("default",0,1.0,1.0,0)

  elseif label == "shrink" then
    addtoworld()
    stopallanims()
    startanim("anim_shrink",0,1.0,1.0,0)
    pause(0.1)
    stopallanims()
    beginwait()
      startanimandwait("anim_shrink")
    endwait()
    removefromworld()

  elseif label == "default" then
    stopallanims()
    startanim("default",0,1.0,1.0,0)

  end 

end