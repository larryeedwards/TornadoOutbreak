function setgear_fx(gear)
  if gear >= 0 then
    childbyoid(293):reset()
    childbyoid(293):start()
    childbyoid(294):reset()
    childbyoid(294):start()
  else
    childbyoid(293):stop()
    childbyoid(294):stop()
  end

  if gear >= 1 then
    childbyoid(295):reset()
    childbyoid(295):start()
    childbyoid(296):reset()
    childbyoid(296):start()
  else
    childbyoid(295):stop()
    childbyoid(296):stop()
  end

  if gear >= 2 then
    childbyoid(297):reset()
    childbyoid(297):start()
    childbyoid(298):reset()
    childbyoid(298):start()
  else
    childbyoid(297):stop()
    childbyoid(298):stop()
  end
end

function stopgearfx()
  childbyoid(293):hardstop()
  childbyoid(293):reset()
  childbyoid(294):hardstop()
  childbyoid(294):reset()
  childbyoid(295):hardstop()
  childbyoid(295):reset()
  childbyoid(296):hardstop()
  childbyoid(296):reset()
  childbyoid(297):hardstop()
  childbyoid(297):reset()
  childbyoid(298):hardstop()
  childbyoid(298):reset()
end

function setgear_mesh(gear)
  if gear >= 0 then
    childbyoid(289):setvisiblefromatomid(1959, true)
  else
    childbyoid(289):setvisiblefromatomid(1959, false)
  end

  if gear >= 1 then
    childbyoid(289):setvisiblefromatomid(1960, true)
  else
    childbyoid(289):setvisiblefromatomid(1960, false)
  end

  if gear >= 2 then
    childbyoid(289):setvisiblefromatomid(1961, true)
  else
    childbyoid(289):setvisiblefromatomid(1961, false)
  end
end

function flare_fx(gear)
  if gear >= 0 then
    childbyoid(299):reset()
    childbyoid(299):start()
    childbyoid(300):reset()
    childbyoid(300):start()
  end

  if gear >= 1 then
    childbyoid(301):reset()
    childbyoid(301):start()
    childbyoid(302):reset()
    childbyoid(302):start()
  end

  if gear >= 2 then
    childbyoid(303):reset()
    childbyoid(303):start()
    childbyoid(304):reset()
    childbyoid(304):start()
  end
end

function stopallfx()
  childbyoid(299):hardstop()
  childbyoid(299):reset()
  childbyoid(300):hardstop()
  childbyoid(300):reset()
  childbyoid(301):hardstop()
  childbyoid(301):reset()
  childbyoid(302):hardstop()
  childbyoid(302):reset()
  childbyoid(303):hardstop()
  childbyoid(303):reset()
  childbyoid(304):hardstop()
  childbyoid(304):reset()
  childbyoid(287):hardstop()
  childbyoid(287):reset()
  childbyoid(288):hardstop()
  childbyoid(288):reset()
end

function on_raceaction(label, gear)
  if label == "setgear" then
--                       
  elseif label == "gatedestroyed" then
    childbyoid(305):reset()
    childbyoid(305):start()
    childbyoid(305).particlesizepercentadjustment = 3.0
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