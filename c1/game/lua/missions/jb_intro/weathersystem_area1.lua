weatherstuff1 = {}

function on_postload()
  weatherstuff1[1] = gomgr.getbyoid(492)
  weatherstuff1[2] = gomgr.getbyoid(493)
  weatherstuff1[3] = gomgr.getbyoid(494)
  weatherstuff1[4] = gomgr.getbyoid(495)
  weatherstuff1[5] = gomgr.getbyoid(496)
  weatherstuff1[6] = gomgr.getbyoid(497)
  weatherstuff1[7] = gomgr.getbyoid(498)
  weatherstuff1[8] = gomgr.getbyoid(499)
  weatherstuff1[9] = gomgr.getbyoid(500)
  weatherstuff1[10] = gomgr.getbyoid(501)
  weatherstuff1[11] = gomgr.getbyoid(502)
  weatherstuff1[12] = gomgr.getbyoid(491)

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