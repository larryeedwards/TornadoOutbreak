realcine = false
modulecompleted = false
finishnaturally = false
cine_firesprites = {}

function on_postload()

    cine_firesprites[1] = gomgr.getbyoid(549)
    cine_firesprites[2] = gomgr.getbyoid(553)
    cine_firesprites[3] = gomgr.getbyoid(554)
    cine_firesprites[4] = gomgr.getbyoid(555)
    cine_firesprites[5] = gomgr.getbyoid(556)
    cine_firesprites[6] = gomgr.getbyoid(557)
    cine_firesprites[7] = gomgr.getbyoid(558)
    cine_firesprites[8] = gomgr.getbyoid(559)
    cine_firesprites[9] = gomgr.getbyoid(560)
    cine_firesprites[10] = gomgr.getbyoid(561)
    cine_firesprites[11] = gomgr.getbyoid(562)
    cine_firesprites[12] = gomgr.getbyoid(563)
    
    --                                                                        
    tornadomgr.enableaccoutrement(1)
end

function on_gameplaymoduleactive()

    gomgr.getbyoid(549):addtoworld()
    gomgr.getbyoid(553):addtoworld()
    gomgr.getbyoid(554):addtoworld()
    gomgr.getbyoid(555):addtoworld()
    gomgr.getbyoid(556):addtoworld()
    gomgr.getbyoid(557):addtoworld()
    gomgr.getbyoid(558):addtoworld()
    gomgr.getbyoid(559):addtoworld()
    gomgr.getbyoid(560):addtoworld()
    gomgr.getbyoid(561):addtoworld()
    gomgr.getbyoid(562):addtoworld()
    gomgr.getbyoid(563):addtoworld()

  tornadomgr.enableskill(4)
  tornadomgr.enableskill(0)
  tornadomgr.enableskill(5)
  engine.pushmode(1)
  gomgr.getbyoid(241):dispatchlabel("weatherphase0")
  gomgr.getbyoid(303):dispatchlabel("hide")
  gomgr.getbyoid(303):childbyoid(304):childbyoid(308):dispatchlabel("hide")
  gomgr.getbyoid(318):dispatchlabel("hide")
  gomgr.getbyoid(318):childbyoid(304):childbyoid(308):dispatchlabel("hide")
  gomgr.getbyoid(321):dispatchlabel("hide")
  gomgr.getbyoid(321):childbyoid(304):childbyoid(308):dispatchlabel("hide")
  
  realcine = true
  cinematic.play("flythrough_new")
  pause(0.1)
  cameramgr.activatecamera(0, 14, 0)
  cameramgr.activatecamera(1, 14, 0)
--                                   
  audio.postevent("enter_flying_to_next_area")
    
  checkforcomplete()

end

function on_label(label)

  if label == "cinematic_start" then
    gomgr.getbyoid(547).path = gomgr.getbyoid(275)
    gomgr.getbyoid(548):dispatchlabel("cine_fly")
    gomgr.getbyoid(564):removefromworld()
    gomgr.getbyoid(424).trackedobject = gomgr.getbyoid(547)
    gomgr.getbyoid(425).trackedobject = gomgr.getbyoid(548)
    gomgr.getbyoid(248).curphase = 1
    gomgr.getbyoid(247).curphase = 1
    gomgr.getbyoid(238):dispatchlabel("weatherphase0")
    if realcine == false then
      cameramgr.screenfade(0, 0.0, 0.1, 1.5)
      gomgr.getbyoid(198):settext("textTransitionPrompt", 918)
      gomgr.getbyoid(198):settext("textZone", 900)
      gomgr.getbyoid(198):start()
    end
    for i = 1, #cine_firesprites do
      cine_firesprites[i]:dispatchlabel("reset")
    end
  elseif label == "cinematic_split" then
    if modulecompleted == false or realcine == false then
      gomgr.getbyoid(547).path = gomgr.getbyoid(274)
    end
    
  elseif label == "cinematic_shadow" then
    if modulecompleted == false or realcine == false then
      gomgr.getbyoid(420):dispatchlabel("grow")
      gomgr.getbyoid(238):dispatchlabel("grow")
      gomgr.getbyoid(238).curphase = 2
      gomgr.getbyoid(288):addtoworld()
      finishnaturally = true
    end
    
  elseif label == "cinematic_avatar_at_end" then
    if modulecompleted == false or realcine == false then
      gomgr.getbyoid(564):dispatchlabel("loopingidle")
    end
    
  end
  
end

function checkforcomplete()
  if realcine == true and modulecompleted == false then
    pause(1.0)
    beginwait()
      gomgr.getbyoid(198):settext("textTransitionPrompt", 918)
      gomgr.getbyoid(198):settext("textZone", 900)
      gomgr.getbyoid(198):start()
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
  gomgr.getbyoid(564):dispatchlabel("loopingidleoff")
  gomgr.getbyoid(548):removefromworld()
  gomgr.getbyoid(547):removefromworld()
  cameramgr.activatecamerakind(1)
  engine.popmode(1)
end