function on_raceaction(label, addtl)
  if label == "start" then
    scale = 5.0
    startanim("flying", 0, 1, 1, 0)
    gomgr.getbyoid(4001):stop()
    gomgr.getbyoid(4001):reset()
    gomgr.getbyoid(4001):start()
    gomgr.getbyoid(4001).externalmatrix = gomgr.getbyoid(4002)
    gomgr.getbyoid(4001).particlesizepercentadjustment = 0.5
  elseif label == "stop" then
    --  
  elseif label == "firstgate" then
    scale = 5.0
  elseif label == "gearup" then
    if addtl == 1 then
      scale = 4.0
    elseif addtl == 2 then
      scale = 3.0
    elseif addtl == 3 then
      scale = 2.0
    end
  end
end

function on_atpathend()
--                                                                                        
end