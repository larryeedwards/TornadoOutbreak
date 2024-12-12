function on_gameplaymoduleactive()
  --                 
  engine.pushmode(1)
  beginwait()
    cinematic.play("cine_bosssetupA")
  endwait()
  engine.popmode(1)
  requestcomplete(true)
end

function on_label(label)

  if label == "cinematic_start" then
    gomgr.getbyoid(418):dispatchlabel("remove")
    gomgr.getbyoid(413):dispatchlabel("restartfires")
    gomgr.getbyoid(417):dispatchlabel("restartfires")
    
  elseif label == "cinematic_rise_totem" then
    gomgr.getbyoid(418):dispatchlabel("rise")
    gomgr.getbyoid(418):postaudioevent("PLAY_BOSS_SETUP_TOTEM_APPEARING")
    gomgr.getbyoid(418):postaudioevent("LOOP_BOSS_SETUP_UNPOWERED_TOTEM_AMBIENT")

    gomgr.getbyoid(3815):dispatchlabel("doit")
        
  end
end