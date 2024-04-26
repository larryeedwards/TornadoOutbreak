function on_label(label)

    if label=="unlocking" then
      --                               
    end
  
    if label=="gainfocus" then
  
        if this.iscomplete then
  
          gomgr.getbyoid(345): reset()
          gomgr.getbyoid(345): start()
  --                       
  
        end
  
    end
  
    if label=="losefocus" then
        gomgr.getbyoid(345): stop()
    end
  
  end