function on_postload()
    childbyoid(3883).externalgroundmatrix = this
end

--                                                                           
 
emmisionstart = 1
partsizestart = 1.0
ringstart = 1.0
ringend = 0
steps = 60

function on_timer(name,count)
  if name=='ringshrink' then
    local radiusadj= ringstart * grabdurationleft/grabdurationmax
    childbyoid(3883).volumepercentadjustment= radiusadj
  end
end

function on_initiategrab()

  fujita = this.fujitarating

   if fujita >= 4.2 then
     ringstart = 26.75
     partsizestart = 6
     emmisionstart = 4
   elseif fujita >= 4.1 then
     ringstart = 25.36
     partsizestart = 6
     emmisionstart = 3.25
   elseif fujita >= 4.0 then
     ringstart = 23.98
     partsizestart = 6
     emmisionstart = 2.75
   elseif fujita >= 3.8 then
     ringstart = 18.24
     partsizestart = 5
     emmisionstart = 2.5
   elseif fujita >= 3.6 then
     ringstart = 16.13
     partsizestart = 5
     emmisionstart = 2.5
   elseif fujita >= 3.4 then
     ringstart = 14.03
     partsizestart = 4.5
     emmisionstart = 2.25
   elseif fujita >= 3.2 then
     ringstart = 11.92
     partsizestart = 4.5
     emmisionstart = 2.25
   elseif fujita >= 3.0 then
     ringstart = 9.83
     partsizestart = 3.5
     emmisionstart = 2
   elseif fujita >= 2.66 then
     ringstart = 6.55
     partsizestart = 2.5
     emmisionstart = 2
   elseif fujita >= 2.33 then
     ringstart = 5.36
     partsizestart = 2
     emmisionstart = 1.75
   elseif fujita >= 2.0 then
     ringstart = 4.17
     partsizestart = 1.75
     emmisionstart = 1.75
   elseif fujita >= 1.66 then
     ringstart = 2.96
     partsizestart = 1.5
     emmisionstart = 1.3
   elseif fujita >= 1.33 then
     ringstart = 2.39
     partsizestart = 1.35
     emmisionstart = 1
   elseif fujita >= 1.0 then
     ringstart = 1.82
     partsizestart = 1.25
     emmisionstart = 1
   elseif fujita >= 0.5 then
     ringstart = 1
     partsizestart = 1
     emmisionstart = 1
   else
     ringstart = .5
     partsizestart = 1
     emmisionstart = 1
   end

   childbyoid(3883):reset()
   childbyoid(3883):start()
   steps = grabdurationmax/.1
   settimer('ringshrink',.1,steps)
   childbyoid(3883).volumepercentadjustment= ringstart
   childbyoid(3883).particlesizepercentadjustment= partsizestart
   childbyoid(3883).emissionpercentadjustment= emmisionstart

--                                                           

end

function on_refreshgrab()

   childbyoid(3883):stop()
   on_initiategrab()


end

function on_cleanupspritegrab()
   childbyoid(3883):hardstop()
end

function on_cashgrabbedsprites(numsprites)

   on_cleanupspritegrab();
   childbyoid(3882):reset()
   childbyoid(3882):start()
--                                                            

end


function startshieldfx()

  childbyoid(3968):reset()
  childbyoid(3968):start()

end

function stopshieldfx()

     childbyoid(3969):reset()
     childbyoid(3969):start()

end

function on_shieldaction(addtl)
  if addtl == "activate" then
    startshieldfx()
  elseif addtl == "deactivate" then
    stopshieldfx()
  end
end

function on_tornadorankchanged(tornado, oldrank, newrank)
	fujita = this.fujitarating
	local dirtringstart = .5
    local dirtpartsizestart = 1
    local dirtemmisionstart = 1
   if fujita >= 4.2 then
     dirtringstart = 5
     dirtpartsizestart = 2
     dirtemmisionstart = 7
   elseif fujita >= 4.1 then
     dirtringstart = 4.5
     dirtpartsizestart = 2
     dirtemmisionstart = 6.5
   elseif fujita >= 4.0 then
     dirtringstart = 4
     dirtpartsizestart = 2
     dirtemmisionstart = 6
   elseif fujita >= 3.8 then
     dirtringstart = 3.5
     dirtpartsizestart = 2
     dirtemmisionstart = 5.5
   elseif fujita >= 3.6 then
     dirtringstart = 3
     dirtpartsizestart = 2
     dirtemmisionstart = 5
   elseif fujita >= 3.4 then
     dirtringstart = 2.5
     dirtpartsizestart = 2
     dirtemmisionstart = 4.5
   elseif fujita >= 3.2 then
     dirtringstart = 2.25
     dirtpartsizestart = 2
     dirtemmisionstart = 4
   elseif fujita >= 3.0 then
     dirtringstart = 2
     dirtpartsizestart = 1.75
     dirtemmisionstart = 3.75
   elseif fujita >= 2.66 then
     dirtringstart = 1.75
     dirtpartsizestart = 1.75
     dirtemmisionstart = 3.5
   elseif fujita >= 2.33 then
     dirtringstart = 1.5
     dirtpartsizestart = 1.5
     dirtemmisionstart = 2.75
   elseif fujita >= 2.0 then
     dirtringstart = 1.25
     dirtpartsizestart = 1.5
     dirtemmisionstart = 2.25
   elseif fujita >= 1.66 then
     dirtringstart = 1
     dirtpartsizestart = 1.25
     dirtemmisionstart = 2
   elseif fujita >= 1.33 then
     dirtringstart = 1
     dirtpartsizestart = 1.25
     dirtemmisionstart = 1.75
   elseif fujita >= 1.0 then
     dirtringstart = 1
     dirtpartsizestart = 1
     dirtemmisionstart = 1
   elseif fujita >= 0.5 then
     dirtringstart = 1
     dirtpartsizestart = 1
     dirtemmisionstart = 1
   else
     dirtringstart = .5
     dirtpartsizestart = 1
     dirtemmisionstart = 1
   end

   childbyoid(3965).volumepercentadjustment= dirtringstart
   childbyoid(3965).particlesizepercentadjustment= dirtpartsizestart
   childbyoid(3965).emissionpercentadjustment= dirtemmisionstart

end