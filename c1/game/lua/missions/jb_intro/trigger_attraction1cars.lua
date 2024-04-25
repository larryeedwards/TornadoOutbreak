runspeed = 1800
runners = {}

function on_postload()
  runners[1] = gomgr.getbyoid(624)
  runners[2] = gomgr.getbyoid(632)
end


function on_triggered(tornado)

  for i = 1, #runners do
    runners[i].wandervelocity = runspeed
    runners[i].alertvelocity = runspeed
    runners[i].panicvelocity = runspeed
    runspeed = runspeed - 50
    pause(0.4)
	
  end

end