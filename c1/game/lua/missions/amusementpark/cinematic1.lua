realcine = false
modulecompleted = false

function on_gameplaymoduleactive()
  
  pause(0.1)
  engine.pushmode(1)
  gomgr.getbyoid(16):setfujitarating(1.0)
  gomgr.getbyoid(3786):setfujitarating(1.0)
  gomgr.getbyoid(241):dispatchlabel("weatherphase0")
  
  realcine = true
  
  
  beginwait()
    cinematic.play("closeup_01")
  endwait()
  cinematic.play("transition_01")
  audio.postevent("enter_flying_to_next_area")
  
end

function on_label(label)
  if label == "cinematic_ls_start" then
    gomgr.getbyoid(420):dispatchlabel("shrink")
    gomgr.getbyoid(238).curphase = 2
    gomgr.getbyoid(238):dispatchlabel("shrink")
    gomgr.getbyoid(247).curphase = 1
    gomgr.getbyoid(547):dispatchlabel("idle")
    gomgr.getbyoid(302):dispatchlabel("idle")
    gomgr.getbyoid(547):warp(gomgr.getbyoid(218))
    gomgr.getbyoid(302):warp(gomgr.getbyoid(219))
    gomgr.getbyoid(303):childbyoid(304):childbyoid(308):dispatchlabel("opened")
    gomgr.getbyoid(303):childbyoid(304):childbyoid(308):dispatchlabel("fxballshow")
    
  elseif label == "cinematic_ls_close" then
    gomgr.getbyoid(303):childbyoid(304):childbyoid(308):dispatchlabel("fxballhide")
    gomgr.getbyoid(303):childbyoid(304):childbyoid(308):dispatchlabel("close")
    
  elseif label == "cinematic_ls_at_end" then

  elseif label == "cinematic_start" then
    gomgr.getbyoid(238).curphase = 0
    gomgr.getbyoid(417):dispatchlabel("remove")
    gomgr.getbyoid(303):dispatchlabel("hide")
    gomgr.getbyoid(303):childbyoid(304):childbyoid(308):dispatchlabel("hide")
    gomgr.getbyoid(547).path = gomgr.getbyoid(215)
    gomgr.getbyoid(302):dispatchlabel("cine_fly_rampup")
    gomgr.getbyoid(320):removefromworld()
    gomgr.getbyoid(424).trackedobject = gomgr.getbyoid(547)
    gomgr.getbyoid(425).trackedobject = gomgr.getbyoid(302)
    gomgr.getbyoid(239):dispatchlabel("weatherphase0")
    gomgr.getbyoid(248).curphase = 1
    gomgr.getbyoid(247).curphase = 1
    cameramgr.screenfade(0, 0.0, 0.1, 1.0)

  elseif label == "cinematic_rise_totem" then
    gomgr.getbyoid(417):dispatchlabel("rise")
    gomgr.getbyoid(417):postaudioevent("PLAY_BOSS_SETUP_TOTEM_APPEARING")
    gomgr.getbyoid(417):postaudioevent("LOOP_BOSS_SETUP_UNPOWERED_TOTEM_AMBIENT")
    
  elseif label == "cinematic_split" then
    if modulecompleted == false or realcine == false then
      gomgr.getbyoid(547).path = gomgr.getbyoid(217)
    end
    
  elseif label == "cinematic_shadow" then
    if modulecompleted == false or realcine == false then
      gomgr.getbyoid(421):dispatchlabel("grow")
      gomgr.getbyoid(239):dispatchlabel("grow")
      gomgr.getbyoid(239).curphase = 2
      gomgr.getbyoid(216):addtoworld()
    end
    
  elseif label == "cinematic_avatar_at_end" then
    if modulecompleted == false or realcine == false then
      gomgr.getbyoid(320):dispatchlabel("loopingidle")
      checkforcomplete()
    end
  
  end
  
end

function checkforcomplete()
  if realcine == true and modulecompleted == false then
    beginwait()
      gomgr.getbyoid(198):settext("textTransitionPrompt", 918)
      gomgr.getbyoid(198):settext("textZone", 901)
      gomgr.getbyoid(198):start()
    endwait()
    cameramgr.screenfade(0, 0.7, 0.25, 1.0)
    
    pause(0.8)
    modulecompleted = true
    realcine = false
    requestcomplete(true)
  else

  end
end

function on_gameplaymodulecomplete()
  audio.postevent("exit_flying_to_next_area")
  gomgr.getbyoid(547):removefromworld()
  gomgr.getbyoid(320):dispatchlabel("loopingidleoff")
  cameramgr.activatecamerakind(1)
  engine.popmode(1)
  gomgr.getbyoid(248).curphase = 0
  gomgr.getbyoid(247).curphase = 0
end