function on_timer(name, count)
    if count % 2 == 0 then 
       setvisiblefromatomid(3510, true)
       setvisiblefromatomid(3509, false)
    else
       setvisiblefromatomid(3510, false)
       setvisiblefromatomid(3509, true)
 
    end
 end
 
 
 function on_label(label)
 
   if label=="unlocking" then
     --                               
   end
 
   if label=="gainfocus" then
 
 
       if this.iscomplete then
         stopallanims()
         gomgr.getbyoid(343): reset()
         gomgr.getbyoid(343): start()
         setvisiblefromatomid(3510, false)
         setvisiblefromatomid(3509, false)
 --                       
       end
 
   end
 
   if label=="losefocus" then
       gomgr.getbyoid(343): stop()
   end
 
 end