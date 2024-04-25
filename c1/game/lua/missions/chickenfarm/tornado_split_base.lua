function on_label(label)
    if label == "setup" then
      --                                         
      
      --                         
      childbyoid(438):addtoworld()
      this:addtoworld()
  
      --                                             
      childbyoid(439):dispatchlabel(label)
      childbyoid(439):dispatchlabel("opened")
  
    elseif label == "found" then
      --                                                                                
  
      --                                         
      childbyoid(439):dispatchlabel(label)
   
    elseif (label == "show") then
      --                                                                
  
      padlockmgr.setdirectionhint(this)
  
      local split_fx = childbyoid(436)
      split_fx:addtoworld()
      childbyoid(437):addtoworld()
      split_fx:reset()
      split_fx:start()
  
      --                              
      audio.postevent("Play_Tornado_GrowthTargetReached")
  
      --                  
      audio.postevent("Play_Tornado_Merge")
  
      --                      
      childbyoid(439):dispatchlabel("fxballshow")
  
    elseif (label == "hide") then
  
      --                         
      local split_fx = childbyoid(436)
      split_fx:stop()
      split_fx:removefromworld()
      childbyoid(437):removefromworld()
      childbyoid(438):removefromworld()
      this:removefromworld()
      
      --                                         
      childbyoid(439):dispatchlabel(label)
  
      --                        
      childbyoid(439):dispatchlabel("fxballhide")
  
    elseif (label == "training_closed") then
      childbyoid(439):dispatchlabel("closed")
    elseif (label == "training_open") then
      childbyoid(439):dispatchlabel("open")
    elseif (label == "training_hide") then
      --                         
      local split_fx = childbyoid(436)
      split_fx:stop()
      split_fx:removefromworld()
      childbyoid(437):removefromworld()
      childbyoid(438):removefromworld()
  
      --                        
      childbyoid(439):dispatchlabel("fxballhide")
    end
  
  end