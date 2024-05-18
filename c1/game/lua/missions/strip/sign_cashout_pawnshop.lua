function on_triggerenter(trigobject)

  if trigobject == gomgr.getbyoid(16) then
    if gomgr.getbyoid(16):fujrating() >= 2 then
      parent:childbyoid(2373):addtoworld()
    end
  else
    if gomgr.getbyoid(3970):fujrating() >= 3 then
      parent:childbyoid(2373):addtoworld()
    end
  end

end

function on_triggerexit(trigobject)

  parent:childbyoid(2373):removefromworld()

end