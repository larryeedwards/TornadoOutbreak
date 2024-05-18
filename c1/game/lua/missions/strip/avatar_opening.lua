function on_postload()
  targetspeed = 2500.0
  minimumspeed = 100
  endloops = 20
  endloopspause = 0.05
  pausebeforeslowdown = 0.35
  triggerslowdown = gomgr.getbyoid(268)
  cinematic = gomgr.getbyoid(3989)
  zephyr = gomgr.getbyoid(548)
end