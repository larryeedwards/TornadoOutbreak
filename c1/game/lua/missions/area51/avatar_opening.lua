function on_postload()
  targetspeed = 2500.0
  minimumspeed = 100
  endloops = 20
  endloopspause = 0.05
  pausebeforeslowdown = 0.35
  triggerslowdown = gomgr.getbyoid(3113)
  cinematic = gomgr.getbyoid(3576)
  zephyr = gomgr.getbyoid(3368)
end
--
function on_triggerenter(triggerobject)

  gomgr.getbyoid(3369):dispatchlabel("slowdown")

end