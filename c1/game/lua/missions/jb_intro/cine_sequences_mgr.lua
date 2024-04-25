function on_label(label)
  if label == "cinematic_pumpkin_cannon_start" then
      gomgr.getbyoid(660):addtoworld()
      gomgr.getbyoid(660):dispatchlabel("start_toss")
    
  elseif label == "cinematic_pumpkin_cannon_at_end" then

  elseif label == "cinematic_cannon_ball_start" then
      gomgr.getbyoid(662):addtoworld()
      gomgr.getbyoid(662):dispatchlabel("start_fire")
  
  elseif label == "cinematic_cannon_ball_at_end" then
  
  elseif label == "cinematic_ball_bull_start" then
      gomgr.getbyoid(668):addtoworld()
      gomgr.getbyoid(668):dispatchlabel("start_bouncing")
      gomgr.getbyoid(665):dispatchlabel("start_bouncing")
  
  elseif label == "cinematic_ball_bull_at_end" then

  end
end
