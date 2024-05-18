weatherstuff1 = {}

function on_postload()
  weatherstuff1[1] = gomgr.getbyoid(319)
  weatherstuff1[2] = gomgr.getbyoid(328)
  weatherstuff1[3] = gomgr.getbyoid(329)
  weatherstuff1[4] = gomgr.getbyoid(330)
  weatherstuff1[5] = gomgr.getbyoid(331)
  weatherstuff1[6] = gomgr.getbyoid(332)
  weatherstuff1[7] = gomgr.getbyoid(333)
  weatherstuff1[8] = gomgr.getbyoid(334)
  weatherstuff1[9] = gomgr.getbyoid(335)
  weatherstuff1[10] = gomgr.getbyoid(336)
  weatherstuff1[12] = gomgr.getbyoid(337)
  weatherstuff1[13] = gomgr.getbyoid(338)
  weatherstuff1[14] = gomgr.getbyoid(339)
  weatherstuff1[15] = gomgr.getbyoid(340)
  weatherstuff1[16] = gomgr.getbyoid(341)
  weatherstuff1[17] = gomgr.getbyoid(342)
  weatherstuff1[18] = gomgr.getbyoid(320)
  weatherstuff1[19] = gomgr.getbyoid(321)
  weatherstuff1[20] = gomgr.getbyoid(322)
  weatherstuff1[21] = gomgr.getbyoid(323)
  weatherstuff1[22] = gomgr.getbyoid(324)
  weatherstuff1[23] = gomgr.getbyoid(325)
  weatherstuff1[24] = gomgr.getbyoid(326)
  weatherstuff1[11] = gomgr.getbyoid(327)


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
    gomgr.getbyoid(236).curphase = 0
    removephase1()

  elseif label == "weatherphase1" then
    this.curphase = 1
    gomgr.getbyoid(236).curphase = 1
    addphase1()

  elseif label == "grow" then
    for i = 1, #weatherstuff1 do
      weatherstuff1[i]:dispatchlabel("idle_high")
    end
    for i = 1, #weatherstuff1 do
      weatherstuff1[i]:dispatchlabel("grow")
      pause(0.25)
    end

  elseif label == "shrink" then
    for i = 1, #weatherstuff1 do
     weatherstuff1[i]:dispatchlabel("shrink")
     end
  end
end