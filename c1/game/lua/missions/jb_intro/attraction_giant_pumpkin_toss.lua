function on_postload()

    stopallanims()
    
end

function on_label(label)

  if label == "start_toss" then
    stopallanims()
    pause(0.05)
    startanim("toss", 0, 1, 1, 0)

  end
end    

function on_animtag(animname, animtag)

  if animtag == "stopanims" then
    removefromworld()
    gomgr.getbyoid(684):dispatchlabel("pumpkin_hit")

  elseif animtag == "tosshit1" then
    childbyoid(661):reset()
    childbyoid(661):start()
    postaudioevent("Play_JBIntro_Pumpkin_Cannon_Land")

  elseif animtag == "starttoss" then
    postaudioevent("Play_JBIntro_Pumpkin_Fly")

  end  
end