function on_postload()
  racemgr = gomgr.getbyoid(3590)
  
  racemgr:addtrigger(gomgr.getbyoid(3174))
  racemgr:addtrigger(gomgr.getbyoid(3175))
  racemgr:addtrigger(gomgr.getbyoid(3176))
  racemgr:addtrigger(gomgr.getbyoid(3177))
  racemgr:addtrigger(gomgr.getbyoid(3178))
  racemgr:addtrigger(gomgr.getbyoid(3179))
  racemgr:addtrigger(gomgr.getbyoid(3180))
  racemgr:addtrigger(gomgr.getbyoid(3181))
  racemgr:addtrigger(gomgr.getbyoid(3182))
  racemgr:addtrigger(gomgr.getbyoid(3183))
  racemgr:addtrigger(gomgr.getbyoid(3184))
  racemgr:addtrigger(gomgr.getbyoid(3185))
  racemgr:addtrigger(gomgr.getbyoid(3186))
  racemgr:addtrigger(gomgr.getbyoid(3187))
  racemgr:addtrigger(gomgr.getbyoid(3188))
  racemgr:addtrigger(gomgr.getbyoid(3189))
  racemgr:addtrigger(gomgr.getbyoid(3190))
  racemgr:addtrigger(gomgr.getbyoid(3191))
  racemgr:addtrigger(gomgr.getbyoid(3192))
  racemgr:addtrigger(gomgr.getbyoid(3193))
  racemgr:addtrigger(gomgr.getbyoid(3144))
  racemgr:addtrigger(gomgr.getbyoid(3165))
  racemgr:addtrigger(gomgr.getbyoid(3166))
  racemgr:addtrigger(gomgr.getbyoid(3167))
  racemgr:addtrigger(gomgr.getbyoid(3168))
  racemgr:addtrigger(gomgr.getbyoid(3169))
  racemgr:addtrigger(gomgr.getbyoid(3170))
  racemgr:addtrigger(gomgr.getbyoid(3171))
  racemgr:addtrigger(gomgr.getbyoid(3172))
  racemgr:addtrigger(gomgr.getbyoid(3173))
end

function add_glows()
  gomgr.getbyoid(3194):addtoworld()
  gomgr.getbyoid(3195):addtoworld()
  gomgr.getbyoid(3196):addtoworld()
  gomgr.getbyoid(3197):addtoworld()
  gomgr.getbyoid(3198):addtoworld()
  gomgr.getbyoid(3199):addtoworld()
  gomgr.getbyoid(3200):addtoworld()
  gomgr.getbyoid(3201):addtoworld()
  gomgr.getbyoid(3202):addtoworld()
  gomgr.getbyoid(3203):addtoworld()
  gomgr.getbyoid(3204):addtoworld()
  gomgr.getbyoid(3205):addtoworld()
  gomgr.getbyoid(3206):addtoworld()
  gomgr.getbyoid(3207):addtoworld()
  gomgr.getbyoid(3208):addtoworld()
  gomgr.getbyoid(3209):addtoworld()
  gomgr.getbyoid(3210):addtoworld()
  gomgr.getbyoid(3211):addtoworld()
  gomgr.getbyoid(3212):addtoworld()
  gomgr.getbyoid(3213):addtoworld()
  gomgr.getbyoid(3214):addtoworld()
  gomgr.getbyoid(3215):addtoworld()
  gomgr.getbyoid(3216):addtoworld()
  gomgr.getbyoid(3217):addtoworld()
  gomgr.getbyoid(3218):addtoworld()
  gomgr.getbyoid(3219):addtoworld()
  gomgr.getbyoid(3220):addtoworld()
  gomgr.getbyoid(3221):addtoworld()
  gomgr.getbyoid(3222):addtoworld()
  gomgr.getbyoid(3223):addtoworld()
end

