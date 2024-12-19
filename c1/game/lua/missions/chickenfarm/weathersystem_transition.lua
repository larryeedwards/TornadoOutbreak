function on_postload()
    weatherstuff1[1] = gomgr.getbyoid(295)
    weatherstuff1[2] = gomgr.getbyoid(296)
    weatherstuff1[3] = gomgr.getbyoid(297)
    weatherstuff1[4] = gomgr.getbyoid(298)
    weatherstuff1[5] = gomgr.getbyoid(299)
    weatherstuff1[6] = gomgr.getbyoid(300)
    weatherstuff1[7] = gomgr.getbyoid(301)
    weatherstuff1[8] = gomgr.getbyoid(302)
    weatherstuff1[9] = gomgr.getbyoid(303)
    weatherstuff1[10] = gomgr.getbyoid(304)
    weatherstuff1[11] = gomgr.getbyoid(305)
    weatherstuff1[12] = gomgr.getbyoid(306)
    weatherstuff1[13] = gomgr.getbyoid(307)
    weatherstuff1[14] = gomgr.getbyoid(308)
    weatherstuff1[15] = gomgr.getbyoid(309)
    weatherstuff1[16] = gomgr.getbyoid(312)
    weatherstuff1[17] = gomgr.getbyoid(310)
    weatherstuff1[18] = gomgr.getbyoid(311)
    weatherstuff1[19] = gomgr.getbyoid(313)
    weatherstuff1[20] = gomgr.getbyoid(314)
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
    end

    if label == "weatherphase1" then
        this.curphase = 1
    end
end