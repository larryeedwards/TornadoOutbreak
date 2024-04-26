function on_growmissiontimeout()
	beginwait()
		uimgr.playoutoftime();
	endwait()
  
	cameramgr.screenfade(0, 0.7, 0.25, 1.0)
	pause(0.8)
  
end
                                         
function on_gameplaymoduleactive()
  gomgr.getbyoid(281):addtoworld()
  gomgr.getbyoid(281):dispatchlabel("idle")
  gomgr.getbyoid(272):childbyoid(273):childbyoid(277):dispatchlabel("opened")
end
  
function targetcameraon(target)
  cameramgr.matchcameras(8, 1)
  cameramgr.playertargettarget = target
  cameramgr.playertargetsvazimlimit = 24 --    
  cameramgr.playertargetsvelevlimit = 24 --    
  cameramgr.playertargetsvoffsetlimit = 4000 --       
  cameramgr.playertargetsvfocuslimit = 4000 --       
  cameramgr.playertargetzoomlevel = 3000
  cameramgr.playertargetfocusdistance = 0
  cameramgr.calcidealfrom(0.3925, 800.0) --                       
  cameramgr.activatecamerakind(5)
end

function targetcameraoff()
  cameramgr.matchcameras(1, 8)
  cameramgr.playertargetresetsvazimlimit()
  cameramgr.playertargetresetsvelevlimit()
  cameramgr.playertargetresetsvoffsetlimit()
  cameramgr.playertargetresetsvfocuslimit()
  cameramgr.activatecamerakind(1)
end

playinghint = false
function playhint(text, time)
	if (playinghint) then
		return
	end
	
	playinghint = true
	engine.pushmode(1)
	
	--                                   
	
	--                      
	beginwait()
		gomgr.getbyoid(479):flyin()
	endwait()
	
	--           
	beginwait()
		uimgr.playtutorialtalk(text, time)
	endwait()
	
	--                       
	beginwait()
		gomgr.getbyoid(479):flyout()
	endwait()
	
	--                                        
	
	engine.popmode(1)
	playinghint = false
end

spriteshown = false
spritecollected = false
splitopened = false

function on_gameplaymoduleupdate()
	

end

function on_gameplaymodulecomplete(succeeded)
  if succeeded then
    cameramgr.screenfade(0, 0.0, 0.1, 0.5)
    gomgr.getbyoid(281):removefromworld()
  end
end