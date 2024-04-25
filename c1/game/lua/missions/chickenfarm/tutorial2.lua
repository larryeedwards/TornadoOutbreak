tutorial2Text = {
    1142,
    1143,
    1144,
    1128,
    1129,
    1130
  }
  
  --      
  function on_gameplaymoduleactive()
    while (tornadomgr.firstactivetornado == nil) do
        pause(0.1)
      end
    gomgr.getbyoid(264):dispatchlabel("weatherphase0")
    gomgr.getbyoid(262):dispatchlabel("weatherphase1") 
    gomgr.getbyoid(442):dispatchlabel("hide")
    gomgr.getbyoid(442):removefromworld()
    gomgr.getbyoid(462):dispatchlabel("reset")
    gomgr.getbyoid(446):dispatchlabel("setup")
    gomgr.getbyoid(446):childbyoid(435):childbyoid(439):dispatchlabel("opened")
      
      --                
      engine.pushmode(1)
    gomgr.getbyoid(233):freeze()
    
    --           
    gomgr.getbyoid(3568).buttonon = true
    gomgr.getbyoid(3568).location = 1
    for i = 1, #tutorial2Text do
      if i == 2 then
        gomgr.getbyoid(3568).location = 0
        gomgr.getbyoid(3568).portrait = 1
        gomgr.getbyoid(233):unfreezecamera()
        pause(0.01)
        beginwait()
          cinematic.play("toSilo")
        endwait()
        cinematic.play("siloIntro")
      elseif i == 3 then
        gomgr.getbyoid(233):unfreeze()
        cinematic.play("loadIntro2")
        gomgr.getbyoid(3568).location = 0
        gomgr.getbyoid(3568).portrait = 1
      elseif i > 4 then
        gomgr.getbyoid(3568).location = 3
        gomgr.getbyoid(3568).portrait = 1
        tornadomgr.stormchambertimer.shouldhideduringgamestop = false
        tornadomgr.stormchambertimer:starttimerforboss(300)
        tornadomgr.stormchambertimer:start()
        tornadomgr.stormchambertimer.isforcingdisplay = true
        tornadomgr.stormchambertimer:pausetimer()
      end
      gomgr.getbyoid(3568):settext(" textbox ", tutorial2Text[i])
      gomgr.getbyoid(3568).finishonbuttonpress = (i==1 or i==2 or i==4 or i==#tutorial2Text)
      beginwait()
        gomgr.getbyoid(3568):start()
      endwait()
      if i == 2 then
        cinematic.stop()
        gomgr.getbyoid(3568).location = 1
        gomgr.getbyoid(233):freeze()
      end
    end
      
    --         
    cinematic.stop()
    engine.popmode(1)
    
    --                           
    gomgr.getbyoid(462).path = gomgr.getbyoid(240)
    gomgr.getbyoid(462):dispatchlabel("trainer_fly")
    requestcomplete(true)
  end