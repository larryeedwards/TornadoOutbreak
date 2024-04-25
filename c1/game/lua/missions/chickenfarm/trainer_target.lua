function on_label(label)
    if label == "setup" then
  
      childbyoid(445):addtoworld()
      childbyoid(445):reset()
      childbyoid(445):start()
      childbyoid(443):addtoworld()
  
    elseif label == "found" then
  
      --                  
      --                                       
      --                                      
  
      --                   
      childbyoid(444):addtoworld()
      childbyoid(444):reset()
      childbyoid(444):start()
    
    elseif label == "hide" then
  
      childbyoid(445):removefromworld()
      childbyoid(444):removefromworld()
      childbyoid(443):removefromworld()
  
    end
  
  end
	 --                                                
function on_triggered(triggeree)
  gameplaymgr.currentgameplaymodule:dispatchlabel("on_triggered")
  end
    