function on_death(tornado)
    tagamestats.unlockaward(tornado.playerindex, 34)
    pause(0.5)
    stopallanims()
    beginwait()
    startanimandwait("fire")
    endwait()
    removefromworld()
end

function on_label(label)
    if label == "pumpkin_hit" then
        stopallanims()
        breakstate = 1
        pause(0.05)
        beginwait()
        startanimandwait("hit")
        endwait()
    end
end

function on_animtag(animname, animtag)
    if animtag == "hit_complete" then
        breakstate = 2
        childbyoid(686):stop()
    elseif animtag == "shoot" then
        childbyoid(687):reset()
        childbyoid(687):start()
        postaudioevent("Play_JBIntro_Pumpkin_Cannon_Shoot")
    elseif animtag == "explode" then
        childbyoid(685):reset()
        childbyoid(685):start()
        childbyoid(688):reset()
        childbyoid(688):start()
    elseif animtag == "stir_dust" then
        childbyoid(686):reset()
        childbyoid(686):start()
    end
end