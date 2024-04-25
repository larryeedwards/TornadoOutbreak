function on_label(label)
    if label == "setupapproach1" then
      --                                                        
      setupapproach1()  
    elseif label == "setupapproach2" then
      audio.postevent("PLAY_BOSS_APPROACH_SHADOW_TRANSITION")
    elseif label == "setupapproach3" then
      audio.postevent("PLAY_BOSS_APPROACH_SHADOW_TRANSITION")
    elseif label == "weeniedead" then
      endmission(true)
    end
  end
  
  function setupapproach1()
  --                                       
  
  --         
    tornadomgr.firstactivetornado.isdisplayinghealth = true
    tornadomgr.firstactivetornado.currenthealth = 5
    
  --         
    if (tornadomgr.secondactivetornado) then
      tornadomgr.secondactivetornado.isdisplayinghealth = true
      tornadomgr.secondactivetornado.currenthealth = 5
    end
  
    --                                                
  end