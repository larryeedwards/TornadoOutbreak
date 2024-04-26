function on_label(label)
  if label == "up" then
    stopallanims()
    startanim("up", 0, 1, 1, 1)
    pause(4)
    stopallanims()
    startanim("stayup")
  end
end