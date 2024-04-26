  if label == "setup" then
	--                                         
	
	--                         
    childbyoid(276):addtoworld()
    this:addtoworld()

    --                                             
    childbyoid(277):dispatchlabel(label)
    childbyoid(277):dispatchlabel("opened")

  elseif label == "found" then
    --                                                                                

    --                                         
    childbyoid(277):dispatchlabel(label)
 
  elseif (label == "show") then
	--                                                                

    padlockmgr.setdirectionhint(this)

    local split_fx = childbyoid(274)
    split_fx:addtoworld()
    childbyoid(275):addtoworld()
    split_fx:reset()
    split_fx:start()

    --                              
    audio.postevent("Play_Tornado_GrowthTargetReached")

    --                  
    audio.postevent("Play_Tornado_Merge")

    --                      
    childbyoid(277):dispatchlabel("fxballshow")

  elseif (label == "hide") then

    --                         
    local split_fx = childbyoid(274)
    split_fx:stop()
    split_fx:removefromworld()
    childbyoid(275):removefromworld()
    childbyoid(276):removefromworld()
    this:removefromworld()
    
    --                                         
    childbyoid(277):dispatchlabel(label)

    --                        
    childbyoid(277):dispatchlabel("fxballhide")

  elseif (label == "training_closed") then
    childbyoid(277):dispatchlabel("closed")
  elseif (label == "training_open") then
    childbyoid(277):dispatchlabel("open")
  elseif (label == "training_hide") then
    --                         
    local split_fx = childbyoid(274)
    split_fx:stop()
    split_fx:removefromworld()
    childbyoid(275):removefromworld()
    childbyoid(276):removefromworld()

    --                        
    childbyoid(277):dispatchlabel("fxballhide")
  end

end