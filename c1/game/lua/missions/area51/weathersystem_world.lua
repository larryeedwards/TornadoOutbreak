weatherstuff1 = {}

function on_postload()
  weatherstuff1[1] = gomgr.getbyoid(3326)
  weatherstuff1[2] = gomgr.getbyoid(3334)
  weatherstuff1[3] = gomgr.getbyoid(3335)
  weatherstuff1[4] = gomgr.getbyoid(3336)
  weatherstuff1[5] = gomgr.getbyoid(3337)
  weatherstuff1[6] = gomgr.getbyoid(3338)
  weatherstuff1[7] = gomgr.getbyoid(3339)
  weatherstuff1[8] = gomgr.getbyoid(3340)
  weatherstuff1[9] = gomgr.getbyoid(3341)
  weatherstuff1[10] = gomgr.getbyoid(3342)
  weatherstuff1[11] = gomgr.getbyoid(3343)
  weatherstuff1[12] = gomgr.getbyoid(3344)
  weatherstuff1[13] = gomgr.getbyoid(3345)
  weatherstuff1[14] = gomgr.getbyoid(3346)
  weatherstuff1[15] = gomgr.getbyoid(3347)
  weatherstuff1[16] = gomgr.getbyoid(3348)
  weatherstuff1[17] = gomgr.getbyoid(3349)
  weatherstuff1[18] = gomgr.getbyoid(3350)
  weatherstuff1[19] = gomgr.getbyoid(3351)
  weatherstuff1[20] = gomgr.getbyoid(3352)
  weatherstuff1[21] = gomgr.getbyoid(3353)
  weatherstuff1[22] = gomgr.getbyoid(3354)
  weatherstuff1[23] = gomgr.getbyoid(3355)
  weatherstuff1[24] = gomgr.getbyoid(3356)
  weatherstuff1[25] = gomgr.getbyoid(3357)
  weatherstuff1[26] = gomgr.getbyoid(3358)
  weatherstuff1[27] = gomgr.getbyoid(3359)
  weatherstuff1[28] = gomgr.getbyoid(3360)
  weatherstuff1[29] = gomgr.getbyoid(3361)
  weatherstuff1[30] = gomgr.getbyoid(3362)
  weatherstuff1[31] = gomgr.getbyoid(3363)
  weatherstuff1[32] = gomgr.getbyoid(3364)
  weatherstuff1[33] = gomgr.getbyoid(3365)
  weatherstuff1[34] = gomgr.getbyoid(3366)
  weatherstuff1[35] = gomgr.getbyoid(3367)
  weatherstuff1[36] = gomgr.getbyoid(3327)
  weatherstuff1[37] = gomgr.getbyoid(3328)
  weatherstuff1[38] = gomgr.getbyoid(3329)
  weatherstuff1[39] = gomgr.getbyoid(3330)
  weatherstuff1[40] = gomgr.getbyoid(3331)
  weatherstuff1[41] = gomgr.getbyoid(3332)
  weatherstuff1[42] = gomgr.getbyoid(3333)
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

  if label == "weatherphase2" then
    this.curphase = 2
    removephase1()
  end
end