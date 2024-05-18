function on_gameplaymoduleactive()
  gomgr.getbyoid(3139):addtoworld()
  gomgr.getbyoid(3139):dispatchlabel("idle")
  gomgr.getbyoid(3138):childbyoid(3125):childbyoid(3129):dispatchlabel("opened")
end

function on_gameplaymodulecomplete(succeeded)
  if succeeded then
    cameramgr.screenfade(0, 0.0, 0.1, 0.5)
    gomgr.getbyoid(3139):removefromworld()
  end
end