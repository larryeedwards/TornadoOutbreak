weatherstuff1 = {}
weatherstuff2 = {}
weatherstuff3 = {}
weatherstuff4 = {}

function on_postload()
  weatherstuff1[1] = gomgr.getbyoid(690)
  weatherstuff1[2] = gomgr.getbyoid(691)
  weatherstuff1[3] = gomgr.getbyoid(692)
  weatherstuff1[4] = gomgr.getbyoid(693)
  weatherstuff1[5] = gomgr.getbyoid(694)
  weatherstuff1[6] = gomgr.getbyoid(492)
  weatherstuff1[7] = gomgr.getbyoid(493)
  weatherstuff1[8] = gomgr.getbyoid(494)
  weatherstuff1[9] = gomgr.getbyoid(495)
  weatherstuff1[10] = gomgr.getbyoid(496)
  weatherstuff1[11] = gomgr.getbyoid(497)
  weatherstuff1[12] = gomgr.getbyoid(498)
  weatherstuff1[13] = gomgr.getbyoid(499)
  weatherstuff1[14] = gomgr.getbyoid(500)
  weatherstuff1[15] = gomgr.getbyoid(501)
  weatherstuff1[16] = gomgr.getbyoid(502)
  weatherstuff1[17] = gomgr.getbyoid(491)

  weatherstuff2[1] = gomgr.getbyoid(695)
  weatherstuff2[2] = gomgr.getbyoid(696)
  weatherstuff2[3] = gomgr.getbyoid(697)
  weatherstuff2[4] = gomgr.getbyoid(698)
  weatherstuff2[5] = gomgr.getbyoid(699)
  weatherstuff2[6] = gomgr.getbyoid(700)
  weatherstuff2[7] = gomgr.getbyoid(701)
  weatherstuff2[8] = gomgr.getbyoid(702)
  weatherstuff2[9] = gomgr.getbyoid(504)
  weatherstuff2[10] = gomgr.getbyoid(505)
  weatherstuff2[11] = gomgr.getbyoid(506)
  weatherstuff2[12] = gomgr.getbyoid(507)
  weatherstuff2[13] = gomgr.getbyoid(508)
  weatherstuff2[14] = gomgr.getbyoid(509)
  weatherstuff2[15] = gomgr.getbyoid(510)
  weatherstuff2[16] = gomgr.getbyoid(511)
  weatherstuff2[17] = gomgr.getbyoid(512)
  weatherstuff2[18] = gomgr.getbyoid(513)
  weatherstuff2[19] = gomgr.getbyoid(514)
  weatherstuff2[20] = gomgr.getbyoid(515)
  weatherstuff2[21] = gomgr.getbyoid(516)
  weatherstuff2[22] = gomgr.getbyoid(517)
  weatherstuff2[23] = gomgr.getbyoid(518)
  weatherstuff2[24] = gomgr.getbyoid(519)
  weatherstuff2[25] = gomgr.getbyoid(503)

  weatherstuff3[1] = gomgr.getbyoid(703)
  weatherstuff3[2] = gomgr.getbyoid(704)
  weatherstuff3[3] = gomgr.getbyoid(705)
  weatherstuff3[4] = gomgr.getbyoid(706)
  weatherstuff3[5] = gomgr.getbyoid(707)
  weatherstuff3[6] = gomgr.getbyoid(708)
  weatherstuff3[7] = gomgr.getbyoid(709)
  weatherstuff3[8] = gomgr.getbyoid(710)
  weatherstuff3[9] = gomgr.getbyoid(711)
  weatherstuff3[10] = gomgr.getbyoid(521)
  weatherstuff3[11] = gomgr.getbyoid(522)
  weatherstuff3[12] = gomgr.getbyoid(523)
  weatherstuff3[13] = gomgr.getbyoid(524)
  weatherstuff3[14] = gomgr.getbyoid(525)
  weatherstuff3[15] = gomgr.getbyoid(526)
  weatherstuff3[16] = gomgr.getbyoid(527)
  weatherstuff3[17] = gomgr.getbyoid(528)
  weatherstuff3[18] = gomgr.getbyoid(529)
  weatherstuff3[19] = gomgr.getbyoid(530)
  weatherstuff3[20] = gomgr.getbyoid(531)
  weatherstuff3[21] = gomgr.getbyoid(532)
  weatherstuff3[22] = gomgr.getbyoid(533)
  weatherstuff3[23] = gomgr.getbyoid(534)
  weatherstuff3[24] = gomgr.getbyoid(535)
  weatherstuff3[25] = gomgr.getbyoid(536)
  weatherstuff3[26] = gomgr.getbyoid(537)
  weatherstuff3[27] = gomgr.getbyoid(538)
  weatherstuff3[28] = gomgr.getbyoid(539)
  weatherstuff3[29] = gomgr.getbyoid(540)
  weatherstuff3[30] = gomgr.getbyoid(541)
  weatherstuff3[31] = gomgr.getbyoid(542)
  weatherstuff3[32] = gomgr.getbyoid(543)
  weatherstuff3[33] = gomgr.getbyoid(544)
  weatherstuff3[34] = gomgr.getbyoid(545)
  weatherstuff3[35] = gomgr.getbyoid(546)
  weatherstuff3[36] = gomgr.getbyoid(547)
  weatherstuff3[37] = gomgr.getbyoid(548)
  weatherstuff3[38] = gomgr.getbyoid(549)
  weatherstuff3[39] = gomgr.getbyoid(520)

  weatherstuff4[1] = gomgr.getbyoid(712)
  weatherstuff4[2] = gomgr.getbyoid(713)
  weatherstuff4[3] = gomgr.getbyoid(714)
  weatherstuff4[4] = gomgr.getbyoid(715)
  weatherstuff4[5] = gomgr.getbyoid(716)
  weatherstuff4[6] = gomgr.getbyoid(717)
  weatherstuff4[7] = gomgr.getbyoid(718)
  weatherstuff4[8] = gomgr.getbyoid(719)
  weatherstuff4[9] = gomgr.getbyoid(720)
  weatherstuff4[10] = gomgr.getbyoid(551)
  weatherstuff4[11] = gomgr.getbyoid(552)
  weatherstuff4[12] = gomgr.getbyoid(553)
  weatherstuff4[13] = gomgr.getbyoid(554)
  weatherstuff4[14] = gomgr.getbyoid(555)
  weatherstuff4[15] = gomgr.getbyoid(556)
  weatherstuff4[16] = gomgr.getbyoid(557)
  weatherstuff4[17] = gomgr.getbyoid(558)
  weatherstuff4[18] = gomgr.getbyoid(559)
  weatherstuff4[19] = gomgr.getbyoid(560)
  weatherstuff4[20] = gomgr.getbyoid(561)
  weatherstuff4[21] = gomgr.getbyoid(562)
  weatherstuff4[22] = gomgr.getbyoid(563)
  weatherstuff4[23] = gomgr.getbyoid(564)
  weatherstuff4[24] = gomgr.getbyoid(565)
  weatherstuff4[25] = gomgr.getbyoid(566)
  weatherstuff4[26] = gomgr.getbyoid(567)
  weatherstuff4[27] = gomgr.getbyoid(568)
  weatherstuff4[28] = gomgr.getbyoid(569)
  weatherstuff4[29] = gomgr.getbyoid(570)
  weatherstuff4[30] = gomgr.getbyoid(571)
  weatherstuff4[31] = gomgr.getbyoid(572)
  weatherstuff4[32] = gomgr.getbyoid(573)
  weatherstuff4[33] = gomgr.getbyoid(574)
  weatherstuff4[34] = gomgr.getbyoid(575)
  weatherstuff4[35] = gomgr.getbyoid(576)
  weatherstuff4[36] = gomgr.getbyoid(577)
  weatherstuff4[37] = gomgr.getbyoid(578)
  weatherstuff4[38] = gomgr.getbyoid(550)

