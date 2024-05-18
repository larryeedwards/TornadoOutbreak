realcine = false
modulecompleted = false

function on_gameplaymoduleactive()

  pause(0.1)
  engine.pushmode(1)
  gomgr.getbyoid(16):setfujitarating(1.0)
  gomgr.getbyoid(3970):setfujitarating(1.0)
  gomgr.getbyoid(235):dispatchlabel("weatherphase0")
  
  realcine = true
  
  beginwait()
    cinematic.play("closeup_01")
  endwait()
  cinematic.play("transition_01")
  audio.postevent("enter_flying_to_next_area")
  
end

function on_label(label)
  if label == "cinematic_ls_start" then
    gomgr.getbyoid(528):dispatchlabel("shrink")
    gomgr.getbyoid(232).curphase = 2
    gomgr.getbyoid(232):dispatchlabel("shrink")
    gomgr.getbyoid(237).curphase = 1
    gomgr.getbyoid(548):dispatchlabel("idle")
    gomgr.getbyoid(375):dispatchlabel("idle")
    gomgr.getbyoid(548):warp(gomgr.getbyoid(212))
    gomgr.getbyoid(375):warp(gomgr.getbyoid(213))
    gomgr.getbyoid(376):childbyoid(377):childbyoid(381):dispatchlabel("opened")
    
  elseif label == "cinematic_ls_close" then
    gomgr.getbyoid(376):childbyoid(377):childbyoid(381):dispatchlabel("close")
    
  elseif label == "cinematic_ls_at_end" then
    gomgr.getbyoid(232).curphase = 0

  elseif label == "cinematic_start" then
    gomgr.getbyoid(524):dispatchlabel("remove")
    gomgr.getbyoid(376):dispatchlabel("hide")
    gomgr.getbyoid(376):childbyoid(377):childbyoid(381):dispatchlabel("hide")
    gomgr.getbyoid(548).path = gomgr.getbyoid(209)
    gomgr.getbyoid(375):dispatchlabel("cine_fly_rampup")
    gomgr.getbyoid(533).trackedobject = gomgr.getbyoid(548)
    gomgr.getbyoid(534).trackedobject = gomgr.getbyoid(375)
    gomgr.getbyoid(233):dispatchlabel("weatherphase0")
    gomgr.getbyoid(238).curphase = 1
    gomgr.getbyoid(237).curphase = 1
    cameramgr.screenfade(0, 0.0, 0.1, 1.0)

  elseif label == "cinematic_rise_totem" then
    gomgr.getbyoid(524):dispatchlabel("rise")
    gomgr.getbyoid(524):postaudioevent("PLAY_BOSS_SETUP_TOTEM_APPEARING")
    gomgr.getbyoid(524):postaudioevent("LOOP_BOSS_SETUP_UNPOWERED_TOTEM_AMBIENT")
    
  elseif label == "cinematic_split" then
    if modulecompleted == false or realcine == false then
      gomgr.getbyoid(548).path = gomgr.getbyoid(211)
    end
    
  elseif label == "cinematic_shadow" then
    if modulecompleted == false or realcine == false then
      gomgr.getbyoid(529):dispatchlabel("grow")
      gomgr.getbyoid(233):dispatchlabel("grow")
      gomgr.getbyoid(233).curphase = 2
      gomgr.getbyoid(210):addtoworld()
    end
    
  elseif label == "cinematic_avatar_at_end" then
    if modulecompleted == false or realcine == false then
      gomgr.getbyoid(393):dispatchlabel("loopingidle")
      checkforcomplete()
    end
  
  end
  
end

function checkforcomplete()
  if realcine == true and modulecompleted == false then
    beginwait()
      gomgr.getbyoid(197):settext("textTransitionPrompt", 918)
      gomgr.getbyoid(197):settext("textZone", 901)
      gomgr.getbyoid(197):start()
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
  gomgr.getbyoid(393):dispatchlabel("loopingidleoff")
  gomgr.getbyoid(548):removefromworld()
  cameramgr.activatecamerakind(1)
  engine.popmode(1)
  gomgr.getbyoid(238).curphase = 0
  gomgr.getbyoid(237).curphase = 0
end