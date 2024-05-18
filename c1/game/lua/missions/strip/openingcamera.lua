realcine = false
modulecompleted = false
finishnaturally = false
cine_firesprites = {}

function on_postload()
    cine_firesprites[1] = gomgr.getbyoid(550)
    cine_firesprites[2] = gomgr.getbyoid(554)
    cine_firesprites[3] = gomgr.getbyoid(555)
    cine_firesprites[4] = gomgr.getbyoid(556)
    cine_firesprites[5] = gomgr.getbyoid(557)
    cine_firesprites[6] = gomgr.getbyoid(558)
    cine_firesprites[7] = gomgr.getbyoid(559)
    cine_firesprites[8] = gomgr.getbyoid(560)
    cine_firesprites[9] = gomgr.getbyoid(561)
    cine_firesprites[10] = gomgr.getbyoid(562)
    cine_firesprites[11] = gomgr.getbyoid(563)
    cine_firesprites[12] = gomgr.getbyoid(564)
end

function on_gameplaymoduleactive()
  tornadomgr.enableskill(4)
  engine.pushmode(1)
  gomgr.getbyoid(235):dispatchlabel("weatherphase0")
  gomgr.getbyoid(376):dispatchlabel("hide")
  gomgr.getbyoid(376):childbyoid(377):childbyoid(381):dispatchlabel("hide")
  gomgr.getbyoid(391):dispatchlabel("hide")
  gomgr.getbyoid(391):childbyoid(377):childbyoid(381):dispatchlabel("hide")
  gomgr.getbyoid(394):dispatchlabel("hide")
  gomgr.getbyoid(394):childbyoid(377):childbyoid(381):dispatchlabel("hide")
  
  realcine = true
  cinematic.play("flythrough_new")
--                                   
  audio.postevent("enter_flying_to_next_area")
    
  checkforcomplete()

end

function on_label(label)

  if label == "cinematic_start" then
    gomgr.getbyoid(548).path = gomgr.getbyoid(255)
    gomgr.getbyoid(549):dispatchlabel("cine_fly")
    gomgr.getbyoid(389):removefromworld()
    gomgr.getbyoid(533).trackedobject = gomgr.getbyoid(548)
    gomgr.getbyoid(534).trackedobject = gomgr.getbyoid(549)
    gomgr.getbyoid(238).curphase = 1
    gomgr.getbyoid(237).curphase = 1
    gomgr.getbyoid(232):dispatchlabel("weatherphase0")
    if realcine == false then
      cameramgr.screenfade(0, 0.0, 0.1, 1.5)
      gomgr.getbyoid(197):settext("textTransitionPrompt", 918)
      gomgr.getbyoid(197):settext("textZone", 900)
      gomgr.getbyoid(197):start()
    end
    for i = 1, #cine_firesprites do
      cine_firesprites[i]:dispatchlabel("reset")
    end

  elseif label == "cinematic_split" then
    if modulecompleted == false or realcine == false then
      gomgr.getbyoid(548).path = gomgr.getbyoid(254)
    end
    
  elseif label == "cinematic_shadow" then
    if modulecompleted == false or realcine == false then
      gomgr.getbyoid(528):dispatchlabel("grow")
      gomgr.getbyoid(232):dispatchlabel("grow")
      gomgr.getbyoid(232).curphase = 2
      gomgr.getbyoid(268):addtoworld()
      finishnaturally = true
    end
    
  elseif label == "cinematic_avatar_at_end" then
    if modulecompleted == false or realcine == false then
      gomgr.getbyoid(389):dispatchlabel("loopingidle")
    end
    
  end
  
end

function checkforcomplete()
  if realcine == true and modulecompleted == false then
    pause(1.0)
    beginwait()
      gomgr.getbyoid(197):settext("textTransitionPrompt", 918)
      gomgr.getbyoid(197):settext("textZone", 900)
      gomgr.getbyoid(197):start()
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
  gomgr.getbyoid(389):dispatchlabel("loopingidleoff")
  gomgr.getbyoid(549):removefromworld()
  gomgr.getbyoid(548):removefromworld()
  cameramgr.activatecamerakind(1)
  engine.popmode(1)
  gomgr.getbyoid(238).curphase = 0
  gomgr.getbyoid(237).curphase = 0
end