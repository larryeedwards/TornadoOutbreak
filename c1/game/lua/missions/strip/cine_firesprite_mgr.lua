function on_label(label)
  if label == "cinematic_sprites1" then
    gomgr.getbyoid(550):dispatchlabel("run")
    pause(0.3)
    gomgr.getbyoid(554):dispatchlabel("run")
    pause(0.3)
    gomgr.getbyoid(555):dispatchlabel("run")
    pause(0.3)
    gomgr.getbyoid(556):dispatchlabel("run")

  elseif label == "cinematic_sprites2" then
    gomgr.getbyoid(557):dispatchlabel("run")
    pause(0.3)
    gomgr.getbyoid(558):dispatchlabel("run")
    pause(0.3)
    gomgr.getbyoid(559):dispatchlabel("run")
    pause(0.3)
    gomgr.getbyoid(560):dispatchlabel("run")

  elseif label == "cinematic_sprites3" then
    gomgr.getbyoid(561):dispatchlabel("run")
    pause(0.3)
    gomgr.getbyoid(562):dispatchlabel("run")
    pause(0.3)
    gomgr.getbyoid(563):dispatchlabel("run")
    pause(0.3)
    gomgr.getbyoid(564):dispatchlabel("run")

  end
end