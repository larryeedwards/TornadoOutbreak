triggered = false

function on_postload()
  racemgr = gomgr.getbyoid(2958)
  
  racemgr:addtrigger(gomgr.getbyoid(285))
  racemgr:addtrigger(gomgr.getbyoid(306))
  racemgr:addtrigger(gomgr.getbyoid(307))
  racemgr:addtrigger(gomgr.getbyoid(308))
  racemgr:addtrigger(gomgr.getbyoid(309))
  racemgr:addtrigger(gomgr.getbyoid(310))
  racemgr:addtrigger(gomgr.getbyoid(311))
  racemgr:addtrigger(gomgr.getbyoid(312))
  racemgr:addtrigger(gomgr.getbyoid(313))
  racemgr:addtrigger(gomgr.getbyoid(314))
  racemgr:addtrigger(gomgr.getbyoid(315))
  racemgr:addtrigger(gomgr.getbyoid(316))
  racemgr:addtrigger(gomgr.getbyoid(317))
  racemgr:addtrigger(gomgr.getbyoid(318))
  racemgr:addtrigger(gomgr.getbyoid(319))
  racemgr:addtrigger(gomgr.getbyoid(320))
  racemgr:addtrigger(gomgr.getbyoid(321))
  racemgr:addtrigger(gomgr.getbyoid(322))
  racemgr:addtrigger(gomgr.getbyoid(323))
  racemgr:addtrigger(gomgr.getbyoid(324))
  racemgr:addtrigger(gomgr.getbyoid(325))
  racemgr:addtrigger(gomgr.getbyoid(326))
  racemgr:addtrigger(gomgr.getbyoid(327))
  racemgr:addtrigger(gomgr.getbyoid(328))
  racemgr:addtrigger(gomgr.getbyoid(329))
  racemgr:addtrigger(gomgr.getbyoid(330))
  racemgr:addtrigger(gomgr.getbyoid(331))
  racemgr:addtrigger(gomgr.getbyoid(332))
  racemgr:addtrigger(gomgr.getbyoid(333))
  racemgr:addtrigger(gomgr.getbyoid(334))
end

function add_glows()
  gomgr.getbyoid(335):addtoworld()
  gomgr.getbyoid(336):addtoworld()
  gomgr.getbyoid(337):addtoworld()
  gomgr.getbyoid(338):addtoworld()
  gomgr.getbyoid(339):addtoworld()
  gomgr.getbyoid(340):addtoworld()
  gomgr.getbyoid(341):addtoworld()
  gomgr.getbyoid(342):addtoworld()
  gomgr.getbyoid(343):addtoworld()
  gomgr.getbyoid(344):addtoworld()
  gomgr.getbyoid(345):addtoworld()
  gomgr.getbyoid(346):addtoworld()
  gomgr.getbyoid(347):addtoworld()
  gomgr.getbyoid(348):addtoworld()
  gomgr.getbyoid(349):addtoworld()
  gomgr.getbyoid(350):addtoworld()
  gomgr.getbyoid(351):addtoworld()
  gomgr.getbyoid(352):addtoworld()
  gomgr.getbyoid(353):addtoworld()
  gomgr.getbyoid(354):addtoworld()
  gomgr.getbyoid(355):addtoworld()
  gomgr.getbyoid(356):addtoworld()
  gomgr.getbyoid(357):addtoworld()
  gomgr.getbyoid(358):addtoworld()
  gomgr.getbyoid(359):addtoworld()
  gomgr.getbyoid(360):addtoworld()
  gomgr.getbyoid(361):addtoworld()
  gomgr.getbyoid(362):addtoworld()
  gomgr.getbyoid(363):addtoworld()
  gomgr.getbyoid(364):addtoworld()
end

function main_fx(obj)
 obj:childbyoid(287):reset()
 obj:childbyoid(287):start()
end

