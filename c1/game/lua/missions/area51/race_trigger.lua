function setgear_fx(gear)
  if gear >= 0 then
    childbyoid(3152):reset()
    childbyoid(3152):start()
    childbyoid(3153):reset()
    childbyoid(3153):start()
  else
    childbyoid(3152):stop()
    childbyoid(3153):stop()
  end

  if gear >= 1 then
    childbyoid(3154):reset()
    childbyoid(3154):start()
    childbyoid(3155):reset()
    childbyoid(3155):start()
  else
    childbyoid(3154):stop()
    childbyoid(3155):stop()
  end

  if gear >= 2 then
    childbyoid(3156):reset()
    childbyoid(3156):start()
    childbyoid(3157):reset()
    childbyoid(3157):start()
  else
    childbyoid(3156):stop()
    childbyoid(3157):stop()
  end
end

function stopgearfx()
  childbyoid(3152):hardstop()
  childbyoid(3152):reset()
  childbyoid(3153):hardstop()
  childbyoid(3153):reset()
  childbyoid(3154):hardstop()
  childbyoid(3154):reset()
  childbyoid(3155):hardstop()
  childbyoid(3155):reset()
  childbyoid(3156):hardstop()
  childbyoid(3156):reset()
  childbyoid(3157):hardstop()
  childbyoid(3157):reset()
end

function setgear_mesh(gear)
  if gear >= 0 then
    childbyoid(3148):setvisiblefromatomid(2900, true)
  else
    childbyoid(3148):setvisiblefromatomid(2900, false)
  end

  if gear >= 1 then
    childbyoid(3148):setvisiblefromatomid(2901, true)
  else
    childbyoid(3148):setvisiblefromatomid(2901, false)
  end

  if gear >= 2 then
    childbyoid(3148):setvisiblefromatomid(2902, true)
  else
    childbyoid(3148):setvisiblefromatomid(2902, false)
  end
end

function flare_fx(gear)
  if gear >= 0 then
    childbyoid(3158):reset()
    childbyoid(3158):start()
    childbyoid(3159):reset()
    childbyoid(3159):start()
  end

  if gear >= 1 then
    childbyoid(3160):reset()
    childbyoid(3160):start()
    childbyoid(3161):reset()
    childbyoid(3161):start()
  end

  if gear >= 2 then
    childbyoid(3162):reset()
    childbyoid(3162):start()
    childbyoid(3163):reset()
    childbyoid(3163):start()
  end
end

function stopallfx()
  childbyoid(3158):hardstop()
  childbyoid(3158):reset()
  childbyoid(3159):hardstop()
  childbyoid(3159):reset()
  childbyoid(3160):hardstop()
  childbyoid(3160):reset()
  childbyoid(3161):hardstop()
  childbyoid(3161):reset()
  childbyoid(3162):hardstop()
  childbyoid(3162):reset()
  childbyoid(3163):hardstop()
  childbyoid(3163):reset()
  childbyoid(3146):hardstop()
  childbyoid(3146):reset()
  childbyoid(3147):hardstop()
  childbyoid(3147):reset()
end

function on_raceaction(label, gear)
  if label == "setgear" then
--                       
  elseif label == "gatedestroyed" then
    childbyoid(3164):reset()
    childbyoid(3164):start()
    childbyoid(3164).particlesizepercentadjustment = 3.0
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