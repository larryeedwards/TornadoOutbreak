function add_gate(gate)
  gate:addtoworld()
  gate:childbyoid(3148):addtoworld()
  gate:lowergate(10000, 0.5)
  pause(0.1)
  gate:activateshockwave()
end

function on_label(label)
  if label == "doit" then
    pause(2)
    add_gate(gomgr.getbyoid(3174))
    add_gate(gomgr.getbyoid(3175))
    add_gate(gomgr.getbyoid(3176))
    add_gate(gomgr.getbyoid(3177))
    add_gate(gomgr.getbyoid(3178))
    add_gate(gomgr.getbyoid(3179))
    add_gate(gomgr.getbyoid(3180))
    add_gate(gomgr.getbyoid(3181))
    add_gate(gomgr.getbyoid(3182))
    add_gate(gomgr.getbyoid(3183))
    add_gate(gomgr.getbyoid(3184))
    add_gate(gomgr.getbyoid(3185))
    add_gate(gomgr.getbyoid(3186))
    add_gate(gomgr.getbyoid(3187))
    add_gate(gomgr.getbyoid(3188))
    add_gate(gomgr.getbyoid(3189))
    add_gate(gomgr.getbyoid(3190))
    add_gate(gomgr.getbyoid(3191))
    add_gate(gomgr.getbyoid(3192))
    add_gate(gomgr.getbyoid(3193))
    add_gate(gomgr.getbyoid(3144))
    add_gate(gomgr.getbyoid(3165))
    add_gate(gomgr.getbyoid(3166))
    add_gate(gomgr.getbyoid(3167))
    add_gate(gomgr.getbyoid(3168))
    add_gate(gomgr.getbyoid(3169))
    add_gate(gomgr.getbyoid(3170))
    add_gate(gomgr.getbyoid(3171))
    add_gate(gomgr.getbyoid(3172))
    add_gate(gomgr.getbyoid(3173))
  end       
end