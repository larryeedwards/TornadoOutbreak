function underconstruction_exit()
	beginwait()
		uimgr.playhint(1605)
	endwait()
	world.exitworld(0)
end                                 
--                                                 
function on_gameplaymoduleactive()
  requestcomplete(true)
end