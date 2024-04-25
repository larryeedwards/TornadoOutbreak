function on_postload()
    dead_totems = 0
    num_totems = 1
    preserve_breakstate = true
  end
  
  function on_death(time)
    logline("on_death")
  end
  
  function on_bossaction(msg, player)
      --                                                    
    if msg == "won_battle" then
          logline("won_battle")
          --                        
          --             
          --    
          gameplaymgr.currentgameplaymodule:dispatchlabel("weeniedead")
      end
  end
  
  function do_explode()
    logline("do_explode")
      stopallanims()
      breakstate = 1
  
      logline("explode_anim")
      startanim("explode_anim")
      logline("pause")
    pause(.8)
  --                                              
  --                                              
  --                                              
  --                                              
      childbyoid(418).breakstate = 2
      childbyoid(417):reset()
      childbyoid(417):start()
   
    pause(4)
      childbyoid(426):reset()
      childbyoid(426):start()
  
    pause(1)
      childbyoid(427):reset()
      childbyoid(427):start()
  
    pause(1.2)
      childbyoid(428):reset()
      childbyoid(428):start()
  
    pause(1)
      childbyoid(426):stop()
  
    pause(1)
      childbyoid(427):stop()
  end
  
  
  function on_label(label)
  
    if label == "reset" then
      stopallanims()
      startanim("idle")
      breakstate = 0
      
    elseif label == "blowitup" then
      do_explode()
  
    end
    
  end
  
  function on_animtag(animname, animtag)
  
    if animtag == "stopanims" then
      breakstate = 2
      stopallanims()
      startanim("dead_anim")
    end
    
  end
--
function on_bossaction(msg, player)
    if msg == "begin_battle" then
      gameplaymgr.currentgameplaymodule:dispatchlabel("begin_battle")
    elseif msg == "lost_battle" then
      gomgr.getbyoid(16).currenthealth = 5
      gomgr.getbyoid(3550).currenthealth = 5
    end
    super.on_bossaction(msg, player)
  end