dead_totems = 0
num_totems = 0
preserve_breakstate = false

function on_death()
  if preserve_breakstate == true then
    breakstate = 0
  end
  gomgr.getbyoid(1661):dispatchlabel("weeniedead")
end

function on_postload()
--                                                                                 
  dead_totems = 0
  num_totems = 0
end

function on_bossaction(msg, player)

  if msg == "won_battle" or msg == "lost_battle" then
    --                                                           
    if msg == "won_battle" then

      dead_totems = dead_totems + 1
	  
	  --                                                                    
	  if dead_totems >= num_totems then
		return
	  else
        if dead_totems == 1 then
          gomgr.getbyoid(1664):dispatchlabel("setupapproach2")
        elseif dead_totems == 2 then
          gomgr.getbyoid(1664):dispatchlabel("setupapproach3")
        elseif dead_totems == 3 then
          gomgr.getbyoid(1664):dispatchlabel("setupapproach4")
        end

        if preserve_breakstate == true then
          breakstate = 0
		end
	  end
	end
	   
    --                                                                                      
    gomgr.getbyoid(1666):addtoworld()
    gomgr.getbyoid(1668):addtoworld()
    gomgr.getbyoid(1669):addtoworld()
    gomgr.getbyoid(1670):addtoworld()
    gomgr.getbyoid(1671):addtoworld()
    gomgr.getbyoid(1672):addtoworld()
    gomgr.getbyoid(1673):addtoworld()
    gomgr.getbyoid(1674):addtoworld()
    gomgr.getbyoid(1675):addtoworld()
    gomgr.getbyoid(1676):addtoworld()
    gomgr.getbyoid(1678):dispatchlabel("out_struggle")
	gomgr.getbyoid(450):activate()

	if msg == "won_battle" then
	  if player == 1 then
        gomgr.getbyoid(1678):dispatchlabel("zerohealth2_success")
	  else
	    gomgr.getbyoid(1678):dispatchlabel("zerohealth_success")
	  end
	else
	  if player == 1 then
	    gomgr.getbyoid(1678):dispatchlabel("zerohealth2")
	  else
		gomgr.getbyoid(1678):dispatchlabel("zerohealth")
	  end
	end

  elseif msg == "begin_battle" then
    --                                                                                            
    gomgr.getbyoid(1666):removefromworld()
    gomgr.getbyoid(1668):removefromworld()
    gomgr.getbyoid(1669):removefromworld()
    gomgr.getbyoid(1670):removefromworld()
    gomgr.getbyoid(1671):removefromworld()
    gomgr.getbyoid(1672):removefromworld()
    gomgr.getbyoid(1673):removefromworld()
    gomgr.getbyoid(1674):removefromworld()
    gomgr.getbyoid(1675):removefromworld()
    gomgr.getbyoid(1676):removefromworld()
    gomgr.getbyoid(1678):dispatchlabel("in_struggle")
	gomgr.getbyoid(450):deactivate()
  end
end