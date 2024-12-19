function on_postload()
    stopallanims()
end

function on_label(label)
    if label == "start_fire" then
        stopallanims()
        pause(0.15)
        beginwait()
        startanim("fire")
        endwait()
    end
end

function on_animtag(animname, animtag)
    if animtag == "stopanims" then
        removefromworld()
        gomgr.getbyoid(665):dispatchlabel("pumpkin_hit")
    elseif animtag == "firehit1" then
        childbyoid(663):reset()
        childbyoid(663):start()
    elseif animtag == "bounce" then
        postaudioevent("Play_JBIntro_Pumpkin_Bounce")
        childbyoid(664):reset()
        childbyoid(664):start()
    end
end