function on_atpathend()

   removefromworld()
   childbyoid(452):stop()

end

function on_label(label)
   if label=="addtoworld" then
   addtoworld()
   childbyoid(452):reset()
   childbyoid(452):start()
   end
end