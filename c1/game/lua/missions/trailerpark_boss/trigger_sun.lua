insuntracker = nil
insuntracker2 = nil

function on_postload()

  insuntracker = gomgr.getbyoid(431)
  insuntracker2 = gomgr.getbyoid(1677)

end

function on_triggerenter(trigobject)

  if trigobject == gomgr.getbyoid(16) then
    insuntracker:dispatchlabel("safe")
  else
    insuntracker2:dispatchlabel("safe")
  end

end

function on_triggerexit(trigobject)

  if trigobject == gomgr.getbyoid(16) then
    insuntracker:dispatchlabel("unsafe")
  else
    insuntracker2:dispatchlabel("unsafe")
  end

end