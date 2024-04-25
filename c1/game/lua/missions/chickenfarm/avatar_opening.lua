function on_postload()
    targetspeed = 2500.0
    minimumspeed = 100
    endloops = 20
    endloopspause = 0.05
    pausebeforeslowdown = 0.35
    triggerslowdown = gomgr.getbyoid(276)
    cinematic = gomgr.getbyoid(3570)
    zephyr = gomgr.getbyoid(464)
  end
  --
  function on_triggerenter(triggerobject)

    gomgr.getbyoid(465):dispatchlabel("slowdown")
  
  end