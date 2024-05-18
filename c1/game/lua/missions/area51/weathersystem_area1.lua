weatherstuff1 = {}

function on_postload()
  weatherstuff1[1] = gomgr.getbyoid(3257)
  weatherstuff1[2] = gomgr.getbyoid(3258)
  weatherstuff1[3] = gomgr.getbyoid(3259)
  weatherstuff1[4] = gomgr.getbyoid(3260)
  weatherstuff1[5] = gomgr.getbyoid(3261)
  weatherstuff1[6] = gomgr.getbyoid(3262)
  weatherstuff1[7] = gomgr.getbyoid(3263)
  weatherstuff1[8] = gomgr.getbyoid(3264)
  weatherstuff1[9] = gomgr.getbyoid(3265)
  weatherstuff1[10] = gomgr.getbyoid(3266)
  weatherstuff1[11] = gomgr.getbyoid(3267)
  weatherstuff1[12] = gomgr.getbyoid(3268)
  weatherstuff1[13] = gomgr.getbyoid(3269)
  weatherstuff1[14] = gomgr.getbyoid(3270)
  weatherstuff1[15] = gomgr.getbyoid(3276)
  weatherstuff1[16] = gomgr.getbyoid(3275)
  weatherstuff1[17] = gomgr.getbyoid(3274)
  weatherstuff1[18] = gomgr.getbyoid(3273)
  weatherstuff1[19] = gomgr.getbyoid(3272)
  weatherstuff1[20] = gomgr.getbyoid(3271)
  weatherstuff1[21] = gomgr.getbyoid(3256)
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