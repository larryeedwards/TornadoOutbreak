weatherstuff1 = {}

function on_postload()
  weatherstuff1[1] = gomgr.getbyoid(417)
  weatherstuff1[2] = gomgr.getbyoid(418)
  weatherstuff1[3] = gomgr.getbyoid(419)
  weatherstuff1[4] = gomgr.getbyoid(420)
  weatherstuff1[5] = gomgr.getbyoid(421)
  weatherstuff1[6] = gomgr.getbyoid(422)
  weatherstuff1[7] = gomgr.getbyoid(423)
  weatherstuff1[8] = gomgr.getbyoid(424)
  weatherstuff1[9] = gomgr.getbyoid(425)
  weatherstuff1[10] = gomgr.getbyoid(426)
  weatherstuff1[11] = gomgr.getbyoid(427)
  weatherstuff1[12] = gomgr.getbyoid(428)
  weatherstuff1[13] = gomgr.getbyoid(429)
  weatherstuff1[14] = gomgr.getbyoid(430)
  weatherstuff1[15] = gomgr.getbyoid(431)
  weatherstuff1[16] = gomgr.getbyoid(432)
  weatherstuff1[17] = gomgr.getbyoid(433)
  weatherstuff1[18] = gomgr.getbyoid(434)
  weatherstuff1[19] = gomgr.getbyoid(435)
  weatherstuff1[20] = gomgr.getbyoid(436)
  weatherstuff1[21] = gomgr.getbyoid(437)
  weatherstuff1[22] = gomgr.getbyoid(453)
  weatherstuff1[23] = gomgr.getbyoid(452)
  weatherstuff1[24] = gomgr.getbyoid(451)
  weatherstuff1[25] = gomgr.getbyoid(450)
  weatherstuff1[26] = gomgr.getbyoid(449)
  weatherstuff1[27] = gomgr.getbyoid(448)
  weatherstuff1[28] = gomgr.getbyoid(447)
  weatherstuff1[29] = gomgr.getbyoid(446)
  weatherstuff1[30] = gomgr.getbyoid(445)
  weatherstuff1[31] = gomgr.getbyoid(444)
  weatherstuff1[32] = gomgr.getbyoid(443)
  weatherstuff1[33] = gomgr.getbyoid(442)
  weatherstuff1[34] = gomgr.getbyoid(441)
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