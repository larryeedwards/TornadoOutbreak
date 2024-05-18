function on_label(label)
 if label == "start2000" then
   panicvelocity = 2000
   alertvelocity = 2000
   wandervelocity = 2000
 end
 if label == "stop" then
   panicvelocity = 0
   alertvelocity = 0
   wandervelocity =0 
   gomgr.getbyoid(533):dispatchlabel("stop")
   gomgr.getbyoid(534):dispatchlabel("stop")
   gomgr.getbyoid(535):dispatchlabel("stop")
   gomgr.getbyoid(536):dispatchlabel("stop")
   gomgr.getbyoid(537):dispatchlabel("stop")
   gomgr.getbyoid(538):dispatchlabel("stop")
   gomgr.getbyoid(539):dispatchlabel("stop")
   gomgr.getbyoid(540):dispatchlabel("stop")
  end 
end 

function on_break()
  gomgr.getbyoid(532):dispatchlabel("stop")
end