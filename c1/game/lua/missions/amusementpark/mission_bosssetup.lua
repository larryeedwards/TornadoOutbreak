function on_postload()
  racemgr = gomgr.getbyoid(3821)
  
  racemgr:addtrigger(gomgr.getbyoid(324))
  racemgr:addtrigger(gomgr.getbyoid(345))
  racemgr:addtrigger(gomgr.getbyoid(346))
  racemgr:addtrigger(gomgr.getbyoid(347))
  racemgr:addtrigger(gomgr.getbyoid(348))
  racemgr:addtrigger(gomgr.getbyoid(349))
  racemgr:addtrigger(gomgr.getbyoid(350))
  racemgr:addtrigger(gomgr.getbyoid(351))
  racemgr:addtrigger(gomgr.getbyoid(352))
  racemgr:addtrigger(gomgr.getbyoid(353))
  racemgr:addtrigger(gomgr.getbyoid(354))
  racemgr:addtrigger(gomgr.getbyoid(355))
  racemgr:addtrigger(gomgr.getbyoid(356))
  racemgr:addtrigger(gomgr.getbyoid(357))
  racemgr:addtrigger(gomgr.getbyoid(358))
  racemgr:addtrigger(gomgr.getbyoid(359))
  racemgr:addtrigger(gomgr.getbyoid(360))
  racemgr:addtrigger(gomgr.getbyoid(361))
  racemgr:addtrigger(gomgr.getbyoid(362))
  racemgr:addtrigger(gomgr.getbyoid(363))
  racemgr:addtrigger(gomgr.getbyoid(364))
  racemgr:addtrigger(gomgr.getbyoid(365))
  racemgr:addtrigger(gomgr.getbyoid(366))
  racemgr:addtrigger(gomgr.getbyoid(367))
  racemgr:addtrigger(gomgr.getbyoid(368))
  racemgr:addtrigger(gomgr.getbyoid(369))
  racemgr:addtrigger(gomgr.getbyoid(370))
  racemgr:addtrigger(gomgr.getbyoid(371))
  racemgr:addtrigger(gomgr.getbyoid(372))
  racemgr:addtrigger(gomgr.getbyoid(373))
  racemgr:addtrigger(gomgr.getbyoid(374))
  racemgr:addtrigger(gomgr.getbyoid(375))
  racemgr:addtrigger(gomgr.getbyoid(376))
end

function add_glows()
  gomgr.getbyoid(377):addtoworld()
  gomgr.getbyoid(378):addtoworld()
  gomgr.getbyoid(379):addtoworld()
  gomgr.getbyoid(380):addtoworld()
  gomgr.getbyoid(381):addtoworld()
  gomgr.getbyoid(382):addtoworld()
  gomgr.getbyoid(383):addtoworld()
  gomgr.getbyoid(384):addtoworld()
  gomgr.getbyoid(385):addtoworld()
  gomgr.getbyoid(386):addtoworld()
  gomgr.getbyoid(387):addtoworld()
  gomgr.getbyoid(388):addtoworld()
  gomgr.getbyoid(389):addtoworld()
  gomgr.getbyoid(390):addtoworld()
  gomgr.getbyoid(391):addtoworld()
  gomgr.getbyoid(392):addtoworld()
  gomgr.getbyoid(393):addtoworld()
  gomgr.getbyoid(394):addtoworld()
  gomgr.getbyoid(395):addtoworld()
  gomgr.getbyoid(396):addtoworld()
  gomgr.getbyoid(397):addtoworld()
  gomgr.getbyoid(398):addtoworld()
  gomgr.getbyoid(399):addtoworld()
  gomgr.getbyoid(400):addtoworld()
  gomgr.getbyoid(401):addtoworld()
  gomgr.getbyoid(402):addtoworld()
  gomgr.getbyoid(403):addtoworld()
  gomgr.getbyoid(404):addtoworld()
  gomgr.getbyoid(405):addtoworld()
  gomgr.getbyoid(406):addtoworld()
  gomgr.getbyoid(407):addtoworld()
  gomgr.getbyoid(408):addtoworld()
  gomgr.getbyoid(409):addtoworld()
end

function on_gameplaymoduleactive()
  tornadomgr.showtargetfujitainfo = false
  gomgr.getbyoid(16):setfujitarating(2.0)
  tornadomgr.setfujitamax(2.0)
  
  --                 
  engine.pushmode(1)
  if (playermgr.isinmultiplayer and not tagamestats.hasshownmpracetutorial) then
    local mptext = { 1783, 1784 }
    for i=1, #mptext do
      gomgr.getbyoid(3800).location = 0
      gomgr.getbyoid(3800).buttonon = true
      if (i==1) then
        gomgr.getbyoid(3800).portrait = 2
      else
        gomgr.getbyoid(3800).portrait = 3
      end
      gomgr.getbyoid(3800):settext(" textbox ", mptext[i])
      beginwait()
        gomgr.getbyoid(3800):start()
      endwait()
    end
    tagamestats.hasshownmpracetutorial = true
  end
  engine.popmode(1)

  beginwait()
    uimgr.playhint(1560)
  endwait()

  cameramgr.activatecamera(0, 1, 0)
  
  gomgr.getbyoid(3821):startrace()
  
  math.randomseed(time.t)
  local rand = math.random(1, 2)
  if rand == 1 then
    tornadomgr.toggletpotdriver()
  end
  
  add_glows()
  
  --                                  
  gomgr.getbyoid(410):addtoworld()
  gomgr.getbyoid(411):addtoworld()
  gomgr.getbyoid(412):addtoworld()

  --      
  audio.postevent("LOOP_BOSS_SETUP_STORM_BUILDING_STAGE1")
  audio.postevent("AMU_WIND_RACE")
  pause(0.1)
  audio.setstate("EXCITEMENT_LEVEL", "world1_tornado1")
end