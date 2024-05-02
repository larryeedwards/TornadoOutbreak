function on_label(label)

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