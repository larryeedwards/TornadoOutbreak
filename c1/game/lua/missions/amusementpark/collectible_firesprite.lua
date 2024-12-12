        currentFX = nil

function on_spritespawned(tornado)
   currentFX = childbyoid(550)
   currentFX:reset()
   currentFX:start()
end

function on_scalechange(scale)
        childbyoid(550).volumepercentadjustment = scale
        childbyoid(551).volumepercentadjustment = scale  
        childbyoid(550).particlesizepercentadjustment = scale
        childbyoid(551).particlesizepercentadjustment = scale
end

function on_spritegrabbed(tornado)
   if currentFX then
       currentFX:stop()
   end

   currentFX = childbyoid(551)
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

  --                  
  playerId = 0
  if tornado == gomgr.getbyoid(3786) then
    playerId = 1
  end

  tagamestats.incrementcollectible(playerId, 0)

   currentFX = childbyoid(552)
   currentFX:reset()
   currentFX:start()
end