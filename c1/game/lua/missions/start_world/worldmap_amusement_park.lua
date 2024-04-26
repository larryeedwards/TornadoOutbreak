function on_label(label)

    if label=="unlocking" then
      --                               
    end
  
    if label=="gainfocus" then
  
  
        if this.iscomplete then
          stopallanims()
          gomgr.getbyoid(349): reset()
          gomgr.getbyoid(349): start()
  --                       
        end
  
    end
  
    if label=="losefocus" then
        gomgr.getbyoid(349): stop()
    end
  
  end