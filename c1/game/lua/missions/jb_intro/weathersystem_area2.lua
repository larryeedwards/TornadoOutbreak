weatherstuff1 = {}

function on_postload()
  weatherstuff1[1] = gomgr.getbyoid(503)
  weatherstuff1[2] = gomgr.getbyoid(504)
  weatherstuff1[3] = gomgr.getbyoid(505)
  weatherstuff1[4] = gomgr.getbyoid(506)
  weatherstuff1[5] = gomgr.getbyoid(507)
  weatherstuff1[6] = gomgr.getbyoid(508)
  weatherstuff1[7] = gomgr.getbyoid(509)
  weatherstuff1[8] = gomgr.getbyoid(510)
  weatherstuff1[9] = gomgr.getbyoid(511)
  weatherstuff1[10] = gomgr.getbyoid(512)
  weatherstuff1[11] = gomgr.getbyoid(513)
  weatherstuff1[12] = gomgr.getbyoid(514)
  weatherstuff1[13] = gomgr.getbyoid(515)
  weatherstuff1[14] = gomgr.getbyoid(516)
  weatherstuff1[15] = gomgr.getbyoid(517)
  weatherstuff1[16] = gomgr.getbyoid(518)
  weatherstuff1[17] = gomgr.getbyoid(519)

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