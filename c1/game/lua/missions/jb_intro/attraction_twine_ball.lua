function on_label(label)

  if label == "pumpkin_hit" then
    stopallanims()
    breakstate = 1
    pause(0.05)
    startanim("hit", 0, 1, 1, 0)
  end

  if label == "start_bouncing" then
    startanim("shaking")
    removefromworld()
  end

end    

function on_animtag(animname, animtag)

  if animtag == "hit_complete" then
    stopallanims()
    startanim("posthit_idle")
  end  
end