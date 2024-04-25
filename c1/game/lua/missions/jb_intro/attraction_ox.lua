function on_death(tornado)

  stopallanims()

end

function on_label(label)

  if label == "ball_hit" then
    stopallanims()
    breakstate = 1
    pause(0.05)
    startanim("hit", 0, 1, 1, 0)

  end
end    

function on_animtag(animname, animtag)

  if animtag == "hit_complete" then
    stopallanims()
    startanim("posthit_idle")

  end  
end