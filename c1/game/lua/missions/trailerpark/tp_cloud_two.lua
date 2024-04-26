paused = false

function on_label(label)
  if paused == false then
  
    paused = true  
    
    if label == "grow" then
      growing = true
      addtoworld()
      stopallanims()
      beginwait()
        startanimandwait("anim_grow")
      endwait()
      startanim("idle",0,1.0,1.0,0)
      growing = false

    elseif label == "shrink" then
      stopallanims()
      startanim("anim_shrink",0,1.0,1.0,0)
      pause(0.1)
      stopallanims()
      beginwait()
        startanimandwait("anim_shrink")
      endwait()
      removefromworld()

    elseif label == "idle_high" then
      stopallanims()
      startanim("idle_high",0,1.0,1.0,0)

    elseif label == "default" then
      stopallanims()
      startanim("idle",0,1.0,1.0,0)

    end
    
  paused = false
  
  end  
end