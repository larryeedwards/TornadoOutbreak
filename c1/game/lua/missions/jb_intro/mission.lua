produce_complete = false
cannon_complete = false
ball_complete = false
paul_ox_complete = false

introText = {
  1220,
  1221,
  1222,
  1477,
}

function on_gameplaymoduleactive()
  gomgr.getbyoid(16).audiostageoverride = 4
  gomgr.getbyoid(16).canavatarspindown = false

  --                               
  gomgr.getbyoid(16):setfujitarating(1.334)
  tornadomgr.setfujitamax(2.00)
  gomgr.getbyoid(16).svlimitmultiplier = 1.07
  gomgr.getbyoid(219):dispatchlabel("weatherphase1")
  
  --          
  gomgr.getbyoid(656):addtoworld()
  gomgr.getbyoid(656):dispatchlabel("idle")
  
  --                 
  gomgr.getbyoid(473):addtoworld()
  gomgr.getbyoid(474):addtoworld()
  gomgr.getbyoid(475):addtoworld()
  gomgr.getbyoid(476):addtoworld()
  gomgr.getbyoid(477):addtoworld()
  gomgr.getbyoid(478):addtoworld()
  gomgr.getbyoid(479):addtoworld()
  gomgr.getbyoid(480):addtoworld()
  gomgr.getbyoid(481):addtoworld()
  gomgr.getbyoid(482):addtoworld()
  gomgr.getbyoid(483):addtoworld()
  gomgr.getbyoid(484):addtoworld()
  gomgr.getbyoid(485):addtoworld()
  gomgr.getbyoid(486):addtoworld()
  gomgr.getbyoid(487):addtoworld()
  gomgr.getbyoid(488):addtoworld()
  gomgr.getbyoid(489):addtoworld()
  gomgr.getbyoid(490):addtoworld()
  gomgr.getbyoid(606):addtoworld()
  gomgr.getbyoid(607):addtoworld()
  gomgr.getbyoid(608):addtoworld()
  gomgr.getbyoid(609):addtoworld()
  gomgr.getbyoid(610):addtoworld()
  gomgr.getbyoid(611):addtoworld()
  gomgr.getbyoid(612):addtoworld()
  gomgr.getbyoid(613):addtoworld()
  gomgr.getbyoid(614):addtoworld()
  gomgr.getbyoid(615):addtoworld()
  gomgr.getbyoid(616):addtoworld()
  gomgr.getbyoid(617):addtoworld()
  gomgr.getbyoid(618):addtoworld()
  gomgr.getbyoid(619):addtoworld()
  gomgr.getbyoid(620):addtoworld()
  gomgr.getbyoid(621):addtoworld()
  gomgr.getbyoid(622):addtoworld()
  gomgr.getbyoid(623):addtoworld()
  
  --                
  gomgr.getbyoid(456):freeze()
  engine.pushmode(1)
  
  --           
  gomgr.getbyoid(3776).location = 1
  gomgr.getbyoid(3776).buttonon = true
  for i = 1, #introText do
    gomgr.getbyoid(3776):settext(" textbox ", introText[i])
    gomgr.getbyoid(3776).finishonbuttonpress = (i == #introText)
    beginwait()
      gomgr.getbyoid(3776):start()
    endwait()
  end
    
  --         
  gomgr.getbyoid(456):unfreeze()
  engine.popmode(1)
  
  --                             
  gomgr.getbyoid(656).path = gomgr.getbyoid(467)
  gomgr.getbyoid(656):dispatchlabel("trainer_fly")
  
  audio.postevent('PLAY_GAME_BEGIN')
end

function produce_destroyed()
  return (not gomgr.getbyoid(657).canbreaknext)  
end

function cannon_destroyed()
  return (not gomgr.getbyoid(684).canbreaknext)  
end

function ball_destroyed()
  return (not gomgr.getbyoid(665).canbreaknext)  
end

function paul_ox_destroyed()
  return (not gomgr.getbyoid(675).canbreaknext and 
          not gomgr.getbyoid(680).canbreaknext)  
end

function on_gameplaymoduleupdate()

  if (not produce_complete and produce_destroyed()) then
    logline("produce_destroyed")
    produce_complete = true
    
    gomgr.getbyoid(219):dispatchlabel("weatherphase2")
    
    engine.pushmode(1)
    beginwait()
      cinematic.play("cine_pumpkin_to_cannon")
    endwait()
    pause(1.2)
    cameramgr.activatecamerakind(1)
    engine.popmode(1)
    audio.postflyovervoevent("Play_jb_intro_intro8")
    
    --                             
    gomgr.getbyoid(473).path = gomgr.getbyoid(238)
    gomgr.getbyoid(474).path = gomgr.getbyoid(239)
    gomgr.getbyoid(475).path = gomgr.getbyoid(240)
    gomgr.getbyoid(476).path = gomgr.getbyoid(241)
    gomgr.getbyoid(477).path = gomgr.getbyoid(242)
    gomgr.getbyoid(478).path = gomgr.getbyoid(243)
    gomgr.getbyoid(479).path = gomgr.getbyoid(244)
    gomgr.getbyoid(480).path = gomgr.getbyoid(245)
    gomgr.getbyoid(481).path = gomgr.getbyoid(246)
    gomgr.getbyoid(482).path = gomgr.getbyoid(247)
    gomgr.getbyoid(483).path = gomgr.getbyoid(248)
    gomgr.getbyoid(484).path = gomgr.getbyoid(249)
    gomgr.getbyoid(485).path = gomgr.getbyoid(250)
    gomgr.getbyoid(486).path = gomgr.getbyoid(251)
    gomgr.getbyoid(487).path = gomgr.getbyoid(252)
    gomgr.getbyoid(488).path = gomgr.getbyoid(253)
    gomgr.getbyoid(489).path = gomgr.getbyoid(254)
    gomgr.getbyoid(490).path = gomgr.getbyoid(255)
    gomgr.getbyoid(606).path = gomgr.getbyoid(256)
    gomgr.getbyoid(607).path = gomgr.getbyoid(257)
    gomgr.getbyoid(608).path = gomgr.getbyoid(258)
    gomgr.getbyoid(609).path = gomgr.getbyoid(259)
    gomgr.getbyoid(610).path = gomgr.getbyoid(260)
    gomgr.getbyoid(611).path = gomgr.getbyoid(261)
    gomgr.getbyoid(612).path = gomgr.getbyoid(262)
    gomgr.getbyoid(613).path = gomgr.getbyoid(263)
    gomgr.getbyoid(614).path = gomgr.getbyoid(264)
    gomgr.getbyoid(615).path = gomgr.getbyoid(265)
    gomgr.getbyoid(616).path = gomgr.getbyoid(266)
    gomgr.getbyoid(617).path = gomgr.getbyoid(267)
    gomgr.getbyoid(618).path = gomgr.getbyoid(268)
    gomgr.getbyoid(619).path = gomgr.getbyoid(269)
    gomgr.getbyoid(620).path = gomgr.getbyoid(270)
    gomgr.getbyoid(621).path = gomgr.getbyoid(271)
    gomgr.getbyoid(622).path = gomgr.getbyoid(272)
    gomgr.getbyoid(623).path = gomgr.getbyoid(273)

    
    gomgr.getbyoid(433):addtoworld()
    gomgr.getbyoid(447):addtoworld()
    gomgr.getbyoid(450):addtoworld()
    gomgr.getbyoid(16).audiostageoverride = 5
    pause(1.0)
    gomgr.getbyoid(447):removefromworld()
    
    
    --                             
    gomgr.getbyoid(656).path = gomgr.getbyoid(462)
    gomgr.getbyoid(656):dispatchlabel("trainer_fly")
    tornadomgr.setfujitamax(2.667)
 --                                          
  end
  
  if (not cannon_complete and cannon_destroyed()) then
    logline("cannon_destroyed")
    cannon_complete = true
    
    gomgr.getbyoid(219):dispatchlabel("weatherphase3")
    
    engine.pushmode(1)
    audio.postflyovervoevent("Play_jb_intro_intro10")
    beginwait()
      cinematic.play("cine_cannon_to_ball")
    endwait()
    pause(1.2)
    cameramgr.activatecamerakind(1)
    engine.popmode(1)
    audio.postflyovervoevent("Play_jb_intro_intro11")
    
    --                             
    gomgr.getbyoid(473).path = gomgr.getbyoid(274)
    gomgr.getbyoid(474).path = gomgr.getbyoid(275)
    gomgr.getbyoid(475).path = gomgr.getbyoid(276)
    gomgr.getbyoid(476).path = gomgr.getbyoid(277)
    gomgr.getbyoid(477).path = gomgr.getbyoid(278)
    gomgr.getbyoid(478).path = gomgr.getbyoid(279)
    gomgr.getbyoid(479).path = gomgr.getbyoid(280)
    gomgr.getbyoid(480).path = gomgr.getbyoid(281)
    gomgr.getbyoid(481).path = gomgr.getbyoid(282)
    gomgr.getbyoid(482).path = gomgr.getbyoid(283)
    gomgr.getbyoid(483).path = gomgr.getbyoid(284)
    gomgr.getbyoid(484).path = gomgr.getbyoid(285)
    gomgr.getbyoid(485).path = gomgr.getbyoid(286)
    gomgr.getbyoid(486).path = gomgr.getbyoid(287)
    gomgr.getbyoid(487).path = gomgr.getbyoid(288)
    gomgr.getbyoid(488).path = gomgr.getbyoid(289)
    gomgr.getbyoid(489).path = gomgr.getbyoid(290)
    gomgr.getbyoid(490).path = gomgr.getbyoid(291)
    gomgr.getbyoid(606).path = gomgr.getbyoid(292)
    gomgr.getbyoid(607).path = gomgr.getbyoid(293)
    gomgr.getbyoid(608).path = gomgr.getbyoid(294)
    gomgr.getbyoid(609).path = gomgr.getbyoid(295)
    gomgr.getbyoid(610).path = gomgr.getbyoid(296)
    gomgr.getbyoid(611).path = gomgr.getbyoid(297)
    gomgr.getbyoid(612).path = gomgr.getbyoid(298)
    gomgr.getbyoid(613).path = gomgr.getbyoid(299)
    gomgr.getbyoid(614).path = gomgr.getbyoid(300)
    gomgr.getbyoid(615).path = gomgr.getbyoid(301)
    gomgr.getbyoid(616).path = gomgr.getbyoid(302)
    gomgr.getbyoid(617).path = gomgr.getbyoid(303)
    gomgr.getbyoid(618).path = gomgr.getbyoid(304)
    gomgr.getbyoid(619).path = gomgr.getbyoid(305)
    gomgr.getbyoid(620).path = gomgr.getbyoid(306)
    gomgr.getbyoid(621).path = gomgr.getbyoid(307)
    gomgr.getbyoid(622).path = gomgr.getbyoid(308)
    gomgr.getbyoid(623).path = gomgr.getbyoid(309)
    
    gomgr.getbyoid(434):addtoworld()
    gomgr.getbyoid(448):addtoworld()
    gomgr.getbyoid(452):addtoworld()
    gomgr.getbyoid(16).audiostageoverride = 6
    pause(1.0)
    gomgr.getbyoid(448):removefromworld()
    
    --                             
    gomgr.getbyoid(656).path = gomgr.getbyoid(463)
    gomgr.getbyoid(656):dispatchlabel("trainer_fly")
    tornadomgr.setfujitamax(3.4)
 --                                          
  end
  
  if (not ball_complete and ball_destroyed()) then
    logline("ball_destroyed")
    ball_complete = true
    
    gomgr.getbyoid(219):dispatchlabel("weatherphase4")
    
    engine.pushmode(1)
    audio.postflyovervoevent("Play_jb_intro_intro12")
    beginwait()
      cinematic.play("cine_ball_to_bull")
    endwait()
    pause(1.2)
    cameramgr.activatecamerakind(1)
    engine.popmode(1)
    audio.postflyovervoevent("Play_jb_intro_intro13")
    
    --                             
    gomgr.getbyoid(473).path = gomgr.getbyoid(310)
    gomgr.getbyoid(474).path = gomgr.getbyoid(311)
    gomgr.getbyoid(475).path = gomgr.getbyoid(312)
    gomgr.getbyoid(476).path = gomgr.getbyoid(313)
    gomgr.getbyoid(477).path = gomgr.getbyoid(314)
    gomgr.getbyoid(478).path = gomgr.getbyoid(315)
    gomgr.getbyoid(479).path = gomgr.getbyoid(316)
    gomgr.getbyoid(480).path = gomgr.getbyoid(317)
    gomgr.getbyoid(481).path = gomgr.getbyoid(318)
    gomgr.getbyoid(482).path = gomgr.getbyoid(319)
    gomgr.getbyoid(483).path = gomgr.getbyoid(320)
    gomgr.getbyoid(484).path = gomgr.getbyoid(321)
    gomgr.getbyoid(485).path = gomgr.getbyoid(322)
    gomgr.getbyoid(486).path = gomgr.getbyoid(323)
    gomgr.getbyoid(487).path = gomgr.getbyoid(324)
    gomgr.getbyoid(488).path = gomgr.getbyoid(325)
    gomgr.getbyoid(489).path = gomgr.getbyoid(326)
    gomgr.getbyoid(490).path = gomgr.getbyoid(327)
    gomgr.getbyoid(606).path = gomgr.getbyoid(328)
    gomgr.getbyoid(607).path = gomgr.getbyoid(329)
    gomgr.getbyoid(608).path = gomgr.getbyoid(330)
    gomgr.getbyoid(609).path = gomgr.getbyoid(331)
    gomgr.getbyoid(610).path = gomgr.getbyoid(332)
    gomgr.getbyoid(611).path = gomgr.getbyoid(333)
    gomgr.getbyoid(612).path = gomgr.getbyoid(334)
    gomgr.getbyoid(613).path = gomgr.getbyoid(335)
    gomgr.getbyoid(614).path = gomgr.getbyoid(336)
    gomgr.getbyoid(615).path = gomgr.getbyoid(337)
    gomgr.getbyoid(616).path = gomgr.getbyoid(338)
    gomgr.getbyoid(617).path = gomgr.getbyoid(339)
    gomgr.getbyoid(618).path = gomgr.getbyoid(340)
    gomgr.getbyoid(619).path = gomgr.getbyoid(341)
    gomgr.getbyoid(620).path = gomgr.getbyoid(342)
    gomgr.getbyoid(621).path = gomgr.getbyoid(343)
    gomgr.getbyoid(622).path = gomgr.getbyoid(344)
    gomgr.getbyoid(623).path = gomgr.getbyoid(345)
    
    gomgr.getbyoid(435):addtoworld()
    gomgr.getbyoid(436):addtoworld()
    gomgr.getbyoid(437):addtoworld()
    gomgr.getbyoid(449):addtoworld()
    gomgr.getbyoid(454):addtoworld()
    gomgr.getbyoid(16).audiostageoverride = 7
    pause(1.0)
    gomgr.getbyoid(449):removefromworld()
    
    --                             
    gomgr.getbyoid(656).path = gomgr.getbyoid(464)
    gomgr.getbyoid(656):dispatchlabel("trainer_fly")
    tornadomgr.setfujitamax(3.6)
    gomgr.getbyoid(16):setfujitarating(3.2)
  end
  
  if (not paul_ox_complete and paul_ox_destroyed()) then
    logline("paul_ox_destroyed")
    paul_ox_complete = true
    gomgr.getbyoid(438):addtoworld()
    pause(1.5)
    
    --                             
    gomgr.getbyoid(656).path = gomgr.getbyoid(465)
    gomgr.getbyoid(656):dispatchlabel("trainer_fly")
    pause(4.0)
    gomgr.getbyoid(655):addtoworld()
    gomgr.getbyoid(655):dispatchlabel("setup")
    gomgr.getbyoid(425):addtoworld()
  end
  
end

function on_label(label)
  if (label == "dinoTriggered") then
    logline("dinoTriggered")
    gomgr.getbyoid(16).canavatarspindown = true
    requestcomplete(true)
  end
end
