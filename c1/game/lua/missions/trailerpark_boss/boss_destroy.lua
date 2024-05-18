function on_label(label)
  if label == "blowitup" then
    reset()
    start()
    pause(1)
    gomgr.getbyoid(271):reset()
    gomgr.getbyoid(271):start()
    pause(1.5)
    gomgr.getbyoid(439):reset()
    gomgr.getbyoid(439):start()
    pause(0.5)
    gomgr.getbyoid(440):reset()
    gomgr.getbyoid(440):start()
    
    gomgr.getbyoid(432):dispatchlabel("explode")

  end
end