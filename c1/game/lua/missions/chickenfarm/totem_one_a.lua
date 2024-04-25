if label == "rise" then
    addtoworld()
    stopallanims()
    startanim(0, "totem_rise_anim")
    postaudioevent("PLAY_BOSS_SETUP_TOTEM_APPEARING")
	
    --                              
    --                         
  elseif label == "remove" then
    stopallanims()
    childbyoid(430):stop()
    removefromworld()
    childbyoid(431):hardstop()
    childbyoid(433):hardstop()
  end

end

function on_bossaction(msg, addtl)
  if msg == "shaking" then
    if addtl == 1 then
      childbyoid(431):reset()
      childbyoid(431):start()
      childbyoid(433):reset()
      childbyoid(433):start()
    end
  elseif msg == "endshake" then
    if addtl == 1 then
      childbyoid(431):hardstop()
      childbyoid(433):hardstop()
    end
  end
end


function on_animtag(animname, animtag)

  if animtag == "lava" then
    childbyoid(432):reset()
    childbyoid(432):start()

  elseif animtag == "lightup" then
    childbyoid(430):reset()
    childbyoid(430):start()

  elseif animtag == "risen" then
    stopallanims()
    childbyoid(432):stop()
    startanim(0, "risen_anim") 
  end
  
end