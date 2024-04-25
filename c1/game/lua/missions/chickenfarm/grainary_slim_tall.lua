function on_death(time)
  logline("on_death")
  gameplaymgr.currentgameplaymodule:dispatchlabel("weenie2dead")
end