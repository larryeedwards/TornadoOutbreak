function on_label(label)

    if label=="unlocking" then
      --                               
    end
  
    if label=="gainfocus" then
  
  
        if this.iscomplete then
          stopallanims()
          gomgr.getbyoid(344): reset()
          gomgr.getbyoid(344): start()
  --                       
        end
  
    end
  
    if label=="losefocus" then
        gomgr.getbyoid(344): stop()
    end
  
  end