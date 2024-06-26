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

  --                  
  playerId = 0
  if tornado == gomgr.getbyoid(3550) then
    playerId = 1
  end

  tagamestats.incrementcollectible(playerId, 0)

   currentFX = childbyoid(450)
   currentFX:reset()
   currentFX:start()
end