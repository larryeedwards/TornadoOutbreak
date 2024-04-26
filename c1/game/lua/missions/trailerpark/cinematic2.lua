function on_gameplaymoduleactive()
  --                                     
--                                                       
--                                                                                     
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
    gomgr.getbyoid(367):dispatchlabel("remove")
    gomgr.getbyoid(368):dispatchlabel("remove")
    gomgr.getbyoid(365):dispatchlabel("restartfires")
    
  elseif label == "cinematic_rise_totem1" then
    gomgr.getbyoid(367):dispatchlabel("rise")
    gomgr.getbyoid(367):postaudioevent("PLAY_BOSS_SETUP_TOTEM_APPEARING")
    gomgr.getbyoid(367):postaudioevent("LOOP_BOSS_SETUP_UNPOWERED_TOTEM_AMBIENT")
    
  elseif label == "cinematic_rise_totem2" then
    gomgr.getbyoid(368):dispatchlabel("rise")
    gomgr.getbyoid(368):postaudioevent("PLAY_BOSS_SETUP_TOTEM_APPEARING")
    gomgr.getbyoid(368):postaudioevent("LOOP_BOSS_SETUP_UNPOWERED_TOTEM_AMBIENT")

  end
end