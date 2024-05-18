function on_label(label)
  if label == "setup" then
	--                                         
	
	--                         
    childbyoid(380):addtoworld()
    this:addtoworld()

    --                                             
    childbyoid(381):dispatchlabel(label)
    childbyoid(381):dispatchlabel("opened")

  elseif label == "found" then
    --                                                                                

    --                                         
    childbyoid(381):dispatchlabel(label)
 
  elseif (label == "show") then
	--                                                                

    padlockmgr.setdirectionhint(this)

    local split_fx = childbyoid(378)
    split_fx:addtoworld()
    childbyoid(379):addtoworld()
    split_fx:reset()
    split_fx:start()

    --                              
    audio.postevent("Play_Tornado_GrowthTargetReached")

    --                  
    audio.postevent("Play_Tornado_Merge")

    --                      
    childbyoid(381):dispatchlabel("fxballshow")

  elseif (label == "hide") then

    --                         
    local split_fx = childbyoid(378)
    split_fx:stop()
    split_fx:removefromworld()
    childbyoid(379):removefromworld()
    childbyoid(380):removefromworld()
    this:removefromworld()
    
    --                                         
    childbyoid(381):dispatchlabel(label)

    --                        
    childbyoid(381):dispatchlabel("fxballhide")

  elseif (label == "training_closed") then
    childbyoid(381):dispatchlabel("closed")
  elseif (label == "training_open") then
    childbyoid(381):dispatchlabel("open")
  elseif (label == "training_hide") then
    --                         
    local split_fx = childbyoid(378)
    split_fx:stop()
    split_fx:removefromworld()
    childbyoid(379):removefromworld()
    childbyoid(380):removefromworld()

    --                        
    childbyoid(381):dispatchlabel("fxballhide")
  end

end