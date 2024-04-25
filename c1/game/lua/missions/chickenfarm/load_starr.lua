function on_label(label)

    if label == "show" then
      addtoworld()
      childbyoid(406):addtoworld()
      
    elseif label == "hide" then
      removefromworld()
      childbyoid(440):stop()
      childbyoid(406):removefromworld()
      
    elseif label == "opened" then
        addtoworld()
        stopallanims()
        startanim("open_idle",0,1.0,1.0,0)
        childbyoid(406):addtoworld()
  
    elseif label == "close" then
      childbyoid(440):stop()
      childbyoid(441):reset()
      childbyoid(441):start()
      pause(1.0)
      stopallanims()
      postaudioevent("Play_LODE_Collapse")
      beginwait()
        startanimandwait("closing")
      endwait()
      startanim("closed_idle",0,1.0,1.0,0)
  
    elseif label == "closed" then
        stopallanims()
        startanim("closed_idle",0,1.0,1.0,0)
  
    elseif label == "open" then
      stopallanims()
      beginwait()
        startanimandwait("opening")
      endwait()
      startanim("open_idle",0,1.0,1.0,0)
  
    elseif label == "fxballhide" then
        childbyoid(440):stop()
        
    elseif label == "fxballshow" then
        childbyoid(440):reset()
        childbyoid(440):start()
      
    end
  end