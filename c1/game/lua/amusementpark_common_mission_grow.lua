function on_postload()
  childbyoid(309):removefromworld()
end
  gomgr.getbyoid(317):dispatchlabel("slowdown")

if label == "enter_fencecam" then
    enter_fencecam()
  elseif label == "exit_fencecam" then
    exit_fencecam()
  end

end

ffencecamactive = false
function enter_fencecam()

  --                                 
  if gomgr.getbyoid(16):fujrating() < 3.0 then
    ffencecamactive = true

    --                   
    cameramgr.activatecamerakind(4)
    cameramgr.orbitlookat = gomgr.getbyoid(16)
    cameramgr.orbitoffsetz = 1500
    cameramgr.orbitazim = 120
    cameramgr.orbitelev = 45
    cameramgr.orbitplayermode = true
  end

end

function exit_fencecam()

  if ffencecamactive == true then
    --                      
    cameramgr.matchcameras(1, 4)
    cameramgr.activatecamerakind(1)
    cameramgr.orbitplayermode = false
    ffencecamactive = false
  end

end


function on_triggerenter(triggerobject)

  enter_fencecam()

end

function on_triggerexit(triggerobject)

  exit_fencecam()

end

function on_postload()
  weatherstuff1[1] = gomgr.getbyoid(523)
  weatherstuff1[2] = gomgr.getbyoid(524)
  weatherstuff1[3] = gomgr.getbyoid(525)
  weatherstuff1[4] = gomgr.getbyoid(526)
  weatherstuff1[5] = gomgr.getbyoid(527)
  weatherstuff1[6] = gomgr.getbyoid(528)
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
function on_postload()
  weatherstuff1[1] = gomgr.getbyoid(454)
  weatherstuff1[2] = gomgr.getbyoid(455)
  weatherstuff1[3] = gomgr.getbyoid(456)
  weatherstuff1[4] = gomgr.getbyoid(457)
  weatherstuff1[5] = gomgr.getbyoid(458)
  weatherstuff1[6] = gomgr.getbyoid(459)
  weatherstuff1[7] = gomgr.getbyoid(460)
  weatherstuff1[8] = gomgr.getbyoid(461)
  weatherstuff1[9] = gomgr.getbyoid(462)
  weatherstuff1[10] = gomgr.getbyoid(463)
  weatherstuff1[11] = gomgr.getbyoid(469)
  weatherstuff1[12] = gomgr.getbyoid(468)
  weatherstuff1[13] = gomgr.getbyoid(467)
  weatherstuff1[14] = gomgr.getbyoid(466)
  weatherstuff1[15] = gomgr.getbyoid(465)
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
end          A   ÿÿÿÿÿÿÿÿA      (  A   ÿÿÿÿ  A   ÿÿÿÿÿÿÿÿA   ÿÿÿÿÿÿÿÿ  ÿÿÿÿÿÿÿÿÿÿÿÿ     ú   €  ;7|amusementpark_common_mission_grow|weathersystem_area2    >amusementpark_common_mission_grow.xgo: GO WeatherSystem_area2    ÿ  weatherstuff1 = {}

function on_postload()
  weatherstuff1[1] = gomgr.getbyoid(439)
  weatherstuff1[2] = gomgr.getbyoid(440)
  weatherstuff1[3] = gomgr.getbyoid(441)
  weatherstuff1[4] = gomgr.getbyoid(442)
  weatherstuff1[5] = gomgr.getbyoid(443)
  weatherstuff1[6] = gomgr.getbyoid(444)
  weatherstuff1[7] = gomgr.getbyoid(445)
  weatherstuff1[8] = gomgr.getbyoid(446)
  weatherstuff1[9] = gomgr.getbyoid(447)
  weatherstuff1[10] = gomgr.getbyoid(448)
  weatherstuff1[11] = gomgr.getbyoid(453)
  weatherstuff1[12] = gomgr.getbyoid(452)
  weatherstuff1[13] = gomgr.getbyoid(451)
  weatherstuff1[14] = gomgr.getbyoid(450)
  weatherstuff1[15] = gomgr.getbyoid(449)
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

function on_postload()
  weatherstuff1[1] = gomgr.getbyoid(470)
  weatherstuff1[2] = gomgr.getbyoid(471)
  weatherstuff1[3] = gomgr.getbyoid(472)
  weatherstuff1[4] = gomgr.getbyoid(473)
  weatherstuff1[5] = gomgr.getbyoid(474)
  weatherstuff1[6] = gomgr.getbyoid(475)
  weatherstuff1[7] = gomgr.getbyoid(476)
  weatherstuff1[8] = gomgr.getbyoid(477)
  weatherstuff1[9] = gomgr.getbyoid(478)
  weatherstuff1[10] = gomgr.getbyoid(479)
  weatherstuff1[11] = gomgr.getbyoid(484)
  weatherstuff1[12] = gomgr.getbyoid(483)
  weatherstuff1[13] = gomgr.getbyoid(482)
  weatherstuff1[14] = gomgr.getbyoid(481)
  weatherstuff1[15] = gomgr.getbyoid(480)
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

function on_postload()
  weatherstuff1[1] = gomgr.getbyoid(493)
  weatherstuff1[2] = gomgr.getbyoid(494)
  weatherstuff1[3] = gomgr.getbyoid(495)
  weatherstuff1[4] = gomgr.getbyoid(496)
  weatherstuff1[5] = gomgr.getbyoid(497)
  weatherstuff1[6] = gomgr.getbyoid(498)
  weatherstuff1[7] = gomgr.getbyoid(499)
  weatherstuff1[8] = gomgr.getbyoid(500)
  weatherstuff1[9] = gomgr.getbyoid(501)
  weatherstuff1[10] = gomgr.getbyoid(502)
  weatherstuff1[11] = gomgr.getbyoid(503)
  weatherstuff1[12] = gomgr.getbyoid(504)
  weatherstuff1[13] = gomgr.getbyoid(505)
  weatherstuff1[14] = gomgr.getbyoid(506)
  weatherstuff1[15] = gomgr.getbyoid(507)
  weatherstuff1[16] = gomgr.getbyoid(508)
  weatherstuff1[17] = gomgr.getbyoid(509)
  weatherstuff1[18] = gomgr.getbyoid(510)
  weatherstuff1[19] = gomgr.getbyoid(511)
  weatherstuff1[20] = gomgr.getbyoid(512)
  weatherstuff1[21] = gomgr.getbyoid(513)
  weatherstuff1[22] = gomgr.getbyoid(514)
  weatherstuff1[23] = gomgr.getbyoid(515)
  weatherstuff1[24] = gomgr.getbyoid(516)
  weatherstuff1[25] = gomgr.getbyoid(517)
  weatherstuff1[26] = gomgr.getbyoid(518)
  weatherstuff1[27] = gomgr.getbyoid(519)
  weatherstuff1[28] = gomgr.getbyoid(520)
  weatherstuff1[29] = gomgr.getbyoid(521)
  weatherstuff1[30] = gomgr.getbyoid(522)
  weatherstuff1[31] = gomgr.getbyoid(485)
  weatherstuff1[32] = gomgr.getbyoid(486)
  weatherstuff1[33] = gomgr.getbyoid(487)
  weatherstuff1[34] = gomgr.getbyoid(488)
  weatherstuff1[35] = gomgr.getbyoid(489)
  weatherstuff1[36] = gomgr.getbyoid(490)
  weatherstuff1[37] = gomgr.getbyoid(491)
  weatherstuff1[38] = gomgr.getbyoid(492)
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

function on_triggerenter(triggerobject)

  gomgr.getbyoid(548):dispatchlabel("slowdown")
