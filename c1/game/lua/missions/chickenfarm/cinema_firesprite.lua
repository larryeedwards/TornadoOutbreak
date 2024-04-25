      
--                            
function on_label(label)
    logline("sprite::on_label: " .. label)
    
    if label == "firesprite_fly" then
      --               
      --                                      
      movingalongpath = true
      wandervelocity = 1600
    end
    
    if label == "reset" then
      movingalongpath = false
    end
  end
  
  function on_atpathend()
    logline("sprite::on_atpathend")
    movingalongpath = false
    --               
    gameplaymgr.currentgameplaymodule:dispatchlabel("on_spriteatpathend")
  end
  
  function on_animtag(animname, animtag)
    if animtag == "revealfx" then
      childbyoid(451):reset()
      childbyoid(451):start()
    end
  end