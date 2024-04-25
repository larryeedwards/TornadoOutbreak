weatherstuff1 = {}

function on_postload()
  weatherstuff1[1] = gomgr.getbyoid(520)
  weatherstuff1[2] = gomgr.getbyoid(521)
  weatherstuff1[3] = gomgr.getbyoid(522)
  weatherstuff1[4] = gomgr.getbyoid(523)
  weatherstuff1[5] = gomgr.getbyoid(524)
  weatherstuff1[6] = gomgr.getbyoid(525)
  weatherstuff1[7] = gomgr.getbyoid(526)
  weatherstuff1[8] = gomgr.getbyoid(527)
  weatherstuff1[9] = gomgr.getbyoid(528)
  weatherstuff1[10] = gomgr.getbyoid(529)
  weatherstuff1[11] = gomgr.getbyoid(530)
  weatherstuff1[12] = gomgr.getbyoid(531)
  weatherstuff1[13] = gomgr.getbyoid(532)
  weatherstuff1[14] = gomgr.getbyoid(533)
  weatherstuff1[15] = gomgr.getbyoid(534)
  weatherstuff1[16] = gomgr.getbyoid(535)
  weatherstuff1[17] = gomgr.getbyoid(536)
  weatherstuff1[18] = gomgr.getbyoid(537)
  weatherstuff1[19] = gomgr.getbyoid(538)
  weatherstuff1[20] = gomgr.getbyoid(539)
  weatherstuff1[21] = gomgr.getbyoid(540)
  weatherstuff1[22] = gomgr.getbyoid(541)
  weatherstuff1[23] = gomgr.getbyoid(542)
  weatherstuff1[24] = gomgr.getbyoid(543)
  weatherstuff1[25] = gomgr.getbyoid(544)
  weatherstuff1[26] = gomgr.getbyoid(545)
  weatherstuff1[27] = gomgr.getbyoid(546)
  weatherstuff1[28] = gomgr.getbyoid(547)
  weatherstuff1[29] = gomgr.getbyoid(548)
  weatherstuff1[30] = gomgr.getbyoid(549)
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