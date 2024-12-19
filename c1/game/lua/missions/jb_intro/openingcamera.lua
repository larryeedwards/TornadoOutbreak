realcine = false
modulecompleted = false

function on_gameplaymoduleactive()
    engine.pushmode(1)
    gomgr.getbyoid(208):dispatchlabel("weatherphase1")
    gomgr.getbyoid(209):dispatchlabel("weatherphase1")
    gomgr.getbyoid(210):dispatchlabel("weatherphase1")
    gomgr.getbyoid(211):dispatchlabel("weatherphase1")
    gomgr.getbyoid(213):dispatchlabel("weatherphase1")

    gomgr.getbyoid(655):dispatchlabel("hide")
    gomgr.getbyoid(655):removefromworld()
    gomgr.getbyoid(651):dispatchlabel("hide")
    gomgr.getbyoid(651):removefromworld()

    --
    gomgr.getbyoid(16).canavatarspindown = false
    gomgr.getbyoid(16):setfujitarating(1.00)

    realcine = true

    --
    audio.postflyovervoevent("Play_jb_intro_intro1")
    cinematic.play("flythrough")
    --
    --

    checkforcomplete()
end

function on_label(label)
    if label == "cinematic_start" then
        if realcine == false then
            cameramgr.screenfade(0, 0.0, 0.1, 1.5)
            gomgr.getbyoid(193):settext("textTransitionPrompt", 918)
            gomgr.getbyoid(193):start()
        end
    elseif label == "cinematic_split" then
        if modulecompleted == false or realcine == false then
        end
    elseif label == "cinematic_shadow" then
        if modulecompleted == false or realcine == false then
        end
    elseif label == "cinematic_at_end" then
        if modulecompleted == false or realcine == false then
        end
    end
end

function checkforcomplete()
    if realcine == true and modulecompleted == false then
        pause(1.0)
        beginwait()
        gomgr.getbyoid(193):settext("textTransitionPrompt", 918)
        gomgr.getbyoid(193):start()
        endwait()
        cameramgr.screenfade(0, 0.7, 0.25, 1.5)

        pause(0.8)

        modulecompleted = true
        realcine = false
        requestcomplete(true)
    else
    end
end

function on_gameplaymodulecomplete()
    cameramgr.activatecamerakind(1)
    engine.popmode(1)

    gomgr.getbyoid(208):dispatchlabel("weatherphase0")
    gomgr.getbyoid(209):dispatchlabel("weatherphase0")
    gomgr.getbyoid(210):dispatchlabel("weatherphase0")
    gomgr.getbyoid(211):dispatchlabel("weatherphase0")
    gomgr.getbyoid(213):dispatchlabel("weatherphase0")
end