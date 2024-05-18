function on_label(label)
  if label == "setup" then
	--                                         
	
	--                         
    childbyoid(3128):addtoworld()
    this:addtoworld()

    --                                             
    childbyoid(3129):dispatchlabel(label)
    childbyoid(3129):dispatchlabel("opened")

  elseif label == "found" then
    --                                                                                

    --                                         
    childbyoid(3129):dispatchlabel(label)
 
  elseif (label == "show") then
	--                                                                

    padlockmgr.setdirectionhint(this)

    local split_fx = childbyoid(3126)
    split_fx:addtoworld()
    childbyoid(3127):addtoworld()
    split_fx:reset()
    split_fx:start()

    --                              
    audio.postevent("Play_Tornado_GrowthTargetReached")

    --                  
    audio.postevent("Play_Tornado_Merge")

    --                      
    childbyoid(3129):dispatchlabel("fxballshow")

  elseif (label == "hide") then

    --                         
    local split_fx = childbyoid(3126)
    split_fx:stop()
    split_fx:removefromworld()
    childbyoid(3127):removefromworld()
    childbyoid(3128):removefromworld()
    this:removefromworld()
    
    --                                         
    childbyoid(3129):dispatchlabel(label)

    --                        
    childbyoid(3129):dispatchlabel("fxballhide")

  elseif (label == "training_closed") then
    childbyoid(3129):dispatchlabel("closed")
  elseif (label == "training_open") then
    childbyoid(3129):dispatchlabel("open")
  elseif (label == "training_hide") then
    --                         
    local split_fx = childbyoid(3126)
    split_fx:stop()
    split_fx:removefromworld()
    childbyoid(3127):removefromworld()
    childbyoid(3128):removefromworld()

    --                        
    childbyoid(3129):dispatchlabel("fxballhide")
  end

end