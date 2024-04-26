realcine = false
modulecompleted = false

function on_gameplaymoduleactive()
  
  pause(0.1)
  engine.pushmode(1)
  gomgr.getbyoid(16):setfujitarating(1.0)
  gomgr.getbyoid(2921):setfujitarating(1.0)
  gomgr.getbyoid(229):dispatchlabel("weatherphase0")
  
  realcine = true
  
  
  beginwait()
    cinematic.play("closeup_01")
  endwait()
  cinematic.play("transition_01")
  audio.postevent("enter_flying_to_next_area")
  
end

function on_label(label)
  if label == "cinematic_ls_start" then
    gomgr.getbyoid(374):dispatchlabel("shrink")
    gomgr.getbyoid(227).curphase = 1
    gomgr.getbyoid(227):dispatchlabel("shrink")
    gomgr.getbyoid(233).curphase = 1
    gomgr.getbyoid(487):dispatchlabel("idle")
    gomgr.getbyoid(271):dispatchlabel("idle")
    gomgr.getbyoid(487):warp(gomgr.getbyoid(214))
    gomgr.getbyoid(271):warp(gomgr.getbyoid(215))
    gomgr.getbyoid(272):childbyoid(273):childbyoid(277):dispatchlabel("opened")
    
  elseif label == "cinematic_ls_close" then
    gomgr.getbyoid(272):childbyoid(273):childbyoid(277):dispatchlabel("close")
    
  elseif label == "cinematic_ls_at_end" then
    gomgr.getbyoid(227).curphase = 0

  elseif label == "cinematic_start" then
    gomgr.getbyoid(365):dispatchlabel("remove")
    gomgr.getbyoid(272):dispatchlabel("hide")
    gomgr.getbyoid(272):childbyoid(273):childbyoid(277):dispatchlabel("hide")
    gomgr.getbyoid(487).path = gomgr.getbyoid(210)
    gomgr.getbyoid(271):dispatchlabel("cine_fly_rampup")
    gomgr.getbyoid(377).trackedobject = gomgr.getbyoid(487)
    gomgr.getbyoid(378).trackedobject = gomgr.getbyoid(271)
    gomgr.getbyoid(228):dispatchlabel("weatherphase0")
    gomgr.getbyoid(234).curphase = 1
    gomgr.getbyoid(233).curphase = 1
    cameramgr.screenfade(0, 0.0, 0.1, 1.0)

  elseif label == "cinematic_rise_totem" then
    gomgr.getbyoid(365):dispatchlabel("rise")
    gomgr.getbyoid(365):postaudioevent("PLAY_BOSS_SETUP_TOTEM_APPEARING")
    gomgr.getbyoid(365):postaudioevent("LOOP_BOSS_SETUP_UNPOWERED_TOTEM_AMBIENT")
    
  elseif label == "cinematic_split" then
    if modulecompleted == false or realcine == false then
      gomgr.getbyoid(487).path = gomgr.getbyoid(213)
    end
    
  elseif label == "cinematic_shadow" then
    if modulecompleted == false or realcine == false then
      gomgr.getbyoid(375):dispatchlabel("grow")
      gomgr.getbyoid(228):dispatchlabel("grow")
      gomgr.getbyoid(228).curphase = 2
      gomgr.getbyoid(212):addtoworld()
    end
    
  elseif label == "cinematic_avatar_at_end" then
    if modulecompleted == false or realcine == false then
      gomgr.getbyoid(283):dispatchlabel("loopingidle")
      checkforcomplete()
    end
  
  end
  
end

function checkforcomplete()
  if realcine == true and modulecompleted == false then
    beginwait()
      gomgr.getbyoid(195):settext("textTransitionPrompt", 918)
      gomgr.getbyoid(195):settext("textZone", 901)
      gomgr.getbyoid(195):start()
    endwait()
    cameramgr.screenfade(0, 0.7, 0.25, 1.0)
    
    pause(0.8)
    gomgr.getbyoid(16):warp(gomgr.getbyoid(217))
    gomgr.getbyoid(2921):warp(gomgr.getbyoid(217))
    modulecompleted = true
    realcine = false
    requestcomplete(true)
  else

  end
end

function on_gameplaymodulecomplete()
  audio.postevent("exit_flying_to_next_area")
  gomgr.getbyoid(487):removefromworld()
  gomgr.getbyoid(283):dispatchlabel("loopingidleoff")
  cameramgr.activatecamerakind(1)
  engine.popmode(1)
  gomgr.getbyoid(234).curphase = 0
  gomgr.getbyoid(233).curphase = 0
end