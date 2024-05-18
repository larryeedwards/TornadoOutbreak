		polling = nil

function on_postload()

  polling = gomgr.getbyoid(1678)

end

function on_triggerenter(trigObject)
  if trigObject == gomgr.getbyoid(16) then
    polling:dispatchlabel("inrecharge")
  else
    polling:dispatchlabel("inrecharge2")
  end
end

function on_triggerexit(trigObject)
  if trigObject == gomgr.getbyoid(16) then
    polling:dispatchlabel("outrecharge")
  else
    polling:dispatchlabel("outrecharge2")
  end
end