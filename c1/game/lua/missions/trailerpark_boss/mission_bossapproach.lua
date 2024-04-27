function on_label(label)

  if label == "setupapproach1" then
    gomgr.getbyoid(432).knockbacktarget = gomgr.getbyoid(298)
    setupapproach1()

  elseif label == "setupapproach2" then
    audio.postevent("PLAY_BOSS_APPROACH_SHADOW_TRANSITION")
    gomgr.getbyoid(1665):dispatchlabel("shadowwithlightsB")
  elseif label == "setupapproach3" then
    audio.postevent("PLAY_BOSS_APPROACH_SHADOW_TRANSITION")
    gomgr.getbyoid(1665):dispatchlabel("shadowwithlightsC")

  elseif label == "weeniedead" then
    endmission(true)

  end

end

function setupapproach1()

--                                       

--         
  gomgr.getbyoid(16).isdisplayinghealth = true
  gomgr.getbyoid(16).currenthealth = 5

--         
  gomgr.getbyoid(1639).isdisplayinghealth = true
  gomgr.getbyoid(1639).currenthealth = 5

--                                                 

  gomgr.getbyoid(1665):dispatchlabel("shadowwithlightsA")

  gomgr.getbyoid(461):addtoworld()
  gomgr.getbyoid(462):addtoworld()
  gomgr.getbyoid(463):addtoworld()
  gomgr.getbyoid(464):addtoworld()
  gomgr.getbyoid(465):addtoworld()
  gomgr.getbyoid(466):addtoworld()
  gomgr.getbyoid(467):addtoworld()
  gomgr.getbyoid(468):addtoworld()
  gomgr.getbyoid(469):addtoworld()
  gomgr.getbyoid(470):addtoworld()
  gomgr.getbyoid(471):addtoworld()
  gomgr.getbyoid(472):addtoworld()
  gomgr.getbyoid(473):addtoworld()
  gomgr.getbyoid(474):addtoworld()
  gomgr.getbyoid(475):addtoworld()
  gomgr.getbyoid(476):addtoworld()
  gomgr.getbyoid(477):addtoworld()
  gomgr.getbyoid(478):addtoworld()
  gomgr.getbyoid(479):addtoworld()
  gomgr.getbyoid(480):addtoworld()

--                                                  

end