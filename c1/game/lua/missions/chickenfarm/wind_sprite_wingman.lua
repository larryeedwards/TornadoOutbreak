function on_label(label)
    if label == "poof" then
      childbyoid(3585):reset()
      childbyoid(3585):start()
      childbyoid(3585).particlesizepercentadjustment = 1.0
      pause(0.15)
      childbyoid(3585).particlesizepercentadjustment = 0.95
      pause(0.05)
      childbyoid(3585).particlesizepercentadjustment = 0.9
      pause(0.05)
      childbyoid(3585).particlesizepercentadjustment = 0.825
      pause(0.05)
      childbyoid(3585).particlesizepercentadjustment = 0.75
      pause(0.05)
      childbyoid(3585).particlesizepercentadjustment = 0.65
      pause(0.05)
      childbyoid(3585).particlesizepercentadjustment = 0.5
      pause(0.05)
      childbyoid(3585).particlesizepercentadjustment = 0.25
      pause(0.05)
      childbyoid(3585).particlesizepercentadjustment = 0.1
      pause(0.05)
      childbyoid(3585).particlesizepercentadjustment = 0.05
      pause(0.05)
      childbyoid(3585).particlesizepercentadjustment = 0.01
      childbyoid(3585):stop()
    end
  end