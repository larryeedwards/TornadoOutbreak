function on_gameplaymoduleactive()
  gomgr.getbyoid(392):addtoworld()
  gomgr.getbyoid(392):dispatchlabel("idle")
  gomgr.getbyoid(391):childbyoid(377):childbyoid(381):dispatchlabel("opened")
end

function on_gameplaymodulecomplete(succeeded)
  if succeeded then
    cameramgr.screenfade(0, 0.0, 0.1, 0.5)
    gomgr.getbyoid(392):removefromworld()
  end
end
