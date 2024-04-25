function on_death(killer)

    if killer ~= nil then  
      --                  
      playerId = 0
      if killer== gomgr.getbyoid(3550) then
        playerId = 1
      end
      tagamestats.incrementcollectible(playerId, 1)
    end
  
  end