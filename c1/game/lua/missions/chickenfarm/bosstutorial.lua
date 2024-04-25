bossTutorialText = {
    1126,
    1127
  }
  
  --      
  function on_gameplaymoduleactive()
      
      --                
    gomgr.getbyoid(248):freeze()
    engine.pushmode(1)
    
    --           
    gomgr.getbyoid(3568).location = 1
    gomgr.getbyoid(3568).buttonon = true
    for i = 1, #bossTutorialText do
      gomgr.getbyoid(3568):settext(" textbox ", bossTutorialText[i])
      gomgr.getbyoid(3568).finishonbuttonpress = (i==#bossTutorialText)
      beginwait()
        gomgr.getbyoid(3568):start()
      endwait()
    end
      
    --         
    gomgr.getbyoid(248):unfreeze()
    gomgr.getbyoid(462):dispatchlabel("idle")
    engine.popmode(1)
    requestcomplete(true)
  end
  