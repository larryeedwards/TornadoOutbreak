weatherstuff1 = {}

function on_postload()
    weatherstuff1[1] = gomgr.getbyoid(353)
    weatherstuff1[2] = gomgr.getbyoid(361)
    weatherstuff1[3] = gomgr.getbyoid(362)
    weatherstuff1[4] = gomgr.getbyoid(363)
    weatherstuff1[5] = gomgr.getbyoid(364)
    weatherstuff1[6] = gomgr.getbyoid(365)
    weatherstuff1[7] = gomgr.getbyoid(366)
    weatherstuff1[8] = gomgr.getbyoid(367)
    weatherstuff1[9] = gomgr.getbyoid(368)
    weatherstuff1[10] = gomgr.getbyoid(369)
    weatherstuff1[11] = gomgr.getbyoid(370)
    weatherstuff1[12] = gomgr.getbyoid(371)
    weatherstuff1[13] = gomgr.getbyoid(372)
    weatherstuff1[14] = gomgr.getbyoid(373)
    weatherstuff1[15] = gomgr.getbyoid(374)
    weatherstuff1[16] = gomgr.getbyoid(375)
    weatherstuff1[17] = gomgr.getbyoid(376)
    weatherstuff1[18] = gomgr.getbyoid(377)
    weatherstuff1[19] = gomgr.getbyoid(378)
    weatherstuff1[20] = gomgr.getbyoid(379)
    weatherstuff1[21] = gomgr.getbyoid(380)
    weatherstuff1[22] = gomgr.getbyoid(381)
    weatherstuff1[23] = gomgr.getbyoid(382)
    weatherstuff1[24] = gomgr.getbyoid(383)
    weatherstuff1[25] = gomgr.getbyoid(384)
    weatherstuff1[26] = gomgr.getbyoid(385)
    weatherstuff1[27] = gomgr.getbyoid(358)
    weatherstuff1[28] = gomgr.getbyoid(357)
    weatherstuff1[29] = gomgr.getbyoid(356)
    weatherstuff1[30] = gomgr.getbyoid(355)
    weatherstuff1[31] = gomgr.getbyoid(354)
    weatherstuff1[32] = gomgr.getbyoid(359)
    weatherstuff1[33] = gomgr.getbyoid(360)
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