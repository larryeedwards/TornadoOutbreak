function on_postload()

    stopallanims()
    
end

function on_label(label)

  if label == "explode" then
    stopallanims()
    breakstate = 1
    gomgr.getbyoid(434):reset()
    gomgr.getbyoid(434):start()
    pause(0.05)
    startanim("explode_anim")

  pause(.3)

  gomgr.getbyoid(505):addtoworld()
  gomgr.getbyoid(501):addtoworld()

  pause(.1)

  gomgr.getbyoid(502):addtoworld()

  pause(.2)

  gomgr.getbyoid(503):addtoworld()
  gomgr.getbyoid(504):addtoworld()

  pause(4)

  audio.postevent("Play_Boss_Omegaton_Orb_Released")
  gomgr.getbyoid(506):reset()
  gomgr.getbyoid(506):start()
  gomgr.getbyoid(507):reset()
  gomgr.getbyoid(507):start()

  pause(2.5)

  gomgr.getbyoid(508):reset()
  gomgr.getbyoid(508):start()

  pause(1.5)

  gomgr.getbyoid(506):stop()

  pause(1)

  gomgr.getbyoid(507):stop()

   
  elseif label == "reset" then
    stopallanims()
    startanim("idle")
    breakstate = 0

  end
  
end

function on_animtag(animname, animtag)

  if animtag == "stopanims" then
    breakstate = 2
    stopallanims()
    startanim("dead_anim")
  end
  
end
--
