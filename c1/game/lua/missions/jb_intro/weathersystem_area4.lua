weatherstuff1 = {}

function on_postload()
  weatherstuff1[1] = gomgr.getbyoid(550)
  weatherstuff1[2] = gomgr.getbyoid(551)
  weatherstuff1[3] = gomgr.getbyoid(552)
  weatherstuff1[4] = gomgr.getbyoid(553)
  weatherstuff1[5] = gomgr.getbyoid(554)
  weatherstuff1[6] = gomgr.getbyoid(555)
  weatherstuff1[7] = gomgr.getbyoid(556)
  weatherstuff1[8] = gomgr.getbyoid(557)
  weatherstuff1[9] = gomgr.getbyoid(558)
  weatherstuff1[10] = gomgr.getbyoid(559)
  weatherstuff1[11] = gomgr.getbyoid(560)
  weatherstuff1[12] = gomgr.getbyoid(561)
  weatherstuff1[13] = gomgr.getbyoid(562)
  weatherstuff1[14] = gomgr.getbyoid(563)
  weatherstuff1[15] = gomgr.getbyoid(564)
  weatherstuff1[16] = gomgr.getbyoid(565)
  weatherstuff1[17] = gomgr.getbyoid(566)
  weatherstuff1[18] = gomgr.getbyoid(567)
  weatherstuff1[19] = gomgr.getbyoid(568)
  weatherstuff1[20] = gomgr.getbyoid(569)
  weatherstuff1[21] = gomgr.getbyoid(570)
  weatherstuff1[22] = gomgr.getbyoid(571)
  weatherstuff1[23] = gomgr.getbyoid(572)
  weatherstuff1[24] = gomgr.getbyoid(573)
  weatherstuff1[25] = gomgr.getbyoid(574)
  weatherstuff1[26] = gomgr.getbyoid(575)
  weatherstuff1[27] = gomgr.getbyoid(576)
  weatherstuff1[28] = gomgr.getbyoid(577)
  weatherstuff1[29] = gomgr.getbyoid(578)
end

function addphase1()
  for i = 1, #weatherstuff1 do
    (weatherstuff1[i]):addtoworld()
  end
end

function removephase1()
  for i = 1, #weatherstuff1 do
    (weatherstuff1[i]):removefromworld()
  end
end

function on_label(label)
  if label == "weatherphase0" then
    this.curphase = 0
    removephase1()
  end

  if label == "weatherphase1" then
    this.curphase = 1
    addphase1()
  end

end