function on_gameplaymoduleactive()

  while (tornadomgr.firstactivetornado == nil) do
	  pause(0.1)
	end

  --                                              
  gomgr.getbyoid(3083):dispatchlabel("weatherphase1")
  gomgr.getbyoid(3081):dispatchlabel("weatherphase0")
  
  --               
  tornadomgr.stormchambertimer:finish()
  tornadomgr.showtargetfujitainfo = false
  gomgr.getbyoid(16):setfujitarating(2.0)
  tornadomgr.setfujitamax(2.0)
  
  local introText = {
    1492,
    1493,
    1494,
  }
  
  --               
  gomgr.getbyoid(3405):dispatchlabel("reset")
  gomgr.getbyoid(16):warp(gomgr.getbyoid(3068))
	
	--                
  gomgr.getbyoid(3071):freeze()
  engine.pushmode(1)
  
  --           
  for i = 1, #introText do
  
    if i == 2 then
      --                   
      pause(0.5)
      gomgr.getbyoid(3174):childbyoid(3147):reset()
      gomgr.getbyoid(3174):childbyoid(3147):start()
      pause(1)
    elseif i == 3 then
      pause(0.5)
      gomgr.getbyoid(3174):childbyoid(3147):hardstop()
      gomgr.getbyoid(3174):childbyoid(3164):reset()
      gomgr.getbyoid(3174):childbyoid(3164):start()
      gomgr.getbyoid(3174):childbyoid(3164).particlesizepercentadjustment = 3.0
      gomgr.getbyoid(3174):childbyoid(3148):removefromworld()
      audio.postevent("PLAY_SPRITERACE_GATETRIGGERED_EXPLODE")
      pause(2)
      gomgr.getbyoid(3174):lowergate(10000, 0.5)
      gomgr.getbyoid(3174):childbyoid(3148):addtoworld()
    end
    
    gomgr.getbyoid(3572).location = 1
    gomgr.getbyoid(3572).buttonon = true
    gomgr.getbyoid(3572):settext(" textbox ", introText[i])
    gomgr.getbyoid(3572).finishonbuttonpress = true --               
    beginwait()
      gomgr.getbyoid(3572):start()
    endwait()
  end
  
  gomgr.getbyoid(3174):childbyoid(3148):addtoworld()
  
  --                 
  if (playermgr.isinmultiplayer and not tagamestats.hasshownmpracetutorial) then
    local mptext = { 1783, 1784 }
    for i=1, #mptext do
      gomgr.getbyoid(3572).location = 0
      gomgr.getbyoid(3572).buttonon = true
      if (i==1) then
        gomgr.getbyoid(3572).portrait = 2
      else
        gomgr.getbyoid(3572).portrait = 3
      end
      gomgr.getbyoid(3572):settext(" textbox ", mptext[i])
      beginwait()
        gomgr.getbyoid(3572):start()
      endwait()
    end
    tagamestats.hasshownmpracetutorial = true
  end
    
  --         
  gomgr.getbyoid(3071):unfreeze()
  engine.popmode(1)
  
  gomgr.getbyoid(3405):removefromworld()
  gomgr.getbyoid(3055):removefromworld()
  gomgr.getbyoid(3063):removefromworld()
  gomgr.getbyoid(3067):removefromworld()

  gomgr.getbyoid(3590):startrace()
  
  math.randomseed(time.t)
  local rand = math.random(1, 2)
  if rand == 1 then
    tornadomgr.toggletpotdriver()
  end

  add_glows()
  
  --                                  
  gomgr.getbyoid(3227):addtoworld()
  gomgr.getbyoid(3228):addtoworld()
  gomgr.getbyoid(3229):addtoworld()

  --      
  audio.postevent("LOOP_BOSS_SETUP_STORM_BUILDING_STAGE1")
  audio.postevent("A51_WIND_RACE")
  pause(0.1)
  audio.setstate("EXCITEMENT_LEVEL", "world1_tornado1")
end