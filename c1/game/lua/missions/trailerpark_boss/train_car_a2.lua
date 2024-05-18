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
  end   
end 

function on_break()
  gomgr.getbyoid(518):dispatchlabel("stop")
end