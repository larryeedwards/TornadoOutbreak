g_savedlightdata = {}
g_white = rgb(255,255,255)
g_dark = rgb(1,1,1)
g_lightgos = {}

function getgosbyclasses(i_classlist, i_includeonlyinworld)
  lightlist = {}

  for i, classname in pairs(i_classlist) do
     go = gomgr.findfirstbyclass(classname, false)
     while (go ~= nil) do
        lightlist[#lightlist+1] = go
        go = gomgr.findnextbyclass(go)
     end
  end

 return lightlist
end

function getlightlist(i_includedirlights, i_includespotlights, i_includeplayerlights)
  lightclasses = {}
  if (i_includedirlights) then
     lightclasses[#lightclasses+1] = "CGoDirLight"
  end

  if (i_includespotlights) then
     lightclasses[#lightclasses+1] = "CGoSpotLight"
  end

  if (i_includeplayerlights) then
     lightclasses[#lightclasses+1] = "CGoPlayerLight"
  end

  return getgosbyclasses(lightclasses, false)
end



function getlightdata()
  lightdata =
  {
     fognear = goworld.fognear,
     fogfar = goworld.fogfar,
     fogtype = goworld.fogtype,
     fogcolor = goworld.fogcolor,

     lightsuncolorscreen = goworld.lightsuncolorscreen,
     lightsuncolorbrighten = goworld.lightsuncolorbrighten,
     lightshadecolormult = goworld.lightshadecolormult,

     lights = {}
  }

  for i, light in pairs(getlightlist(true, true, true)) do
     lightdata.lights[#lightdata.lights+1] = { go = light, diffuse = light.diffuse, ambient = light.ambient }
  end

  return lightdata
end

function setlightdata(i_lightdata)
  goworld.fognear = i_lightdata.fognear
  goworld.fogfar = i_lightdata.fogfar
  goworld.fogtype = i_lightdata.fogtype
  goworld.fogcolor = i_lightdata.fogcolor

  goworld.lightsuncolorscreen = i_lightdata.lightsuncolorscreen
  goworld.lightsuncolorbrighten = i_lightdata.lightsuncolorbrighten
  goworld.lightshadecolormult = i_lightdata.lightshadecolormult

  for i, light in pairs(i_lightdata.lights) do
     light.go.diffuse = light.diffuse
     light.go.ambient = light.ambient
  end
end

function changelightcolors(i_lightlist,
                          i_alldiffusecolor, i_allambientcolor,
                          i_sunscreencolor, i_sunbrightencolor, i_shademultcolor)

  if (i_sunscreencolor ~= nil) then
     goworld.lightsuncolorscreen = i_sunscreencolor
  end

  if (i_sunbrightencolor ~= nil) then
     goworld.lightsuncolorbrighten = i_sunbrightencolor
  end

  if (i_shademultcolor ~= nil) then
     goworld.lightshadecolormult = i_shademultcolor
  end

  if (i_lightlist ~= nil) then
     for i, light in pairs(i_lightlist) do
        if (i_alldiffusecolor ~= nil) then
           light.diffuse = i_alldiffusecolor
        end

        if (i_allambientcolor ~= nil) then
           light.ambient = i_allambientcolor
        end
     end
  end
end


function lightswhite(i_lightlist)
  changelightcolors(i_lightlist, g_white, rgb(130,150,255), rgb(70,70,70),rgb(161,161,161), g_white)
end

function lightsdark(i_lightlist)
  changelightcolors(i_lightlist, rgb(46,46,46), rgb(95,115,215), rgb(60,60,60), g_dark, rgb(225,225,225))
end

function do_lightning()
  --                                                                        
  --                      
  g_savedlightdata = getlightdata()

  if #g_lightgos == 0 then
     --                                                                    
     g_lightgos = getlightlist(true, false, false)
  end

  gomgr.getbyoid(495):reset()
  gomgr.getbyoid(495):start()
  pause(.3)

  lightswhite(g_lightgos)
  pause(.2)

  lightsdark(g_lightgos)
  pause(.1)

  lightswhite(g_lightgos)
  pause(.05)

  lightsdark(g_lightgos)
  pause(.05)

  --                                               
  setlightdata(g_savedlightdata)
end


function on_timer(name, count)
  do_lightning()
  local maxTime = 5
  local minTime = 1
  local nextTime = (math.random() * (maxTime - minTime)) + minTime
  settimer('myTimer', nextTime , 1)
end

function initiatelightening()
  settimer('myTimer', 1, 1)
end

function on_postload()
  initiatelightening()
end