weatherstuff1 = {}

function on_postload()
  weatherstuff1[1] = gomgr.getbyoid(3299)
  weatherstuff1[2] = gomgr.getbyoid(3300)
  weatherstuff1[3] = gomgr.getbyoid(3301)
  weatherstuff1[4] = gomgr.getbyoid(3302)
  weatherstuff1[5] = gomgr.getbyoid(3303)
  weatherstuff1[6] = gomgr.getbyoid(3304)
  weatherstuff1[7] = gomgr.getbyoid(3305)
  weatherstuff1[8] = gomgr.getbyoid(3306)
  weatherstuff1[9] = gomgr.getbyoid(3307)
  weatherstuff1[10] = gomgr.getbyoid(3308)
  weatherstuff1[11] = gomgr.getbyoid(3309)
  weatherstuff1[12] = gomgr.getbyoid(3310)
  weatherstuff1[13] = gomgr.getbyoid(3311)
  weatherstuff1[14] = gomgr.getbyoid(3312)
  weatherstuff1[15] = gomgr.getbyoid(3313)
  weatherstuff1[17] = gomgr.getbyoid(3314)
  weatherstuff1[18] = gomgr.getbyoid(3315)
  weatherstuff1[19] = gomgr.getbyoid(3316)
  weatherstuff1[20] = gomgr.getbyoid(3318)
  weatherstuff1[21] = gomgr.getbyoid(3319)
  weatherstuff1[22] = gomgr.getbyoid(3320)
  weatherstuff1[23] = gomgr.getbyoid(3321)
  weatherstuff1[24] = gomgr.getbyoid(3322)
  weatherstuff1[25] = gomgr.getbyoid(3323)
  weatherstuff1[26] = gomgr.getbyoid(3324)
  weatherstuff1[16] = gomgr.getbyoid(3325)
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
      pause(0.25)
    end

  elseif label == "shrink" then
    for i = 1, #weatherstuff1 do
     weatherstuff1[i]:dispatchlabel("shrink")
     end
  end
end