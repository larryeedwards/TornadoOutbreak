introText = {
  1196,
  1197,
  1198,
  1199
}

function on_gameplaymoduleactive()
  --                                       
	while (tornadomgr.firstactivetornado == nil) do
	  pause(0.1)
	end

  --                
  gomgr.getbyoid(297):freeze()
  engine.pushmode(1)

  --           
  for i=1, #introText do
    gomgr.getbyoid(1656).location = 1
    gomgr.getbyoid(1656).buttonon = true
    gomgr.getbyoid(1656):settext(" textbox ", introText[i])
    gomgr.getbyoid(1656).finishonbuttonpress = (i == #introText)
    beginwait()
      gomgr.getbyoid(1656):start()
    endwait()
  end
  
  --                 
  if (playermgr.isinmultiplayer and not tagamestats.hasshownmpbosstutorial) then
    local mptext = { 1783, 1784 }
    for i=1, #mptext do
      gomgr.getbyoid(1656).location = 0
      gomgr.getbyoid(1656).buttonon = true
      if (i==1) then
        gomgr.getbyoid(1656).portrait = 2
      else
        gomgr.getbyoid(1656).portrait = 3
      end
      gomgr.getbyoid(1656):settext(" textbox ", mptext[i])
      beginwait()
        gomgr.getbyoid(1656):start()
      endwait()
    end
    tagamestats.hasshownmpbosstutorial = true
  end

  --         
  gomgr.getbyoid(297):unfreeze()
  engine.popmode(1)
  gomgr.getbyoid(481):stopallanims()
  gomgr.getbyoid(481):startanim("tute_idle", 0.0, 1.0, 1.0, 0)
  gomgr.getbyoid(481).shouldfacetornado = true

  pause(1.0)

--         
  gomgr.getbyoid(16):setfujitarating(3.8)
  gomgr.getbyoid(16).currenthealth = 5
  gomgr.getbyoid(16).isdisplayinghealth = true

--         
  gomgr.getbyoid(1639):setfujitarating(3.8)
  gomgr.getbyoid(1639).currenthealth = 5
  gomgr.getbyoid(1639).isdisplayinghealth = true

  tornadomgr.setfujitamax(3.8)
  tornadomgr.showtargetfujitainfo = false

  --                                                             
  cameramgr.playertargettarget = gomgr.getbyoid(432)

  gomgr.getbyoid(16).bosstarget = gomgr.getbyoid(432)
  gomgr.getbyoid(1639).bosstarget = gomgr.getbyoid(432)

  gomgr.getbyoid(1678):dispatchlabel("begin")
  
  --                                                             
  gomgr.getbyoid(431):dispatchlabel("unsafe")
  gomgr.getbyoid(1677):dispatchlabel("unsafe")

  gomgr.getbyoid(450):activate()

end

function on_label(label)

  if label == "weeniedead" then
    requestcomplete(true)
    gomgr.getbyoid(450):deactivate()
  end

end