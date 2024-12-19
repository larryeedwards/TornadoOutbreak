weeniedead = false

function on_gameplaymoduleactive()
    weeniedead = false

    --
    gomgr.getbyoid(429):childbyoid(430):addtoworld()
    gomgr.getbyoid(429):childbyoid(430):start()

    pause(1.0)

    --
    tornadomgr.firstactivetornado:setfujitarating(3.8)
    tornadomgr.firstactivetornado.currenthealth = 5
    tornadomgr.firstactivetornado.isdisplayinghealth = true

    --
    if (tornadomgr.secondactivetornado) then
        tornadomgr.secondactivetornado:setfujitarating(3.8)
        tornadomgr.secondactivetornado.currenthealth = 5
        tornadomgr.secondactivetornado.isdisplayinghealth = true
    end

    tornadomgr.setfujitamax(3.8)
    tornadomgr.showtargetfujitainfo = false

    --
    cameramgr.playertargettarget = gomgr.getbyoid(60)
    tornadomgr.firstactivetornado.bosstarget = gomgr.getbyoid(60)
    if (tornadomgr.secondactivetornado) then
        tornadomgr.secondactivetornado.bosstarget = gomgr.getbyoid(60)
    end
end

function on_label(label)
    if (label == "begin_battle") then
        engine.pushmode(1)
        pause(0.05)
        audio.postevent("enter_camera_slowdown")
        time.setscale(0.1)
        gomgr.getbyoid(3551):setscale(4.0)
        gomgr.getbyoid(3555):setscale(4.0)
        bossTeachText = {1131, 1609}
        for i = 1, #bossTeachText do
            gomgr.getbyoid(3568).location = 0
            gomgr.getbyoid(3568).portrait = 1
            gomgr.getbyoid(3568).buttonon = true
            gomgr.getbyoid(3568):settext(" textbox ", bossTeachText[i])
            gomgr.getbyoid(3568).finishonbuttonpress = (i == #bossTeachText)
            beginwait()
            gomgr.getbyoid(3568):start()
            endwait()
        end
        beginwait()
        audio.postevent("exit_camera_slowdown")
        time.lerptotimescale(1.0, 1.0)
        endwait()
        engine.popmode(1)
    end

    if (weeniedead) then
        return
    end

    if (label == "weeniedead") then
        weeniedead = true
        requestcomplete(true)
    end
end