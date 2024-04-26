		function on_break(breakstate)
  if (breakstate > 2) then
    --                     
      gomgr.getbyoid(2604).wandervelocity = 0
      gomgr.getbyoid(2604).panicvelocity  = 0
      gomgr.getbyoid(2615).wandervelocity = 0
      gomgr.getbyoid(2615).panicvelocity  = 0
  end
end