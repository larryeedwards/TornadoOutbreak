function on_bossaction(msg, addtl)
  if msg == "shaking" then
    if addtl == 0 then
      childbyoid(442):reset()
      childbyoid(442):start()
      childbyoid(443):reset()
      childbyoid(443):start()
    elseif addtl == 2 then
      childbyoid(444):reset()
      childbyoid(444):start()
      childbyoid(445):reset()
      childbyoid(445):start()
    end
  elseif msg == "endshake" then
    if addtl == 0 then
      childbyoid(442):hardstop()
      childbyoid(443):hardstop()
    elseif addtl == 2 then
      childbyoid(444):hardstop()
      childbyoid(445):hardstop()
    end
  end
end