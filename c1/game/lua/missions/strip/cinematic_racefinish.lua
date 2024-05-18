realfinish = false

function on_gameplaymoduleactive()
  realfinish = true
  beginwait()
    cinematic.play("cine_racefinish")
  endwait()
  requestcomplete(true)
end

function on_label(label)

  if label == "cinematic_start" then
    addstormendfx()
    
  end
end

function addstormendfx()
    --                
    gomgr.getbyoid(542):addtoworld()
    gomgr.getbyoid(537):addtoworld()
    gomgr.getbyoid(535):addtoworld()

    gomgr.getbyoid(243):removefromworld()
    
--                                                    
--                                                    
--                                                  

    gomgr.getbyoid(546):addtoworld()
    gomgr.getbyoid(546):childbyoid(547):reset()
    gomgr.getbyoid(546):childbyoid(547):start()
    gomgr.getbyoid(545):addtoworld()
end