expandedarea = false
rankforbarn = false
leaveFenceText = {
  1135,
  1136,
}

barnDeadText = {
  1120
}

function on_gameplaymoduleactive()
  --                                              
  gomgr.getbyoid(264):dispatchlabel("weatherphase0")
  gomgr.getbyoid(260):dispatchlabel("weatherphase1")
  gomgr.getbyoid(57):addtoworld()
  tornadomgr.showtornadorank = true
  expandedarea = false
  
  --                                       
  while (tornadomgr.firstactivetornado == nil) do
	  pause(0.1)
	  logline("waiting")
	end
  tornadomgr.firstactivetornado:setfujitarating(0.1)
end

function on_gameplaymoduleupdate()
	--                         
  if tornadomgr.getcombinedfujita() >= 1 and not expandedarea then
    expandedarea = true
  
    --                                     
    engine.pushmode(1)
    beginwait()
      audio.postevent("enter_camera_slowdown")
      time.lerptotimescale(1.0, 0.1)
    endwait()
    for i = 1, #leaveFenceText do
      gomgr.getbyoid(3568).location = 0
      gomgr.getbyoid(3568).portrait = 1
      gomgr.getbyoid(3568).buttonon = true
      gomgr.getbyoid(3568):settext(" textbox ", leaveFenceText[i])
      gomgr.getbyoid(3568).finishonbuttonpress = (i==#leaveFenceText)
      beginwait()
        gomgr.getbyoid(3568):start()
      endwait()
    end
    beginwait()
      audio.postevent("exit_camera_slowdown")
      time.lerptotimescale(1.0, 1.0)
    endwait()
    engine.popmode(1)
    gomgr.getbyoid(57):removefromworld()
--                                                               
    
  elseif tornadomgr.getcombinedfujita() >= 3.4 and not rankforbarn then
    rankforbarn = true
  
    --                                   
    engine.pushmode(1)
    beginwait()
      audio.postevent("enter_camera_slowdown")
      time.lerptotimescale(1.0, 0.1)
    endwait()
    gomgr.getbyoid(3568).location = 0
    gomgr.getbyoid(3568).portrait = 1
    gomgr.getbyoid(3568).buttonon = true
    gomgr.getbyoid(3568):settext(" textbox ", 1472)
    beginwait()
      gomgr.getbyoid(3568):start()
    endwait()
    beginwait()
      audio.postevent("exit_camera_slowdown")
      time.lerptotimescale(1.0, 1.0)
    endwait()
    engine.popmode(1)
  end
end

--                                                     
function on_label(label)
  if label == "weeniedead" then
    engine.pushmode(1)
    cinematic.play("barnSlowdown")
  
    --          
    gomgr.getbyoid(3568).location = 0
    gomgr.getbyoid(3568).portrait = 1
    gomgr.getbyoid(3568).buttonon = true
    for i = 1, #barnDeadText do
      gomgr.getbyoid(3568):settext(" textbox ", barnDeadText[i])
      gomgr.getbyoid(3568).finishonbuttonpress = (i==#barnDeadText)
      beginwait()
        gomgr.getbyoid(3568):start()
      endwait()
    end
    
    --       
    cinematic.stop()
    engine.popmode(1)
    cameramgr.screenfade(0, 0.7, 0.25, 1.0)
    pause(0.8)
    gomgr.getbyoid(260):dispatchlabel("weatherphase0")
    gomgr.getbyoid(261):dispatchlabel("weatherphase1")
    requestcomplete(true)
  end
end