rankforsilo = false

function reset()
  tornadomgr.firstactivetornado:setfujitarating(0.5)
  tornadomgr.firstactivetornado:warp(gomgr.getbyoid(231))
  tornadomgr.showtornadorank = true
  tornadomgr.stormchambertimer:starttimerforboss(300)
  tornadomgr.stormchambertimer.shouldhideduringgamestop = true
  tornadomgr.stormchambertimer.isforcingdisplay = true
end

function on_gameplaymoduleactive()
  rankforsilo = false
  --                                              
  gomgr.getbyoid(261):dispatchlabel("weatherphase0")
  gomgr.getbyoid(264):dispatchlabel("weatherphase0")
  gomgr.getbyoid(262):dispatchlabel("weatherphase1")
  
  --                       
  gameplaymgr.markcheckpoint()
  
  --                                       
  while (tornadomgr.firstactivetornado == nil) do
	  pause(0.1)
	  logline("waiting")
	end
  reset()
end

--                                                     
weenie1dead = false
weenie2dead = false
timedout = false
function on_label(label)
  if label == "weenie1dead" then
    weenie1dead = true
  elseif label == "weenie2dead" then
    weenie2dead = true
  end
  
  if weenie1dead and weenie2dead then
    requestcomplete(true)
  end
end

function on_gameplaymoduleupdate()
  --                                       
  if (tornadomgr.firstactivetornado == nil) then return end
	
  --                                     
  if tornadomgr.firstactivetornado:fujrating() >= 3.4 and not rankforsilo then
    rankforsilo = true
    engine.pushmode(1)
    beginwait()
      audio.postevent("enter_camera_slowdown")
      time.lerptotimescale(1.0, 0.1)
    endwait()
    gomgr.getbyoid(3568).location = 0
    gomgr.getbyoid(3568).portrait = 1
    gomgr.getbyoid(3568).buttonon = true
    gomgr.getbyoid(3568):settext(" textbox ", 1473)
    beginwait()
      gomgr.getbyoid(3568):start()
    endwait()
    beginwait()
      audio.postevent("exit_camera_slowdown")
      time.lerptotimescale(1.0, 1.0)
    endwait()
    engine.popmode(1)
  end
  
  --                           
  if (tornadomgr.stormchambertimer.timervalue <= 0 and not timedout) then
    timedout = true
    beginwait()
		  uimgr.playoutoftime();
	  endwait()
	  cameramgr.screenfade(0, 0.7, 0.25, 1.0)
	  pause(0.8)  
    reset()
    gameplaymgr.restorecheckpoint()
    gomgr.getbyoid(261):dispatchlabel("weatherphase0")
    rankforsilo = false
    timedout = false
  end
end