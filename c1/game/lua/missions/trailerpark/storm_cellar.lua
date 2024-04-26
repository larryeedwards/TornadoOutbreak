function on_postload()
  open()
end

function on_label(label)
  if label == "triggered" then
    close()
  end

end


function on_break(break_state)
	if break_state == 1 then
		childbyoid(1340):removefromworld()
	end
end