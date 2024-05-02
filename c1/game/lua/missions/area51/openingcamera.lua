realcine = false
modulecompleted = false
finishnaturally = false
cine_firesprites = {}

function on_postload()
    cine_firesprites[1] = gomgr.getbyoid(3370)
    cine_firesprites[2] = gomgr.getbyoid(3374)
    cine_firesprites[3] = gomgr.getbyoid(3375)
    cine_firesprites[4] = gomgr.getbyoid(3376)
    cine_firesprites[5] = gomgr.getbyoid(3377)
    cine_firesprites[6] = gomgr.getbyoid(3378)
    cine_firesprites[7] = gomgr.getbyoid(3379)
    cine_firesprites[8] = gomgr.getbyoid(3380)
    cine_firesprites[9] = gomgr.getbyoid(3381)
    cine_firesprites[10] = gomgr.getbyoid(3382)
    cine_firesprites[11] = gomgr.getbyoid(3383)
    cine_firesprites[12] = gomgr.getbyoid(3384)
end

function on_gameplaymoduleactive()
  tornadomgr.enableskill(4)
  engine.pushmode(1)
  gomgr.getbyoid(3083):dispatchlabel("weatherphase0")
  gomgr.getbyoid(3124):dispatchlabel("hide")
  gomgr.getbyoid(3124):childbyoid(3125):childbyoid(3129):dispatchlabel("hide")
  gomgr.getbyoid(3138):dispatchlabel("hide")
  gomgr.getbyoid(3138):childbyoid(3125):childbyoid(3129):dispatchlabel("hide")
  gomgr.getbyoid(3141):dispatchlabel("hide")
  gomgr.getbyoid(3141):childbyoid(3125):childbyoid(3129):dispatchlabel("hide")
  
  realcine = true
  cinematic.play("flythrough_new")
 --                                   
  audio.postevent("enter_flying_to_next_area")
   
  checkforcomplete()

end

function on_label(label)

  if label == "cinematic_start" then
    gomgr.getbyoid(3368).path = gomgr.getbyoid(3100)
    gomgr.getbyoid(3369):dispatchlabel("cine_fly")
    gomgr.getbyoid(3136):removefromworld()
    gomgr.getbyoid(3241).trackedobject = gomgr.getbyoid(3368)
    gomgr.getbyoid(3242).trackedobject = gomgr.getbyoid(3369)
    gomgr.getbyoid(3085).curphase = 1
    gomgr.getbyoid(3084).curphase = 1
    gomgr.getbyoid(3080):dispatchlabel("weatherphase0")
    if realcine == false then
      cameramgr.screenfade(0, 0.0, 0.1, 1.5)
      gomgr.getbyoid(196):settext("textTransitionPrompt", 918)
      gomgr.getbyoid(196):settext("textZone", 900)
      gomgr.getbyoid(196):start()
    end
    for i = 1, #cine_firesprites do
      cine_firesprites[i]:dispatchlabel("reset")
    end

  elseif label == "cinematic_split" then
    if modulecompleted == false or realcine == false then
      gomgr.getbyoid(3368).path = gomgr.getbyoid(3099)
    end
    
  elseif label == "cinematic_shadow" then
    if modulecompleted == false or realcine == false then
      gomgr.getbyoid(3236):dispatchlabel("grow")
      gomgr.getbyoid(3080):dispatchlabel("grow")
      gomgr.getbyoid(3080).curphase = 2
      gomgr.getbyoid(3113):addtoworld()
      finishnaturally = true
    end
    
  elseif label == "cinematic_avatar_at_end" then
    if modulecompleted == false or realcine == false then
      gomgr.getbyoid(3136):dispatchlabel("loopingidle")
    end
    
  end
  
end

function checkforcomplete()
  if realcine == true and modulecompleted == false then
    pause(1.0)
    beginwait()
      gomgr.getbyoid(196):settext("textTransitionPrompt", 918)
      gomgr.getbyoid(196):settext("textZone", 900)
      gomgr.getbyoid(196):start()
    endwait()
    cameramgr.screenfade(0, 0.7, 0.25, 1.0)
    
    if finishnaturally == false then
      for i = 1, #cine_firesprites do
        cine_firesprites[i]:dispatchlabel("remove")
      end
    end
    
    pause(0.8)
    
    modulecompleted = true
    realcine = false
    requestcomplete(true)
    else

  end
end

function on_gameplaymodulecomplete()
--                                   
  audio.postevent("exit_flying_to_next_area")
  gomgr.getbyoid(3136):removefromworld()
  gomgr.getbyoid(3369):removefromworld()
  gomgr.getbyoid(3136):dispatchlabel("loopingidleoff")
  gomgr.getbyoid(3368):removefromworld()
  cameramgr.activatecamerakind(1)
  engine.popmode(1)
  gomgr.getbyoid(3085).curphase = 0
  gomgr.getbyoid(3084).curphase = 0
end