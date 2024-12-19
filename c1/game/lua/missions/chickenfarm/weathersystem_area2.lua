weatherstuff1 = {}

function on_postload()
    weatherstuff1[1] = gomgr.getbyoid(315)
    weatherstuff1[2] = gomgr.getbyoid(316)
    weatherstuff1[3] = gomgr.getbyoid(317)
    weatherstuff1[4] = gomgr.getbyoid(318)
    weatherstuff1[5] = gomgr.getbyoid(319)
    weatherstuff1[6] = gomgr.getbyoid(320)
    weatherstuff1[7] = gomgr.getbyoid(321)
    weatherstuff1[8] = gomgr.getbyoid(322)
    weatherstuff1[9] = gomgr.getbyoid(323)
    weatherstuff1[10] = gomgr.getbyoid(324)
    weatherstuff1[11] = gomgr.getbyoid(325)
    weatherstuff1[12] = gomgr.getbyoid(326)
    weatherstuff1[13] = gomgr.getbyoid(327)
    weatherstuff1[14] = gomgr.getbyoid(328)
    weatherstuff1[15] = gomgr.getbyoid(329)
    weatherstuff1[16] = gomgr.getbyoid(330)
    weatherstuff1[17] = gomgr.getbyoid(331)
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