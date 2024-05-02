weatherstuff1 = {}

function on_postload()
  weatherstuff1[1] = gomgr.getbyoid(3277)
  weatherstuff1[2] = gomgr.getbyoid(3278)
  weatherstuff1[3] = gomgr.getbyoid(3279)
  weatherstuff1[4] = gomgr.getbyoid(3280)
  weatherstuff1[5] = gomgr.getbyoid(3281)
  weatherstuff1[6] = gomgr.getbyoid(3282)
  weatherstuff1[7] = gomgr.getbyoid(3283)
  weatherstuff1[8] = gomgr.getbyoid(3284)
  weatherstuff1[9] = gomgr.getbyoid(3285)
  weatherstuff1[10] = gomgr.getbyoid(3286)
  weatherstuff1[11] = gomgr.getbyoid(3287)
  weatherstuff1[12] = gomgr.getbyoid(3288)
  weatherstuff1[13] = gomgr.getbyoid(3289)
  weatherstuff1[14] = gomgr.getbyoid(3290)
  weatherstuff1[15] = gomgr.getbyoid(3291)
  weatherstuff1[16] = gomgr.getbyoid(3292)
  weatherstuff1[17] = gomgr.getbyoid(3298)
  weatherstuff1[18] = gomgr.getbyoid(3297)
  weatherstuff1[19] = gomgr.getbyoid(3296)
  weatherstuff1[20] = gomgr.getbyoid(3295)
  weatherstuff1[21] = gomgr.getbyoid(3294)
  weatherstuff1[22] = gomgr.getbyoid(3293)
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