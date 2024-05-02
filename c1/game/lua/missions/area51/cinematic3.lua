function on_gameplaymoduleactive()
  engine.pushmode(1)
  audio.postevent("enter_flying_to_next_area")
  beginwait()
    cinematic.play("cine_bosssetupA")
  endwait()
  requestcomplete(true)
  audio.postevent("exit_flying_to_next_area")
end

function on_gameplaymodulecomplete(succeeded)
  audio.postevent("LOOP_BOSS_SETUP_STORM_BUILDING_STAGE1")
   engine.popmode(1)
end

function on_label(label)

  if label == "cinematic_start" then
    gomgr.getbyoid(3235):dispatchlabel("remove")
    gomgr.getbyoid(3232):dispatchlabel("restartfires")
    gomgr.getbyoid(3234):dispatchlabel("restartfires")
    
  elseif label == "cinematic_rise_totem" then
    gomgr.getbyoid(3235):dispatchlabel("rise")
    gomgr.getbyoid(3235):postaudioevent("PLAY_BOSS_SETUP_TOTEM_APPEARING")
    gomgr.getbyoid(3235):postaudioevent("LOOP_BOSS_SETUP_UNPOWERED_TOTEM_AMBIENT")

    gomgr.getbyoid(3584):dispatchlabel("doit")
    
  end
end