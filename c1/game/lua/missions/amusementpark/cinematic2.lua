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
    cinematic.play("closeup_02")
  endwait()
  cinematic.play("transition_02")
  audio.postevent("enter_flying_to_next_area")
  
end

function on_label(label)
  if label == "cinematic_ls_start" then
    gomgr.getbyoid(421):dispatchlabel("shrink")
    gomgr.getbyoid(239).curphase = 2
    gomgr.getbyoid(239):dispatchlabel("shrink")
    gomgr.getbyoid(247).curphase = 1
    gomgr.getbyoid(547):dispatchlabel("idle")
    gomgr.getbyoid(317):dispatchlabel("idle")
    gomgr.getbyoid(547):warp(gomgr.getbyoid(226))
    gomgr.getbyoid(317):warp(gomgr.getbyoid(227))
    gomgr.getbyoid(318):childbyoid(304):childbyoid(308):dispatchlabel("opened")
    gomgr.getbyoid(318):childbyoid(304):childbyoid(308):dispatchlabel("fxballshow")
    
  elseif label == "cinematic_ls_close" then
    gomgr.getbyoid(318):childbyoid(304):childbyoid(308):dispatchlabel("close")
    gomgr.getbyoid(318):childbyoid(304):childbyoid(308):dispatchlabel("fxballhide")
    
  elseif label == "cinematic_ls_at_end" then

  elseif label == "cinematic_start" then
    gomgr.getbyoid(239).curphase = 0
    gomgr.getbyoid(413):dispatchlabel("remove")
    gomgr.getbyoid(417):dispatchlabel("restartfires")
    gomgr.getbyoid(318):dispatchlabel("hide")
    gomgr.getbyoid(318):childbyoid(304):childbyoid(308):dispatchlabel("hide")
    gomgr.getbyoid(547).path = gomgr.getbyoid(223)
    gomgr.getbyoid(317):dispatchlabel("cine_fly_rampup")
    gomgr.getbyoid(322):removefromworld()
    gomgr.getbyoid(424).trackedobject = gomgr.getbyoid(547)
    gomgr.getbyoid(425).trackedobject = gomgr.getbyoid(317)
    gomgr.getbyoid(240):dispatchlabel("weatherphase0")
    gomgr.getbyoid(248).curphase = 1
    gomgr.getbyoid(247).curphase = 1
    cameramgr.screenfade(0, 0.0, 0.1, 1.0)

  elseif label == "cinematic_rise_totem" then
    gomgr.getbyoid(413):dispatchlabel("rise")
    gomgr.getbyoid(413):postaudioevent("PLAY_BOSS_SETUP_TOTEM_APPEARING")
    gomgr.getbyoid(413):postaudioevent("LOOP_BOSS_SETUP_UNPOWERED_TOTEM_AMBIENT")
    
  elseif label == "cinematic_split" then
    if modulecompleted == false or realcine == false then
      gomgr.getbyoid(547).path = gomgr.getbyoid(225)
    end
    
  elseif label == "cinematic_shadow" then
    if modulecompleted == false or realcine == false then
      gomgr.getbyoid(422):dispatchlabel("grow")
      gomgr.getbyoid(240):dispatchlabel("grow")
      gomgr.getbyoid(240).curphase = 2
      gomgr.getbyoid(224):addtoworld()
    end
    
  elseif label == "cinematic_avatar_at_end" then
    if modulecompleted == false or realcine == false then
      gomgr.getbyoid(322):dispatchlabel("loopingidle")
      checkforcomplete()
    end
  
  end
  
end

function checkforcomplete()
  if realcine == true and modulecompleted == false then
    beginwait()
      gomgr.getbyoid(198):settext("textTransitionPrompt", 918)
      gomgr.getbyoid(198):settext("textZone", 902)
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
  gomgr.getbyoid(322):dispatchlabel("loopingidleoff")
  cameramgr.activatecamerakind(1)
  engine.popmode(1)
  gomgr.getbyoid(248).curphase = 0
  gomgr.getbyoid(247).curphase = 0
end