wssunspotsA = {}
sunspotsA = {}
sunspritesA = {}
wssunspotsB = {}
sunspotsB = {}
sunspritesB = {}
wssunspotsC = {}
sunspotsC = {}
sunspritesC = {}

function on_postload()

  wssunspotsA[1] = gomgr.getbyoid(209)
  wssunspotsA[2] = gomgr.getbyoid(210)
  wssunspotsA[3] = gomgr.getbyoid(211)
  wssunspotsA[4] = gomgr.getbyoid(212)
  wssunspotsA[5] = gomgr.getbyoid(213)
  wssunspotsA[6] = gomgr.getbyoid(214)
  wssunspotsA[7] = gomgr.getbyoid(215)
  wssunspotsA[8] = gomgr.getbyoid(216)
  wssunspotsA[9] = gomgr.getbyoid(217)
  wssunspotsA[10] = gomgr.getbyoid(218)
  wssunspotsA[11] = gomgr.getbyoid(219)
  wssunspotsA[12] = gomgr.getbyoid(220)

  sunspotsA[1] = gomgr.getbyoid(338)
  sunspotsA[2] = gomgr.getbyoid(340)
  sunspotsA[3] = gomgr.getbyoid(341)
  sunspotsA[4] = gomgr.getbyoid(342)
  sunspotsA[5] = gomgr.getbyoid(343)
  sunspotsA[6] = gomgr.getbyoid(344)
  sunspotsA[7] = gomgr.getbyoid(345)
  sunspotsA[8] = gomgr.getbyoid(346)
  sunspotsA[9] = gomgr.getbyoid(347)
  sunspotsA[10] = gomgr.getbyoid(348)
  sunspotsA[11] = gomgr.getbyoid(349)
  sunspotsA[12] = gomgr.getbyoid(350)

  sunspritesA[1] = gomgr.getbyoid(326)
  sunspritesA[2] = gomgr.getbyoid(327)
  sunspritesA[3] = gomgr.getbyoid(328)
  sunspritesA[4] = gomgr.getbyoid(329)
  sunspritesA[5] = gomgr.getbyoid(374)
  sunspritesA[6] = gomgr.getbyoid(331)
  sunspritesA[7] = gomgr.getbyoid(332)
  sunspritesA[8] = gomgr.getbyoid(333)
  sunspritesA[9] = gomgr.getbyoid(334)
  sunspritesA[10] = gomgr.getbyoid(335)
  sunspritesA[11] = gomgr.getbyoid(336)
  sunspritesA[12] = gomgr.getbyoid(337)

  wssunspotsB[1] = gomgr.getbyoid(221)
  wssunspotsB[2] = gomgr.getbyoid(222)
  wssunspotsB[3] = gomgr.getbyoid(223)
  wssunspotsB[4] = gomgr.getbyoid(224)
  wssunspotsB[5] = gomgr.getbyoid(225)
  wssunspotsB[6] = gomgr.getbyoid(226)
  wssunspotsB[7] = gomgr.getbyoid(227)
  wssunspotsB[8] = gomgr.getbyoid(228)
  wssunspotsB[9] = gomgr.getbyoid(229)
  wssunspotsB[10] = gomgr.getbyoid(230)
  wssunspotsB[11] = gomgr.getbyoid(231)
  wssunspotsB[12] = gomgr.getbyoid(232)
  wssunspotsB[13] = gomgr.getbyoid(233)
  wssunspotsB[14] = gomgr.getbyoid(234)
  wssunspotsB[15] = gomgr.getbyoid(235)
  wssunspotsB[16] = gomgr.getbyoid(236)
  wssunspotsB[17] = gomgr.getbyoid(237)

  sunspotsB[1] = gomgr.getbyoid(351)
  sunspotsB[2] = gomgr.getbyoid(352)
  sunspotsB[3] = gomgr.getbyoid(353)
  sunspotsB[4] = gomgr.getbyoid(354)
  sunspotsB[5] = gomgr.getbyoid(355)
  sunspotsB[6] = gomgr.getbyoid(356)
  sunspotsB[7] = gomgr.getbyoid(357)
  sunspotsB[8] = gomgr.getbyoid(358)
  sunspotsB[9] = gomgr.getbyoid(359)
  sunspotsB[10] = gomgr.getbyoid(360)
  sunspotsB[11] = gomgr.getbyoid(361)
  sunspotsB[12] = gomgr.getbyoid(362)
  sunspotsB[13] = gomgr.getbyoid(363)
  sunspotsB[14] = gomgr.getbyoid(364)
  sunspotsB[15] = gomgr.getbyoid(365)
  sunspotsB[16] = gomgr.getbyoid(366)
  sunspotsB[17] = gomgr.getbyoid(367)

  sunspritesB[1] = gomgr.getbyoid(368)
  sunspritesB[2] = gomgr.getbyoid(369)
  sunspritesB[3] = gomgr.getbyoid(370)
  sunspritesB[4] = gomgr.getbyoid(371)
  sunspritesB[5] = gomgr.getbyoid(372)
  sunspritesB[6] = gomgr.getbyoid(373)
  sunspritesB[7] = gomgr.getbyoid(374)
  sunspritesB[8] = gomgr.getbyoid(375)
  sunspritesB[9] = gomgr.getbyoid(376)
  sunspritesB[10] = gomgr.getbyoid(377)
  sunspritesB[11] = gomgr.getbyoid(378)
  sunspritesB[12] = gomgr.getbyoid(379)
  sunspritesB[13] = gomgr.getbyoid(380)
  sunspritesB[14] = gomgr.getbyoid(381)
  sunspritesB[15] = gomgr.getbyoid(382)
  sunspritesB[16] = gomgr.getbyoid(383)
  sunspritesB[17] = gomgr.getbyoid(384)

  wssunspotsC[1] = gomgr.getbyoid(238)
  wssunspotsC[2] = gomgr.getbyoid(239)
  wssunspotsC[3] = gomgr.getbyoid(240)
  wssunspotsC[4] = gomgr.getbyoid(241)
  wssunspotsC[5] = gomgr.getbyoid(242)
  wssunspotsC[6] = gomgr.getbyoid(243)
  wssunspotsC[7] = gomgr.getbyoid(244)
  wssunspotsC[8] = gomgr.getbyoid(245)
  wssunspotsC[9] = gomgr.getbyoid(246)
  wssunspotsC[10] = gomgr.getbyoid(247)
  wssunspotsC[11] = gomgr.getbyoid(248)
  wssunspotsC[12] = gomgr.getbyoid(249)
  wssunspotsC[13] = gomgr.getbyoid(250)
  wssunspotsC[14] = gomgr.getbyoid(251)
  wssunspotsC[15] = gomgr.getbyoid(252)
  wssunspotsC[16] = gomgr.getbyoid(253)
  wssunspotsC[17] = gomgr.getbyoid(254)
  wssunspotsC[18] = gomgr.getbyoid(255)
  wssunspotsC[19] = gomgr.getbyoid(256)
  wssunspotsC[20] = gomgr.getbyoid(257)
  wssunspotsC[21] = gomgr.getbyoid(258)
  wssunspotsC[22] = gomgr.getbyoid(259)
  wssunspotsC[23] = gomgr.getbyoid(260)

  sunspotsC[1] = gomgr.getbyoid(385)
  sunspotsC[2] = gomgr.getbyoid(386)
  sunspotsC[3] = gomgr.getbyoid(387)
  sunspotsC[4] = gomgr.getbyoid(388)
  sunspotsC[5] = gomgr.getbyoid(389)
  sunspotsC[6] = gomgr.getbyoid(390)
  sunspotsC[7] = gomgr.getbyoid(391)
  sunspotsC[8] = gomgr.getbyoid(392)
  sunspotsC[9] = gomgr.getbyoid(393)
  sunspotsC[10] = gomgr.getbyoid(394)
  sunspotsC[11] = gomgr.getbyoid(395)
  sunspotsC[12] = gomgr.getbyoid(396)
  sunspotsC[13] = gomgr.getbyoid(397)
  sunspotsC[14] = gomgr.getbyoid(398)
  sunspotsC[15] = gomgr.getbyoid(399)
  sunspotsC[16] = gomgr.getbyoid(400)
  sunspotsC[17] = gomgr.getbyoid(401)
  sunspotsC[18] = gomgr.getbyoid(402)
  sunspotsC[19] = gomgr.getbyoid(403)
  sunspotsC[20] = gomgr.getbyoid(404)
  sunspotsC[21] = gomgr.getbyoid(405)
  sunspotsC[22] = gomgr.getbyoid(406)
  sunspotsC[23] = gomgr.getbyoid(407)

  sunspritesC[1] = gomgr.getbyoid(408)
  sunspritesC[2] = gomgr.getbyoid(409)
  sunspritesC[3] = gomgr.getbyoid(410)
  sunspritesC[4] = gomgr.getbyoid(411)
  sunspritesC[5] = gomgr.getbyoid(412)
  sunspritesC[6] = gomgr.getbyoid(413)
  sunspritesC[7] = gomgr.getbyoid(414)
  sunspritesC[8] = gomgr.getbyoid(415)
  sunspritesC[9] = gomgr.getbyoid(416)
  sunspritesC[10] = gomgr.getbyoid(417)
  sunspritesC[11] = gomgr.getbyoid(418)
  sunspritesC[12] = gomgr.getbyoid(419)
  sunspritesC[13] = gomgr.getbyoid(420)
  sunspritesC[14] = gomgr.getbyoid(421)
  sunspritesC[15] = gomgr.getbyoid(422)
  sunspritesC[16] = gomgr.getbyoid(423)
  sunspritesC[17] = gomgr.getbyoid(424)
  sunspritesC[18] = gomgr.getbyoid(425)
  sunspritesC[19] = gomgr.getbyoid(426)
  sunspritesC[20] = gomgr.getbyoid(427)
  sunspritesC[21] = gomgr.getbyoid(428)
  sunspritesC[22] = gomgr.getbyoid(429)
  sunspritesC[23] = gomgr.getbyoid(430)

