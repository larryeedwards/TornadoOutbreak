dead_totems = 0
num_totems = 0
preserve_breakstate = false

function on_death()
  if preserve_breakstate == true then
    breakstate = 0
  end
  gomgr.getbyoid(209):dispatchlabel("weeniedead")
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
          gomgr.getbyoid(3583):dispatchlabel("setupapproach2")
        elseif dead_totems == 2 then
          gomgr.getbyoid(3583):dispatchlabel("setupapproach3")
        elseif dead_totems == 3 then
          gomgr.getbyoid(3583):dispatchlabel("setupapproach4")
        end

        if preserve_breakstate == true then
          breakstate = 0
		end
	  end
	end
	   
    --                                                                                      
    gomgr.getbyoid(3584):addtoworld()
    gomgr.getbyoid(3586):addtoworld()
    gomgr.getbyoid(3587):addtoworld()
    gomgr.getbyoid(3588):addtoworld()
    gomgr.getbyoid(3589):addtoworld()
    gomgr.getbyoid(3590):addtoworld()
    gomgr.getbyoid(3591):addtoworld()
    gomgr.getbyoid(3592):addtoworld()
    gomgr.getbyoid(3593):addtoworld()
    gomgr.getbyoid(3594):addtoworld()
    gomgr.getbyoid(3596):dispatchlabel("out_struggle")
	gomgr.getbyoid(208):activate()

	if msg == "won_battle" then
	  if player == 1 then
        gomgr.getbyoid(3596):dispatchlabel("zerohealth2_success")
	  else
	    gomgr.getbyoid(3596):dispatchlabel("zerohealth_success")
	  end
	else
	  if player == 1 then
	    gomgr.getbyoid(3596):dispatchlabel("zerohealth2")
	  else
		gomgr.getbyoid(3596):dispatchlabel("zerohealth")
	  end
	end

  elseif msg == "begin_battle" then
    --                                                                                            
    gomgr.getbyoid(3584):removefromworld()
    gomgr.getbyoid(3586):removefromworld()
    gomgr.getbyoid(3587):removefromworld()
    gomgr.getbyoid(3588):removefromworld()
    gomgr.getbyoid(3589):removefromworld()
    gomgr.getbyoid(3590):removefromworld()
    gomgr.getbyoid(3591):removefromworld()
    gomgr.getbyoid(3592):removefromworld()
    gomgr.getbyoid(3593):removefromworld()
    gomgr.getbyoid(3594):removefromworld()
    gomgr.getbyoid(3596):dispatchlabel("in_struggle")
	gomgr.getbyoid(208):deactivate()
  end
end