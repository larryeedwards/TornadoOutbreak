weatherstuff1 = {}

function on_postload()
  weatherstuff1[1] = gomgr.getbyoid(401)
  weatherstuff1[2] = gomgr.getbyoid(402)
  weatherstuff1[3] = gomgr.getbyoid(403)
  weatherstuff1[4] = gomgr.getbyoid(404)
  weatherstuff1[5] = gomgr.getbyoid(405)
  weatherstuff1[6] = gomgr.getbyoid(406)
  weatherstuff1[7] = gomgr.getbyoid(407)
  weatherstuff1[8] = gomgr.getbyoid(408)
  weatherstuff1[9] = gomgr.getbyoid(409)
  weatherstuff1[10] = gomgr.getbyoid(410)
  weatherstuff1[11] = gomgr.getbyoid(400)
  weatherstuff1[12] = gomgr.getbyoid(411)
  weatherstuff1[13] = gomgr.getbyoid(412)
  weatherstuff1[14] = gomgr.getbyoid(413)
  weatherstuff1[15] = gomgr.getbyoid(414)
  weatherstuff1[16] = gomgr.getbyoid(415)
  weatherstuff1[17] = gomgr.getbyoid(416)
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
      pause(0.2)
    end

  elseif label == "shrink" then
    for i = 1, #weatherstuff1 do
      weatherstuff1[i]:dispatchlabel("shrink")
    end
    
  end
end