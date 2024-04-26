function on_label(label)

    if label=="unlocking" then
      --                               
    end
  
    if label=="gainfocus" then
  
  
        if this.iscomplete then
          stopallanims()
          gomgr.getbyoid(341): reset()
          gomgr.getbyoid(341): start()
  --                       
        end
  
    end
  
    if label=="losefocus" then
        gomgr.getbyoid(341): stop()
    end
  
  end