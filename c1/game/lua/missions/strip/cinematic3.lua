function on_gameplaymoduleactive()
  engine.pushmode(1)
  beginwait()
    cinematic.play("cine_bosssetupA")
  endwait()
  engine.popmode(1)
  requestcomplete(true)
end

function on_gameplaymodulecomplete(succeeded)
  audio.postevent("LOOP_BOSS_SETUP_STORM_BUILDING_STAGE1")  
end

function on_label(label)

  if label == "cinematic_start" then
    gomgr.getbyoid(527):dispatchlabel("remove")
    gomgr.getbyoid(524):dispatchlabel("restartfires")
    gomgr.getbyoid(526):dispatchlabel("restartfires")
    
  elseif label == "cinematic_rise_totem" then
    gomgr.getbyoid(527):dispatchlabel("rise")
    gomgr.getbyoid(527):postaudioevent("PLAY_BOSS_SETUP_TOTEM_APPEARING")
    gomgr.getbyoid(527):postaudioevent("LOOP_BOSS_SETUP_UNPOWERED_TOTEM_AMBIENT")

    gomgr.getbyoid(3997):dispatchlabel("doit")

  end
end