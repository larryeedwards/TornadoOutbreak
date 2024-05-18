anims = {}
tracked = nil

function trackingsetup()
--                                      
--               
end

function trackstart()
  this.trackedobject = tracked
  childbyoid(339).trackedobject = tracked
end

function on_postload()
  anims[1] = "lengthA"
  anims[2] = "lengthB"
  anims[3] = "lengthC"
  anims[4] = "lengthD"
  
  trackingsetup()
end

function on_label(label)
  if label == "addtoworld" then
    addtoworld()
    childbyoid(339):addtoworld()
    randstart = math.random(1,4)
    startanim(anims[randstart])
    
  elseif label == "addtoworldconstant" then
    addtoworld()
    startanim("constant")
    
  elseif label == "removefromworld" then
    removefromworld()
    childbyoid(339):removefromworld()

  end
end

function on_animtag(animname, animtag)
  if animtag == "radius2400" then
     childbyoid(339).radius = 2400
  elseif animtag == "radius2000" then
     childbyoid(339).radius = 2000
  elseif animtag == "radius1600" then
    childbyoid(339).radius = 1600
  elseif animtag == "radius1200" then
     childbyoid(339).radius = 1200

  elseif animtag == "randomanim" then
       
     rand = math.random(1,4)
     stopallanims()
     startanim(anims[rand])

  end
end
function trackingsetup()
  tracked = gomgr.getbyoid(326)
  trackstart()
end