function gear1_fx(obj)
 obj:childbyoid(294):reset()
 obj:childbyoid(294):start()
 obj:childbyoid(293):reset()
 obj:childbyoid(293):start()
 obj:childbyoid(299):reset()
 obj:childbyoid(299):start()
 obj:childbyoid(300):reset()
 obj:childbyoid(300):start()
end

function gear2_fx(obj)
 obj:childbyoid(296):reset()
 obj:childbyoid(296):start()
 obj:childbyoid(295):reset()
 obj:childbyoid(295):start()
 obj:childbyoid(301):reset()
 obj:childbyoid(301):start()
 obj:childbyoid(302):reset()
 obj:childbyoid(302):start()
end

function gear3_fx(obj)
 obj:childbyoid(298):reset()
 obj:childbyoid(298):start()
 obj:childbyoid(297):reset()
 obj:childbyoid(297):start()
 obj:childbyoid(303):reset()
 obj:childbyoid(303):start()
 obj:childbyoid(304):reset()
 obj:childbyoid(304):start()
end

function stop_fx(obj)
 obj:childbyoid(298):stop()
 obj:childbyoid(297):stop()
 obj:childbyoid(296):stop()
 obj:childbyoid(295):stop()
 obj:childbyoid(294):stop()
 obj:childbyoid(293):stop()
 obj:childbyoid(299):stop()
 obj:childbyoid(300):stop()
 obj:childbyoid(301):stop()
 obj:childbyoid(302):stop()
 obj:childbyoid(303):stop()
 obj:childbyoid(304):stop()
 obj:childbyoid(287):stop()
end

--      
function on_gameplaymoduleactive()

  while (tornadomgr.firstactivetornado == nil) do
	  pause(0.1)
	end

  local introText = {
    1180,
    1185,
    1187,
    1189
  }

  --               
  tornadomgr.stormchambertimer:finish()

  tornadomgr.showtargetfujitainfo = false
  gomgr.getbyoid(16):setfujitarating(2.0)
  tornadomgr.setfujitamax(2.0)

  add_glows()
  
  --               
  gomgr.getbyoid(479):dispatchlabel("reset")
  gomgr.getbyoid(16):warp(gomgr.getbyoid(251))
	
	--                
  gomgr.getbyoid(220):freeze()
  engine.pushmode(1)
  
  --           
  for i = 1, #introText do
    
    --        
    if i == 1 then 
      main_fx(gomgr.getbyoid(285))
      main_fx(gomgr.getbyoid(285))
    elseif i == 2 then gear1_fx(gomgr.getbyoid(285))
    elseif i == 3 then gear2_fx(gomgr.getbyoid(285))
    elseif i == 4 then gear3_fx(gomgr.getbyoid(285)) end
    
    gomgr.getbyoid(2938).location = 1
    gomgr.getbyoid(2938).buttonon = true
    gomgr.getbyoid(2938):settext(" textbox ", introText[i])
    gomgr.getbyoid(2938).finishonbuttonpress = (i==#introText)
    beginwait()
      gomgr.getbyoid(2938):start()
    endwait()
    
    if i == 4 then
      gomgr.getbyoid(479):removefromworld()
    end
  end
  
  --                 
  if (playermgr.isinmultiplayer and not tagamestats.hasshownmpracetutorial) then
    local mptext = { 1783, 1784 }
    for i=1, #mptext do
      gomgr.getbyoid(2938).location = 0
      gomgr.getbyoid(2938).buttonon = true
      if (i==1) then
        gomgr.getbyoid(2938).portrait = 2
      else
        gomgr.getbyoid(2938).portrait = 3
      end
      gomgr.getbyoid(2938):settext(" textbox ", mptext[i])
      beginwait()
        gomgr.getbyoid(2938):start()
      endwait()
    end
    tagamestats.hasshownmpracetutorial = true
  end
    
  --         
  gomgr.getbyoid(220):unfreeze()
  engine.popmode(1)
  
  --                           
  --                                                 
  --                                                   
  requestcomplete(true)
  --                                     
end