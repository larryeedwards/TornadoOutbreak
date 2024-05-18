weatherstuff1 = {}

function on_postload()
  weatherstuff1[1] = gomgr.getbyoid(295)
  weatherstuff1[2] = gomgr.getbyoid(296)
  weatherstuff1[3] = gomgr.getbyoid(297)
  weatherstuff1[4] = gomgr.getbyoid(298)
  weatherstuff1[5] = gomgr.getbyoid(299)
  weatherstuff1[6] = gomgr.getbyoid(300)
  weatherstuff1[8] = gomgr.getbyoid(301)
  weatherstuff1[9] = gomgr.getbyoid(302)
  weatherstuff1[10] = gomgr.getbyoid(303)
  weatherstuff1[11] = gomgr.getbyoid(304)
  weatherstuff1[12] = gomgr.getbyoid(305)
  weatherstuff1[13] = gomgr.getbyoid(306)
  weatherstuff1[14] = gomgr.getbyoid(307)
  weatherstuff1[15] = gomgr.getbyoid(308)
  weatherstuff1[16] = gomgr.getbyoid(309)
  weatherstuff1[17] = gomgr.getbyoid(310)
  weatherstuff1[18] = gomgr.getbyoid(311)
  weatherstuff1[19] = gomgr.getbyoid(312)
  weatherstuff1[20] = gomgr.getbyoid(313)
  weatherstuff1[21] = gomgr.getbyoid(314)
  weatherstuff1[22] = gomgr.getbyoid(315)
  weatherstuff1[23] = gomgr.getbyoid(316)
  weatherstuff1[24] = gomgr.getbyoid(317)
  weatherstuff1[7] = gomgr.getbyoid(318)
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