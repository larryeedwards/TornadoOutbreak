weatherstuff1 = {}

function on_postload()
    weatherstuff1[1] = gomgr.getbyoid(279)
    weatherstuff1[2] = gomgr.getbyoid(280)
    weatherstuff1[3] = gomgr.getbyoid(281)
    weatherstuff1[4] = gomgr.getbyoid(282)
    weatherstuff1[5] = gomgr.getbyoid(283)
    weatherstuff1[6] = gomgr.getbyoid(284)
    weatherstuff1[7] = gomgr.getbyoid(285)
    weatherstuff1[8] = gomgr.getbyoid(286)
    weatherstuff1[9] = gomgr.getbyoid(287)
    weatherstuff1[10] = gomgr.getbyoid(288)
    weatherstuff1[11] = gomgr.getbyoid(289)
    weatherstuff1[12] = gomgr.getbyoid(290)
    weatherstuff1[13] = gomgr.getbyoid(294)
    weatherstuff1[14] = gomgr.getbyoid(293)
    weatherstuff1[15] = gomgr.getbyoid(292)
    weatherstuff1[16] = gomgr.getbyoid(291)
end

function addphase1()
    for i = 1, #weatherstuff1 do
        weatherstuff1[i]:addtoworld()
        weatherstuff1[i]:dispatchlabel("default")
    end
end

function removephase1()
    for i = 1, #weatherstuff1 do
        weatherstuff1[i]:dispatchlabel("idle_high")
        weatherstuff1[i]:removefromworld()
    end
end

function on_label(label)
    if label == "weatherphase0" then
        this.curphase = 0
        removephase1()
    elseif label == "weatherphase1" then
        this.curphase = 1
        addphase1()
    elseif label == "weatherphase2" then
        this.curphase = 2
        addphase1()
    elseif label == "grow" then
        for i = 1, #weatherstuff1 do
            weatherstuff1[i]:dispatchlabel("idle_high")
        end
        for i = 1, #weatherstuff1 do
            weatherstuff1[i]:dispatchlabel("grow")
            pause(0.2)
        end
    elseif label == "shrink" then
        for i = 1, #weatherstuff1 do
            weatherstuff1[i]:dispatchlabel("shrink")
        end
    end
end
