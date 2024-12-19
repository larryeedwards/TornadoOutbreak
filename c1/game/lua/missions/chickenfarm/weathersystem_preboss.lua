weatherstuff1 = {}

function on_postload()
    weatherstuff1[1] = gomgr.getbyoid(386)
    weatherstuff1[2] = gomgr.getbyoid(390)
    weatherstuff1[3] = gomgr.getbyoid(391)
    weatherstuff1[4] = gomgr.getbyoid(392)
    weatherstuff1[5] = gomgr.getbyoid(393)
    weatherstuff1[6] = gomgr.getbyoid(394)
    weatherstuff1[7] = gomgr.getbyoid(395)
    weatherstuff1[8] = gomgr.getbyoid(396)
    weatherstuff1[9] = gomgr.getbyoid(397)
    weatherstuff1[10] = gomgr.getbyoid(398)
    weatherstuff1[11] = gomgr.getbyoid(399)
    weatherstuff1[12] = gomgr.getbyoid(400)
    weatherstuff1[13] = gomgr.getbyoid(401)
    weatherstuff1[14] = gomgr.getbyoid(402)
    weatherstuff1[15] = gomgr.getbyoid(403)
    weatherstuff1[16] = gomgr.getbyoid(387)
    weatherstuff1[17] = gomgr.getbyoid(388)
    weatherstuff1[18] = gomgr.getbyoid(389)
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