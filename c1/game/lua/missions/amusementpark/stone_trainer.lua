stompdetected = false
brokendetected = false
stompfinished = false
elementaladded = false
rockfreed = false
  
introText = {
  1102,
  1103,
  1104
}
successText1 = {
  1106,
  1107,
  1108
}
successText2 = {
  1109,
  1111,
  1490
}
taskText1 = {
  1773,
  1774,
}
taskText2 = {
  1775,
  1776,
}

function on_label(label)
  if (label == "on_rockhit") then
    gomgr.getbyoid(3801):settaskcomplete(0)
  end
end

function reset(text)
  tornadomgr.firstactivetornado.showgrowthinfo = false
	tornadomgr.firstactivetornado:setfujitarating(2.0)
	
	--                
  gomgr.getbyoid(212):freeze()
  engine.pushmode(1)
  
  --                           
  gomgr.getbyoid(289):stopallanims()
  beginwait()
    gomgr.getbyoid(289):startanimandwait("wake_up")
  endwait()
  gomgr.getbyoid(289):startanim("standing_idle",0,1.0,1.0,0)
    
  --           
  gomgr.getbyoid(3800).location = 1
  gomgr.getbyoid(3800).buttonon = true
  for i = 1, #text do
    gomgr.getbyoid(3800).finishonbuttonpress = (i==#text)
    gomgr.getbyoid(3800):settext(" textbox ", text[i])
    gomgr.getbyoid(3800).finishonbuttonpress = (i==#text)
    beginwait()
      gomgr.getbyoid(3800):start()
    endwait()
  end
    
  --         
  gomgr.getbyoid(212):unfreeze()
  gomgr.getbyoid(289).shouldfacetornado = true
  
  --               
  gomgr.getbyoid(3801):cleartasktext()
  gomgr.getbyoid(3801).taskcount = #taskText1
  gomgr.getbyoid(3801).taskportrait = 1
  for i = 1, #taskText1 do
    gomgr.getbyoid(3801):settasktext(i-1, taskText1[i])
  end
  gomgr.getbyoid(3801):start()
  
  --                                        
  pause(1.0)
  engine.popmode(1)
end

--      
ready = false
function on_gameplaymoduleactive()
  --                                       
	while (tornadomgr.firstactivetornado == nil) do
	  pause(0.1)
	end
	ready = true
	
    gomgr.getbyoid(549):removefromworld()
    gomgr.getbyoid(553):removefromworld()
    gomgr.getbyoid(554):removefromworld()
    gomgr.getbyoid(555):removefromworld()
    gomgr.getbyoid(556):removefromworld()
    gomgr.getbyoid(557):removefromworld()
    gomgr.getbyoid(558):removefromworld()
    gomgr.getbyoid(559):removefromworld()
    gomgr.getbyoid(560):removefromworld()
    gomgr.getbyoid(561):removefromworld()
    gomgr.getbyoid(562):removefromworld()
    gomgr.getbyoid(563):removefromworld()
	
  tornadomgr.enableskill(0)
  if (tagamestats.hasshownstomptutorial) then
    requestcomplete(true)
  else
    gomgr.getbyoid(241):dispatchlabel("weatherphase0")
    gomgr.getbyoid(237):dispatchlabel("weatherphase1")
    reset(introText)
  end
end

function allbroken()
  return (not gomgr.getbyoid(293).canbreaknext and 
          not gomgr.getbyoid(297).canbreaknext and 
          not gomgr.getbyoid(298).canbreaknext and
	        not gomgr.getbyoid(299).canbreaknext and
	        not gomgr.getbyoid(300).canbreaknext and 
	        not gomgr.getbyoid(301).canbreaknext)
end

--                      
function on_gameplaymoduleupdate()
  if (not ready) then return end

  if (not stompdetected and tornadomgr.firstactivetornado:isjumping()) then
    stompdetected = true
    gomgr.getbyoid(3801):settaskcomplete(0)
  end

  --                                                           
  if (not brokendetected and allbroken()) then
    tornadomgr.firstactivetornado.ignoreallinput = true
    brokendetected = true
    gomgr.getbyoid(3801):settaskcomplete(1)
    pause(1.0)
    gomgr.getbyoid(3801):finish()
    pause(1.0)
    engine.pushmode(1)
    for i = 1, #successText1 do
      gomgr.getbyoid(3800).buttonon = true
      gomgr.getbyoid(3800).location = 0
      if (i==2) then
        gomgr.getbyoid(3800).location = 1
        cameramgr.screenfade(0, 0.7, 1.5, 1.5)
        pause(0.8)
        gomgr.getbyoid(292):addtoworld()
        elementaladded = true
        gomgr.getbyoid(212):freeze()
      elseif (i == 3) then 
        gomgr.getbyoid(212):unfreeze()
        cinematic.play("cine_stomp")
        gomgr.getbyoid(3800).portrait = 4
      else
        gomgr.getbyoid(3800).portrait = 4
      end
      gomgr.getbyoid(3800):settext(" textbox ", successText1[i])
      beginwait()
        gomgr.getbyoid(3800):start()
      endwait()
    end
    cinematic.stop()
    if (tornadomgr.firstactivetornado == gomgr.getbyoid(16)) then
      cameramgr.deactivatecamera(0, 14, 0)
    else
      cameramgr.deactivatecamera(1, 14, 0)
    end
    pause(1.0)
    engine.popmode(1)
    stompfinished = true
    
    --               
    gomgr.getbyoid(3801):cleartasktext()
    gomgr.getbyoid(3801).taskcount = #taskText2
    gomgr.getbyoid(3801).taskportrait = 1
    for i = 1, #taskText2 do
      gomgr.getbyoid(3801):settasktext(i-1, taskText2[i])
    end
    gomgr.getbyoid(3801):start()
    tornadomgr.firstactivetornado.ignoreallinput = false
  
  elseif (brokendetected and stompfinished and elementaladded and not rockfreed and not gomgr.getbyoid(292).inworld) then
    tornadomgr.firstactivetornado.ignoreallinput = true
    gomgr.getbyoid(3801):settaskcomplete(1)
    rockfreed = true
    pause(1.0)
    gomgr.getbyoid(3801):finish()
    pause(1.0)
    engine.pushmode(1)
    
    for i = 1, #successText2 do
      gomgr.getbyoid(3800).location = 0
      gomgr.getbyoid(3800).portrait = 4
      gomgr.getbyoid(3800).buttonon = true
      gomgr.getbyoid(3800):settext(" textbox ", successText2[i])
      gomgr.getbyoid(3800).finishonbuttonpress = (i==#successText2)
      beginwait()
        gomgr.getbyoid(3800):start()
      endwait()
    end
    engine.popmode(1)
    gomgr.getbyoid(3801):finish()
    
    cameramgr.screenfade(0, 0.7, 1.5, 1.5)
    pause(0.8)
    tagamestats.hasshownstomptutorial = true
    gomgr.getbyoid(289):removefromworld()
    tornadomgr.firstactivetornado.ignoreallinput = false
    requestcomplete(true)
  end
  
end

function on_gameplaymodulecomplete()
  gomgr.getbyoid(237):dispatchlabel("weatherphase0")
end