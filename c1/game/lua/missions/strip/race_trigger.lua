function setgear_fx(gear)
  if gear >= 0 then
    childbyoid(405):reset()
    childbyoid(405):start()
    childbyoid(406):reset()
    childbyoid(406):start()
  else
    childbyoid(405):stop()
    childbyoid(406):stop()
  end

  if gear >= 1 then
    childbyoid(407):reset()
    childbyoid(407):start()
    childbyoid(408):reset()
    childbyoid(408):start()
  else
    childbyoid(407):stop()
    childbyoid(408):stop()
  end

  if gear >= 2 then
    childbyoid(409):reset()
    childbyoid(409):start()
    childbyoid(410):reset()
    childbyoid(410):start()
  else
    childbyoid(409):stop()
    childbyoid(410):stop()
  end
end

function stopgearfx()
  childbyoid(405):hardstop()
  childbyoid(405):reset()
  childbyoid(406):hardstop()
  childbyoid(406):reset()
  childbyoid(407):hardstop()
  childbyoid(407):reset()
  childbyoid(408):hardstop()
  childbyoid(408):reset()
  childbyoid(409):hardstop()
  childbyoid(409):reset()
  childbyoid(410):hardstop()
  childbyoid(410):reset()
end

function setgear_mesh(gear)
  if gear >= 0 then
    childbyoid(401):setvisiblefromatomid(1961, true)
  else
    childbyoid(401):setvisiblefromatomid(1961, false)
  end

  if gear >= 1 then
    childbyoid(401):setvisiblefromatomid(1962, true)
  else
    childbyoid(401):setvisiblefromatomid(1962, false)
  end

  if gear >= 2 then
    childbyoid(401):setvisiblefromatomid(1963, true)
  else
    childbyoid(401):setvisiblefromatomid(1963, false)
  end
end

function flare_fx(gear)
  if gear >= 0 then
    childbyoid(411):reset()
    childbyoid(411):start()
    childbyoid(412):reset()
    childbyoid(412):start()
  end

  if gear >= 1 then
    childbyoid(413):reset()
    childbyoid(413):start()
    childbyoid(414):reset()
    childbyoid(414):start()
  end

  if gear >= 2 then
    childbyoid(415):reset()
    childbyoid(415):start()
    childbyoid(416):reset()
    childbyoid(416):start()
  end
end

function stopallfx()
  childbyoid(411):hardstop()
  childbyoid(411):reset()
  childbyoid(412):hardstop()
  childbyoid(412):reset()
  childbyoid(413):hardstop()
  childbyoid(413):reset()
  childbyoid(414):hardstop()
  childbyoid(414):reset()
  childbyoid(415):hardstop()
  childbyoid(415):reset()
  childbyoid(416):hardstop()
  childbyoid(416):reset()
  childbyoid(399):hardstop()
  childbyoid(399):reset()
  childbyoid(400):hardstop()
  childbyoid(400):reset()
end

function on_raceaction(label, gear)
  if label == "setgear" then
--                       
  elseif label == "gatedestroyed" then
    childbyoid(417):reset()
    childbyoid(417):start()
    childbyoid(417).particlesizepercentadjustment = 3.0
  elseif label == "activategearfx" then
    setgear_fx(gear)
  elseif label == "activateflarefx" then
    flare_fx(gear)
  elseif label == "stopgearfx" then
    stopgearfx()
  elseif label == "stopallfx" then
    stopallfx()
  end
end