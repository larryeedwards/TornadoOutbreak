function on_label(label)
  if label == "setup" then
		childbyoid(108):addtoworld()
  elseif label == "found" then
		childbyoid(108):removefromworld()
  elseif (label == "show") then
		childbyoid(108):addtoworld()
  elseif (label == "hide") then
		childbyoid(108):removefromworld()
  end
  childbyoid(377):dispatchlabel(label)
end