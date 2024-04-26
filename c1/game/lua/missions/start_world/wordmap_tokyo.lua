function on_label(label)

    if label=="unlocking" then
      --                               
    end
  
    if label=="gainfocus" then
  
        if this.iscomplete then
  
          gomgr.getbyoid(348): reset()
          gomgr.getbyoid(348): start()
  --                       
  
        end
  
    end
  
    if label=="losefocus" then
        gomgr.getbyoid(348): stop()
    end
  
  end