end

function on_label(label)
  if label == "weatherphase0" then
    this.curphase = 0
    for i = 1, #weatherstuff1 do
      (weatherstuff1[i]):removefromworld()
    end
    for i = 1, #weatherstuff2 do
      (weatherstuff2[i]):removefromworld()
    end
    for i = 1, #weatherstuff3 do
      (weatherstuff3[i]):removefromworld()
    end
    for i = 1, #weatherstuff4 do
      (weatherstuff4[i]):removefromworld()
    end


  elseif label == "weatherphase1" then
    this.curphase = 1
    for i = 1, #weatherstuff1 do
      (weatherstuff1[i]):addtoworld()
    end

  elseif label == "weatherphase2" then
    this.curphase = 2
    for i = 1, #weatherstuff2 do
      (weatherstuff2[i]):addtoworld()
    end
    for i = 1, #weatherstuff1 do
      (weatherstuff1[i]):removefromworld()
    end

  elseif label == "weatherphase3" then
    this.curphase = 3
    for i = 1, #weatherstuff3 do
      (weatherstuff3[i]):addtoworld()
    end
    for i = 1, #weatherstuff2 do
      (weatherstuff2[i]):removefromworld()
    end

  elseif label == "weatherphase4" then
    this.curphase = 4
    for i = 1, #weatherstuff4 do
      (weatherstuff4[i]):addtoworld()
    end
    for i = 1, #weatherstuff3 do
      (weatherstuff3[i]):removefromworld()
    end

  end
end