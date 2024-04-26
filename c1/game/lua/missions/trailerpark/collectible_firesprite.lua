      
        currentFX = nil

function on_spritespawned(tornado)
   currentFX = childbyoid(490)
   currentFX:reset()
   currentFX:start()
end

function on_scalechange(scale)
        childbyoid(490).volumepercentadjustment = scale
        childbyoid(491).volumepercentadjustment = scale  
        childbyoid(490).particlesizepercentadjustment = scale
        childbyoid(491).particlesizepercentadjustment = scale
end

function on_spritegrabbed(tornado)
   if currentFX then
       currentFX:stop()
   end

   currentFX = childbyoid(491)
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
  if tornado == gomgr.getbyoid(2921) then
    playerId = 1
  end

  tagamestats.incrementcollectible(playerId, 0)

   currentFX = childbyoid(492)
   currentFX:reset()
   currentFX:start()
end