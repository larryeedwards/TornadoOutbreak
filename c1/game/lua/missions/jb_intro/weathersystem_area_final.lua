weatherstuff1 = {}

function on_postload()
  weatherstuff1[1] = gomgr.getbyoid(579)
  weatherstuff1[2] = gomgr.getbyoid(721)
  weatherstuff1[3] = gomgr.getbyoid(722)
  weatherstuff1[4] = gomgr.getbyoid(723)
  weatherstuff1[5] = gomgr.getbyoid(724)
  weatherstuff1[6] = gomgr.getbyoid(725)
  weatherstuff1[7] = gomgr.getbyoid(726)
  weatherstuff1[8] = gomgr.getbyoid(727)
  weatherstuff1[9] = gomgr.getbyoid(728)
  weatherstuff1[10] = gomgr.getbyoid(729)
  weatherstuff1[11] = gomgr.getbyoid(580)
  weatherstuff1[12] = gomgr.getbyoid(581)
  weatherstuff1[13] = gomgr.getbyoid(582)
  weatherstuff1[14] = gomgr.getbyoid(583)
  weatherstuff1[15] = gomgr.getbyoid(584)
  weatherstuff1[16] = gomgr.getbyoid(585)
  weatherstuff1[17] = gomgr.getbyoid(586)
  weatherstuff1[18] = gomgr.getbyoid(587)
  weatherstuff1[19] = gomgr.getbyoid(588)
  weatherstuff1[20] = gomgr.getbyoid(589)
  weatherstuff1[21] = gomgr.getbyoid(590)
  weatherstuff1[22] = gomgr.getbyoid(591)
  weatherstuff1[23] = gomgr.getbyoid(592)
  weatherstuff1[24] = gomgr.getbyoid(593)
  weatherstuff1[25] = gomgr.getbyoid(594)
  weatherstuff1[26] = gomgr.getbyoid(595)
  weatherstuff1[27] = gomgr.getbyoid(596)
  weatherstuff1[28] = gomgr.getbyoid(597)
  weatherstuff1[29] = gomgr.getbyoid(598)
  weatherstuff1[30] = gomgr.getbyoid(599)


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