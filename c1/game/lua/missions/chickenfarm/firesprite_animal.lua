currentFX = nil

function on_spritespawned(tornado)
   currentFX = childbyoid(448)
   currentFX:reset()
   currentFX:start()
end

function on_scalechange(scale)
	childbyoid(448).volumepercentadjustment = scale
	childbyoid(449).volumepercentadjustment = scale	
	childbyoid(448).particlesizepercentadjustment = scale
	childbyoid(449).particlesizepercentadjustment = scale
end

function on_spritegrabbed(tornado)
   if currentFX then
       currentFX:stop()
   end

   currentFX = childbyoid(449)
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

   currentFX = childbyoid(450)
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