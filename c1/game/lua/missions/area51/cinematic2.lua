realcine = false
modulecompleted = false

function on_gameplaymoduleactive()

  pause(0.1)
  engine.pushmode(1)
  gomgr.getbyoid(16):setfujitarating(1.0)
  gomgr.getbyoid(3556):setfujitarating(1.0)
  gomgr.getbyoid(3083):dispatchlabel("weatherphase0")
  
  realcine = true
  
  beginwait()
    cinematic.play("closeup_02")
  endwait()
  cinematic.play("transition_02")
  audio.postevent("enter_flying_to_next_area")
  
end

function on_label(label)
  if label == "cinematic_ls_start" then
    gomgr.getbyoid(3237):dispatchlabel("shrink")
    gomgr.getbyoid(3081).curphase = 1
    gomgr.getbyoid(3081):dispatchlabel("shrink")
    gomgr.getbyoid(3084).curphase = 1
    gomgr.getbyoid(3368):dispatchlabel("idle")
    gomgr.getbyoid(3137):dispatchlabel("idle")
    gomgr.getbyoid(3368):warp(gomgr.getbyoid(3061))
    gomgr.getbyoid(3137):warp(gomgr.getbyoid(3062))
    gomgr.getbyoid(3138):childbyoid(3125):childbyoid(3129):dispatchlabel("opened")
    gomgr.getbyoid(3232):dispatchlabel("restartfires")
    
  elseif label == "cinematic_ls_close" then
    gomgr.getbyoid(3138):childbyoid(3125):childbyoid(3129):dispatchlabel("close")
    
  elseif label == "cinematic_ls_at_end" then
    gomgr.getbyoid(3081).curphase = 0

  elseif label == "cinematic_start" then
    gomgr.getbyoid(3234):dispatchlabel("remove")
    gomgr.getbyoid(3138):dispatchlabel("hide")
    gomgr.getbyoid(3138):childbyoid(3125):childbyoid(3129):dispatchlabel("hide")
    gomgr.getbyoid(3368).path = gomgr.getbyoid(3058)
    gomgr.getbyoid(3137):dispatchlabel("cine_fly_rampup")
    gomgr.getbyoid(3142):removefromworld()
    gomgr.getbyoid(3241).trackedobject = gomgr.getbyoid(3368)
    gomgr.getbyoid(3242).trackedobject = gomgr.getbyoid(3137)
    gomgr.getbyoid(3082):dispatchlabel("weatherphase0")
    gomgr.getbyoid(3085).curphase = 1
    gomgr.getbyoid(3084).curphase = 1
    cameramgr.screenfade(0, 0.0, 0.1, 1.0)

  elseif label == "cinematic_rise_totem" then
    gomgr.getbyoid(3234):dispatchlabel("rise")
    gomgr.getbyoid(3234):postaudioevent("PLAY_BOSS_SETUP_TOTEM_APPEARING")
    gomgr.getbyoid(3234):postaudioevent("LOOP_BOSS_SETUP_UNPOWERED_TOTEM_AMBIENT")
    
  elseif label == "cinematic_split" then
    if modulecompleted == false or realcine == false then
      gomgr.getbyoid(3368).path = gomgr.getbyoid(3060)
    end
    
  elseif label == "cinematic_shadow" then
    if modulecompleted == false or realcine == false then
      gomgr.getbyoid(3238):dispatchlabel("grow")
      gomgr.getbyoid(3082):dispatchlabel("grow")
      gomgr.getbyoid(3082).curphase = 2
      gomgr.getbyoid(3059):addtoworld()
    end
    
  elseif label == "cinematic_avatar_at_end" then
    if modulecompleted == false or realcine == false then
      gomgr.getbyoid(3142):dispatchlabel("loopingidle")
      checkforcomplete()
    end
  
  end
  
end

function checkforcomplete()
  if realcine == true and modulecompleted == false then
    beginwait()
      gomgr.getbyoid(196):settext("textTransitionPrompt", 918)
      gomgr.getbyoid(196):settext("textZone", 902)
      gomgr.getbyoid(196):start()
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
  gomgr.getbyoid(3368):removefromworld()
  gomgr.getbyoid(3142):dispatchlabel("loopingidleoff")
  cameramgr.activatecamerakind(1)
  engine.popmode(1)
  gomgr.getbyoid(3085).curphase = 0
  gomgr.getbyoid(3084).curphase = 0
end