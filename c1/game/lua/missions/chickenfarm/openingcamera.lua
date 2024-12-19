function underconstruction_exit()
    beginwait()
    uimgr.playhint(1605)
    endwait()
    world.exitworld(0)
end

realcine = false
modulecompleted = false
finishnaturally = false

function on_gameplaymoduleactive()
    tornadomgr.displayfirespritegoalinfo = false
    tornadomgr.displayfirespritetotalinfo = false
    engine.pushmode(1)
    gomgr.getbyoid(429):dispatchlabel("remove")
    gomgr.getbyoid(264):dispatchlabel("weatherphase0")
    gomgr.getbyoid(434):dispatchlabel("hide")
    gomgr.getbyoid(434):childbyoid(435):childbyoid(439):dispatchlabel("hide")
    gomgr.getbyoid(446):dispatchlabel("hide")
    gomgr.getbyoid(446):childbyoid(435):childbyoid(439):dispatchlabel("hide")
    gomgr.getbyoid(452):dispatchlabel("hide")
    gomgr.getbyoid(452):childbyoid(435):childbyoid(439):dispatchlabel("hide")

    realcine = true
    cinematic.play("flythrough_new")
    audio.postevent("enter_flying_to_next_area")

    checkforcomplete()
end

function on_label(label)
    if label == "cinematic_start" then
        gomgr.getbyoid(464).path = gomgr.getbyoid(275)
        gomgr.getbyoid(465):dispatchlabel("cine_fly")
        gomgr.getbyoid(466):removefromworld()
        gomgr.getbyoid(460).trackedobject = gomgr.getbyoid(464)
        gomgr.getbyoid(461).trackedobject = gomgr.getbyoid(465)
        gomgr.getbyoid(273).curphase = 1
        gomgr.getbyoid(272).curphase = 1
        gomgr.getbyoid(260):dispatchlabel("weatherphase0")
        if realcine == false then
            cameramgr.screenfade(0, 0.0, 0.1, 1.5)
            gomgr.getbyoid(194):settext("textTransitionPrompt", 918)
            gomgr.getbyoid(194):start()
        end
    elseif label == "cinematic_split" then
        if modulecompleted == false or realcine == false then
            gomgr.getbyoid(464).path = gomgr.getbyoid(274)
        end
    elseif label == "cinematic_shadow" then
        if modulecompleted == false or realcine == false then
            gomgr.getbyoid(454):dispatchlabel("grow")
            gomgr.getbyoid(260):dispatchlabel("grow")
            gomgr.getbyoid(260).curphase = 1
            gomgr.getbyoid(276):addtoworld()
            finishnaturally = true
        end
    elseif label == "cinematic_avatar_at_end" then
        if modulecompleted == false or realcine == false then
            --
            --
            gomgr.getbyoid(194):finish()
        end
    end
end

function checkforcomplete()
    if realcine == true and modulecompleted == false then
        pause(1.0)
        beginwait()
        gomgr.getbyoid(194):settext("textTransitionPrompt", 918)
        gomgr.getbyoid(194):start()
        endwait()
        cameramgr.screenfade(0, 0.7, 0.25, 1.0)

        if finishnaturally == false then
        end

        pause(0.8)

        --
        --
        gomgr.getbyoid(260).curphase = 1

        modulecompleted = true
        realcine = false
        requestcomplete(true)
    end
end

function on_gameplaymodulecomplete()
    --
    audio.postevent("exit_flying_to_next_area")
    gomgr.getbyoid(466):removefromworld()
    gomgr.getbyoid(465):removefromworld()
    gomgr.getbyoid(464):removefromworld()
    cameramgr.activatecamerakind(1)
    engine.popmode(1)
    gomgr.getbyoid(273).curphase = 0
    gomgr.getbyoid(272).curphase = 0
end