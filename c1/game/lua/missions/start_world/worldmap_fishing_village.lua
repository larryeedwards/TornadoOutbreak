function on_label(label)

    if label=="unlocking" then
      --                               
    end
  
    if label=="gainfocus" then
  
        if this.iscomplete then
  
          gomgr.getbyoid(346): reset()
          gomgr.getbyoid(346): start()
  --                       
  
        end
  
    end
  
    if label=="losefocus" then
        gomgr.getbyoid(346): stop()
    end
  
  end