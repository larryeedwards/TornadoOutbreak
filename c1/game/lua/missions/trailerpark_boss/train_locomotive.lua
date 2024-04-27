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
   gomgr.getbyoid(520):dispatchlabel("stop")
   gomgr.getbyoid(522):dispatchlabel("stop")
   gomgr.getbyoid(524):dispatchlabel("stop")
   gomgr.getbyoid(527):dispatchlabel("stop")
   gomgr.getbyoid(528):dispatchlabel("stop")
   gomgr.getbyoid(529):dispatchlabel("stop")
   gomgr.getbyoid(530):dispatchlabel("stop")
   gomgr.getbyoid(531):dispatchlabel("stop")
  end   
end 

function on_break()
  gomgr.getbyoid(518):dispatchlabel("stop")
end