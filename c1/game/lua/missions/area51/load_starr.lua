function on_label(label)

  if label == "show" then
    addtoworld()
    childbyoid(619):addtoworld()
    
  elseif label == "hide" then
    removefromworld()
    childbyoid(3130):stop()
    childbyoid(619):removefromworld()
    
  elseif label == "opened" then
      addtoworld()
      stopallanims()
      startanim("open_idle",0,1.0,1.0,0)
      childbyoid(619):addtoworld()

  elseif label == "close" then
    childbyoid(3130):stop()
    childbyoid(3131):reset()
    childbyoid(3131):start()
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
      childbyoid(3130):stop()
      
  elseif label == "fxballshow" then
      childbyoid(3130):reset()
      childbyoid(3130):start()
    
  end
end