function on_label(label)
  if label == "cinematic_sprites1" then
    gomgr.getbyoid(489):dispatchlabel("run")
    pause(0.3)
    gomgr.getbyoid(493):dispatchlabel("run")
    pause(0.3)
    gomgr.getbyoid(494):dispatchlabel("run")
    pause(0.3)
    gomgr.getbyoid(495):dispatchlabel("run")

  elseif label == "cinematic_sprites2" then
    gomgr.getbyoid(496):dispatchlabel("run")
    pause(0.3)
    gomgr.getbyoid(497):dispatchlabel("run")
    pause(0.3)
    gomgr.getbyoid(498):dispatchlabel("run")
    pause(0.3)
    gomgr.getbyoid(499):dispatchlabel("run")

  elseif label == "cinematic_sprites3" then
    gomgr.getbyoid(500):dispatchlabel("run")
    pause(0.3)
    gomgr.getbyoid(501):dispatchlabel("run")
    pause(0.3)
    gomgr.getbyoid(502):dispatchlabel("run")
    pause(0.3)
    gomgr.getbyoid(503):dispatchlabel("run")

  end
end