function on_bossaction(msg)
  if msg == "launched" then
    childbyoid(452):reset()
    childbyoid(452):start()
  elseif msg == "landed" then
    childbyoid(452):stop()
  end
end