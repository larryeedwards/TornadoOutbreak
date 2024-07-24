function on_postload()
  targetspeed = 2500.0
  minimumspeed = 100
  endloops = 20
  endloopspause = 0.05
  pausebeforeslowdown = 0.35
  triggerslowdown = gomgr.getbyoid(288)
  cinematic = gomgr.getbyoid(3807)
  zephyr = gomgr.getbyoid(547)
end