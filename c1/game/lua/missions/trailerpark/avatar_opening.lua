function on_postload()
  targetspeed = 2500.0
  minimumspeed = 100
  endloops = 20
  endloopspause = 0.05
  pausebeforeslowdown = 0.35
  triggerslowdown = gomgr.getbyoid(270)
  cinematic = gomgr.getbyoid(2944)
  zephyr = gomgr.getbyoid(487)
end
--
function on_triggerenter(triggerobject)

  gomgr.getbyoid(488):dispatchlabel("slowdown")

end