end


function on_label(label)

  if label == "shadowwithlightsA" then
    setup_shadow_with_lightsA()
  elseif label == "shadowwithlightsB" then
    setup_shadow_with_lightsB()
  elseif label == "shadowwithlightsC" then
    setup_shadow_with_lightsC()
  elseif label == "clear" then
    clear_lights_shadows()

  end
end

function setup_shadow_with_lightsA()

  for i = 1, #wssunspotsA do
    sunspritesA[i]:addtoworld()
    wssunspotsA[i].curphase = 1
    sunspotsA[i]:dispatchlabel("addtoworld")
  end

end

function setup_shadow_with_lightsB()

  for i = 1, #wssunspotsA do
    wssunspotsA[i].curphase = 0
    sunspotsA[i]:dispatchlabel("removefromworld")
    sunspritesA[i]:removefromworld()
  end

  for j = 1, #wssunspotsB do
    sunspritesB[j]:addtoworld()
    wssunspotsB[j].curphase = 1
    sunspotsB[j]:dispatchlabel("addtoworld")
  end

end

function setup_shadow_with_lightsC()

  for i = 1, #wssunspotsB do
    wssunspotsB[i].curphase = 0
    sunspotsB[i]:dispatchlabel("removefromworld")
    sunspritesB[i]:removefromworld()
  end

  for j = 1, #wssunspotsC do
    sunspritesC[j]:addtoworld()
    wssunspotsC[j].curphase = 1
    sunspotsC[j]:dispatchlabel("addtoworld")
  end

end

function clear_lights_shadows()

  for i = 1, #wssunspotsA do
    wssunspotsA[i].curphase = 0
    sunspotsA[i]:dispatchlabel("removefromworld")
    sunspritesA[i]:removefromworld()
  end

  for j = 1, #wssunspotsB do
    wssunspotsB[j].curphase = 0
    sunspotsB[j]:dispatchlabel("removefromworld")
    sunspritesB[j]:removefromworld()
  end

  for k = 1, #wssunspotsC do
    wssunspotsC[k].curphase = 0
    sunspotsC[k]:dispatchlabel("removefromworld")
    sunspritesC[k]:removefromworld()
  end

end