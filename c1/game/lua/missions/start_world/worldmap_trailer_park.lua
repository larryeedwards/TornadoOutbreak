function on_label(label)

    if label=="unlocking" then
      --                               
    end
  
    if label=="gainfocus" then
  
  
        if this.iscomplete then
          stopallanims()
          gomgr.getbyoid(342): reset()
          gomgr.getbyoid(342): start()
  --                       
        end
  
    end
  
    if label=="losefocus" then
        gomgr.getbyoid(342): stop()
    end
  
  end