function on_postload()
    --                                                         
        matchingwatersprite = gomgr.getbyoid(471)
        cameravolume = gomgr.getbyoid(278)
        cameravolume.fixedazimuthobj = this
 --       
function on_collected()
    childbyoid(468):removefromworld()
  stopallanims()
  beginwait()
      startanimandwait("dive")
      childbyoid(470):reset()
      childbyoid(470):start()
      childbyoid(469):reset()
      childbyoid(469):start()
  endwait()
  if (isavailableforminigame()) then
     return
  end
  removefromworld()
end

function on_death()
  if cameravolume ~= nil then
      cameravolume:removefromworld()
  end

  if matchingwatersprite ~= nil then
      matchingwatersprite:childbyoid(468):removefromworld()
      matchingwatersprite:removefromworld()
  end
  childbyoid(468):removefromworld()
end

function on_watersprintprep()
    childbyoid(468):removefromworld()
  stopallanims()
  beginwait()
      startanimandwait("dash_intro")
  endwait()
  startanim("dash")
end

function on_watersprintfail()
    childbyoid(468):addtoworld()
  stopallanims()
  startanim("idle")
  resetforwatersprint()
end

function on_label(label)
  if (label == "addbubble") then
      childbyoid(468):addtoworld()
  elseif (label == "removebubble") then
      childbyoid(468):removefromworld()
  end
end