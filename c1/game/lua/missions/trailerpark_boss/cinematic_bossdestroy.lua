realcine = false

function on_gameplaymoduleactive()
  realcine = true
  engine.pushmode(1)

  beginwait()
    cinematic.play("cine_bossdestroy")
  endwait()

  pause(1)
  requestcomplete(true)
end

function on_label(label)

  if label == "cinematic_start" then

    tagamestats.unlockaward(0, 1)

   gomgr.getbyoid(16):setfujitarating(0.1)
   gomgr.getbyoid(16):warp(gomgr.getbyoid(208))
   gomgr.getbyoid(482):addtoworld()

   gomgr.getbyoid(1666):removefromworld()
   gomgr.getbyoid(1668):removefromworld()
   gomgr.getbyoid(1669):removefromworld()
   gomgr.getbyoid(1670):removefromworld()
   gomgr.getbyoid(1671):removefromworld()

    if realcine == false then
      gomgr.getbyoid(441):removefromworld()
      gomgr.getbyoid(441):childbyoid(152):stop()
      gomgr.getbyoid(441):childbyoid(151):stop()
      gomgr.getbyoid(446):removefromworld()
      gomgr.getbyoid(446):childbyoid(152):stop()
      gomgr.getbyoid(446):childbyoid(151):stop()
      gomgr.getbyoid(447):removefromworld()
      gomgr.getbyoid(447):childbyoid(152):stop()
      gomgr.getbyoid(447):childbyoid(151):stop()
      gomgr.getbyoid(432):dispatchlabel("reset")
      gomgr.getbyoid(448):dispatchlabel("add")
      gomgr.getbyoid(449):dispatchlabel("add")
    end

 elseif label == "cinematic_explode" then
   gomgr.getbyoid(270):dispatchlabel("blowitup")
   gomgr.getbyoid(432):postaudioevent("PLAY_BOSS_FINISH_FOCUS_DESTROYED")
   gomgr.getbyoid(299):dispatchlabel("weatherphase1")
   gomgr.getbyoid(1665):dispatchlabel("clear")
   gomgr.getbyoid(432):postaudioevent("PLAY_BOSS_FINISH_CLOSE_PORTAL")
   gomgr.getbyoid(448):dispatchlabel("add")
   gomgr.getbyoid(449):dispatchlabel("add")
   gomgr.getbyoid(482):startanim("talking", 0.0, 1.0, 1.0, 0)

  elseif label == "cinematic_calming" then
    gomgr.getbyoid(448):dispatchlabel("rise")
    gomgr.getbyoid(449):dispatchlabel("rise")
    audio.postevent("LOOP_BOSS_FINISH_STORM_CALMING")

  elseif label == "cinematic_at_end" then
    if realcine == false then
      fadeout()
    end
 end

end

function fadeout()
  cameramgr.screenfade(0, 0.1, 0.25, 1.5)
    pause(0.15)
end