function on_label(label)

    if label=="unlocking" then
      --                               
    end
  
    if label=="gainfocus" then
  
        if this.iscomplete then
  
          gomgr.getbyoid(340): reset()
          gomgr.getbyoid(340): start()
  --                       
  
        end
  
    end
  
    if label=="losefocus" then
        gomgr.getbyoid(340): stop()
    end
  
  end