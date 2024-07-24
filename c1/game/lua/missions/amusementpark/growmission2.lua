function on_gameplaymoduleactive()
  gomgr.getbyoid(248):dispatchlabel("weatherphase0")
  gomgr.getbyoid(319):addtoworld()
  gomgr.getbyoid(319):dispatchlabel("idle")
  
  --             
  gomgr.getbyoid(413):dispatchlabel("remove")
  gomgr.getbyoid(418):dispatchlabel("remove")
end

function on_gameplaymodulecomplete(succeeded)
  if succeeded then
    cameramgr.screenfade(0, 0.0, 0.1, 0.5)
    gomgr.getbyoid(319):removefromworld()
  end
end