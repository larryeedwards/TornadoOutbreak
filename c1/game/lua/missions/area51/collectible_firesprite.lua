      
        currentFX = nil

function on_spritespawned(tornado)
   currentFX = childbyoid(3371)
   currentFX:reset()
   currentFX:start()
end

function on_scalechange(scale)
        childbyoid(3371).volumepercentadjustment = scale
        childbyoid(3372).volumepercentadjustment = scale  
        childbyoid(3371).particlesizepercentadjustment = scale
        childbyoid(3372).particlesizepercentadjustment = scale
end

function on_spritegrabbed(tornado)
   if currentFX then
       currentFX:stop()
   end

   currentFX = childbyoid(3372)
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
  if tornado == gomgr.getbyoid(3556) then
    playerId = 1
  end

  tagamestats.incrementcollectible(playerId, 0)

   currentFX = childbyoid(3373)
   currentFX:reset()
   currentFX:start()
end