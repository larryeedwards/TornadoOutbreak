currentFX = nil

function on_spritespawned(tornado)
   currentFX = childbyoid(1683)
   currentFX:reset()
   currentFX:start()
end

function on_scalechange(scale)
	childbyoid(1683).volumepercentadjustment = scale
	childbyoid(1684).volumepercentadjustment = scale	
	childbyoid(1683).particlesizepercentadjustment = scale
	childbyoid(1684).particlesizepercentadjustment = scale
end

function on_spritegrabbed(tornado)
   if currentFX then
       currentFX:stop()
   end

   currentFX = childbyoid(1684)
   currentFX:reset()
   currentFX:start()
end

function on_spriteescaped(tornado)
	if currentFX then
	   currentFX:stop()
	end
end

function on_spritecollected(tornado)
   if currentFX then
       currentFX:stop()
   end

   currentFX = childbyoid(1685)
   currentFX:reset()
   currentFX:start()
end 

function on_label(label)
  if label == "run" then
    resetmovingalongpath()
    movingalongpath = true
    wandervelocity = 800

  elseif label == "reset" then
    addtoworld()
    resetmovingalongpath()
    movingalongpath = false

  elseif label == "remove" then
    movingalongpath = false
    removefromworld()
  end

end

function on_atpathend(path)
  movingalongpath = false
  removefromworld()
end