function on_label(label)
  if label == "doit" then
    zoom = 75
    for i = 1, 1000 do
      zoom = zoom + 1
      cameramgr.orbitoffsetz = 500 + zoom * i
      pause(0.02)
    end
  end
end
