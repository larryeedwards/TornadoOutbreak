lightsets = {}
checkpointrepr = nil

default_startson = true

default_angleinner = 0
default_angleouter = 0
default_radiusinner = 1
default_radiusouter = 1

--                   
-- 
-- 
function findlightset(sid)
	for lightSetIndex, lightSet in ipairs(lightsets) do
		if sid == lightSet['id'] then
			return lightSet
		end
	end
	   
	return nil
end

function findlightidbyname(sid, lightname)
    lightset = findlightset(sid)
    if lightset ~= nil then
        lights = lightset['lights']
    	for lightindex, light in ipairs(lights) do
            if lightname == light['name'] then
	        return light['id']
	    end
	end
    end

    return -1
end

--                            
-- 
-- 
function findorcreatelight(sid,lid)
	lightSet = findlightset(sid)
	if nil == lightSet then
		return nil
	end
	
	lights = lightSet['lights']
	for lightIndex, light in ipairs(lights) do
		if lid == light['id'] then
			return light
		end
	end
	
    --                                                      
    light = 
        { 
            id = lid, 
            type = 'UNKNOWN', 
            usage = 'INACTIVE', 
            enabled = false,
            startson = default_startson,
            name = 'Light'..lid, 
            position = {0,0,0}, 
            diffuse = {0,0,0,255},
            ambient = {0,0,0,255}, 
            azim = 0, 
            elev = 0, 
            angleinner = default_angleinner,
            angleouter = default_angleouter,
            radiusinner = default_radiusinner,
            radiusouter = default_radiusout 
        }

    lights[#lights+1] = light
	return light
end

--            
-- 
-- 
function reprbool(value)
	if value then
	   return 'true'
	else
	   return 'false'
	end
end

--             
-- 
-- 
function reprcolor(value)
    return '{' .. value[1] .. ',' .. value[2] .. ',' .. value[3] .. ',' .. value[4] .. '}'
end



function makergba(colorrgbalist)
   return rgba(colorrgbalist[1], colorrgbalist[2], colorrgbalist[3], colorrgbalist[4])
end

function makergbalistfromcolor(c)
   return { c['r'], c['g'], c['b'], c['a'] }
end


function ensureSunShadowFogDataExists(lightset)
   --                                                                                                      
   --                                                                                                 
   --                                                                  

   -- 
   --                 
   -- 
   if (lightset['sunscreencolor'] == nil) then
       if (goworld ~= nil) then
           lightset['sunscreencolor'] = makergbalistfromcolor(goworld.lightsuncolorscreen)
       else
           lightset['sunscreencolor'] = rgba(255,255,255,255)
       end
   end

   if (lightset['sunbrightencolor'] == nil) then
       if (goworld ~= nil) then
           lightset['sunbrightencolor'] = makergbalistfromcolor(goworld.lightsuncolorbrighten)
       else
           lightset['sunbrightencolor'] = rgba(255,255,255,255)
       end
   end

   if (lightset['shadowmultcolor'] == nil) then
       if (goworld ~= nil) then
           lightset['shadowmultcolor'] = makergbalistfromcolor(goworld.lightshadecolormult)
       else
           lightset['shadowmultcolor'] = rgba(255,255,255,255)
       end
   end

   -- 
   --          
   -- 
   if (lightset['fogstartz'] == nil) then
       if (goworld ~= nil) then
           lightset['fogstartz'] = goworld.fognear
       else
           lightset['fogstartz'] = 40
       end
   end

   if (lightset['fogendz'] == nil) then
       if (goworld ~= nil) then
           lightset['fogendz'] = goworld.fogfar
       else
           lightset['fogendz'] = 10000
       end
   end

   if (lightset['fogcolor'] == nil) then
       if (goworld ~= nil) then
           lightset['fogcolor'] = makergbalistfromcolor(goworld.fogcolor)
       else
           lightset['fogcolor'] = rgba(255,255,255,255)
       end
   end

   if (lightset['fogtype'] == nil) then
       if (goworld ~= nil) then
           lightset['fogtype'] = fogtypetostring(goworld.fogtype)
       else
           lightset['fogtype'] = "NONE"
       end
   end
   
   --  
   --                
   -- 
   if (lightset['circleofconfusion'] == nil) then
		if (goworld ~= nil) then
			lightset['circleofconfusion'] = goworld.circleofconfusion
		else
			lightset['circleofconfusion'] = 0
		end
	end

	if (lightset['focusrange'] == nil) then
		if (goworld ~= nil) then
			lightset['focusrange'] = goworld.focusrange
		else
			lightset['focusrange'] = 600
		end
	end
	   
	if (lightset['focusdistance'] == nil) then
		if (goworld ~= nil) then
			lightset['focusdistance'] = goworld.focusdistance
		else
			lightset['focusdistance'] = 24000
		end
	end
	   
end

--                                                                          
--                                                           
-- 
function getnonnilvalue(table, entry, default)
   v = table[entry]
   if v ~= nil then
      return v
   else
      return default
   end
end

--                 
-- 
-- 
function reprlightsets()
	context = 'lightsets = {'
	for lightsetIndex, lightset in ipairs(lightsets) do

        ensureSunShadowFogDataExists(lightset)

		context = context .. '{'
		context = context .. 'id = ' .. lightset['id'] .. ','
		context = context .. 'name = \'' .. lightset['name'] .. '\','

        context = context .. 'sunscreencolor = ' .. reprcolor(lightset['sunscreencolor']) .. ','
        context = context .. 'sunbrightencolor = ' .. reprcolor(lightset['sunbrightencolor']) .. ','
        context = context .. 'shadowmultcolor = ' .. reprcolor(lightset['shadowmultcolor']) .. ','
        
        context = context .. 'fogstartz = ' .. lightset['fogstartz'] .. ','
        context = context .. 'fogendz = ' .. lightset['fogendz'] .. ','
        context = context .. 'fogcolor = ' .. reprcolor(lightset['fogcolor']) .. ','
        context = context .. 'fogtype = \'' .. lightset['fogtype'] .. '\','
		
		context = context .. 'circleofconfusion = ' .. lightset['circleofconfusion'] .. ','
		context = context .. 'focusrange = ' .. lightset['focusrange'] .. ','
		context = context .. 'focusdistance = ' .. lightset['focusdistance'] .. ','
			  
			  
        --                     
		context = context .. 'lights = {'
		lights = lightset['lights']
		for lightIndex, light in ipairs(lights) do
			context = context .. '{'
			context = context .. 'id = ' .. light['id'] .. ','
			context = context .. 'type = \'' .. light['type'] .. '\','
			context = context .. 'usage = \'' .. light['usage'] .. '\','
			context = context .. 'enabled = ' .. reprbool(light['enabled']) .. ','
			context = context .. 'startson = ' .. reprbool(getnonnilvalue(light, 'startson', default_startson)) .. ','
			context = context .. 'name = \'' .. light['name'] .. '\','
					 
			position = light['position']
			context = context .. 'position = {' .. position[1] .. ',' .. position[2] .. ',' .. position[3] .. '},'
							 
			context = context .. 'diffuse = ' .. reprcolor(light['diffuse']) .. ','
			context = context .. 'ambient = ' .. reprcolor(light['ambient']) .. ','
					 
			context = context .. 'azim = ' .. light['azim'] .. ','
			context = context .. 'elev = ' .. light['elev'] .. ','
            
			context = context .. 'angleinner = ' .. getnonnilvalue(light, 'angleinner', default_angleinner) .. ','
			context = context .. 'angleouter = ' .. getnonnilvalue(light, 'angleouter', default_angleouter) .. ','

			context = context .. 'radiusinner = ' .. getnonnilvalue(light, 'radiusinner', default_radiusinner) .. ','
			context = context .. 'radiusouter = ' .. getnonnilvalue(light, 'radiusouter', default_radiusouter) .. ','
					 
			context = context .. '},'
		end
		context = context .. '}'
		
		context = context .. '},'
	end
	context = context .. '}'
	
	return context
end


--                                                       
-- 
--                                                       
--                        
-- 
--                                                       

function ensurecheckpointexists()
   if (checkpointrepr == nil) then
       checkpointrepr = reprlightsets()
   end
end


function restorecheckpoint()
   if (checkpointrepr ~= nil) then
      loadstring(checkpointrepr)
   end
end

--                                                       
-- 
--                                                      
-- 
--                                                       

function setpropbyclass(classname, propname, propvalue)
    go = gomgr.findfirstbyclass(classname, false)
    while (go ~= nil) do
        go[propname] = propvalue
--                                                                                           
        go = gomgr.findnextbyclass(go)
    end
end


lightclassnames = 
    { 
      "CGoLight", 
      "CGoPlayerLight", 
      "CGoDirLight",
      "CGoSpotLight", 
      "CGoPointLight" 
    }


function markalllightsunused()    
	for i, classname in ipairs(lightclassnames) do
        setpropbyclass(classname, "editorlightid", -1)
        setpropbyclass(classname, "lightusage", 6)
    end
end


function getunusedlightbyclass(classname)
    go = gomgr.findfirstbyclass(classname, false)
    while (go ~= nil) do
        if (go.editorlightid == -1) then
            return go
        end
        go = gomgr.findnextbyclass(go)
    end
    return nil
end


lightusagelookup = 
    { 
        PRIMARY         = 4,
        SECONDARY       = 5,
        SUN             = 1,
        SHADOW          = 2,
        FILL            = 3,
        GENERIC         = 0,
        INACTIVE        = 6
    }

function parselightusage(lightusagestr)
    enumvalue = lightusagelookup[lightusagestr]
    if (nil ~= enumvalue) then
        return enumvalue
    else
        logline("Unexpected lightusage string: " .. lightusagestr)
        return -1
    end
end


fogtypelookup =
    {
        NONE           = 0,
        LINEAR         = 1,
        EXPONENT       = 2,
        EXPONENTSQRD   = 3,
        INVEXP         = 4,
        INVEXPSQRD     = 5
    }

fogtyperevlookup =
    {
        "NONE",
        "LINEAR",
        "EXPONENT",
        "EXPONENTSQRD",
        "INVEXP",
        "INVEXPSQRD"
    }

function parsefogtype(fogtypestr)
   val = fogtypelookup[fogtypestr]
   if (nil ~= val) then
       return val
   else
       logline("Unexpected fogtype string: " .. fogtypestr)
       return 0
   end
end

function fogtypetostring(fogtypeint)
   return fogtyperevlookup[fogtypeint+1]
end


--                                     
-- 
-- 
function pushbaselightdata(light, lightdata)
   if (lightdata.enabled == true) then
       light.lightusage = parselightusage(lightdata['usage'])
   else
       light.lightusage = 6
   end

   light.ison = getnonnilvalue(lightdata, 'startson', default_startson)

   p = lightdata['position']
   this:setlightposition(light, p[1], p[2], p[3])

   light:setlightdirection(lightdata['azim'], lightdata['elev'])
   
   light.diffuse = makergba(lightdata['diffuse'])
   light.ambient = makergba(lightdata['ambient'])

   light.editorlightid = lightdata.id
end


--                                       
-- 
-- 
function pushplayerlightdata(light, lightdata)
   pushbaselightdata(light, lightdata)
end


--                                    
-- 
-- 
function pushdirlightdata(light, lightdata)
   pushbaselightdata(light, lightdata)
end


--                                     
-- 
-- 
function pushspotlightdata(light, lightdata)
   pushbaselightdata(light, lightdata)

   light.innerconeangle = getnonnilvalue(lightdata, 'angleinner', default_angleinner)
   light.outerconeangle = getnonnilvalue(lightdata, 'angleouter', default_angleouter)
end

--                                      
-- 
-- 
function pushpointlightdata(light, lightdata)
   pushbaselightdata(light, lightdata)

   light.innerradius = getnonnilvalue(lightdata, 'radiusinner', default_radiusinner)
   light.outerradius = getnonnilvalue(lightdata, 'radiusouter', default_radiusouter)
end


--                          
-- 
-- 
function addlight(lightdata)
   type = lightdata['type']

   if (type == "PLAYER") then
      playerlight = getunusedlightbyclass('CGoPlayerLight')
      if (playerlight ~= nil) then
          pushplayerlightdata(playerlight, lightdata)
      else
          logline("lightset requires more player lights than are available")
      end

   elseif (type == "DIRECTIONAL") then
      dirlight = getunusedlightbyclass('CGoDirLight')
      if (dirlight ~= nil) then
          pushdirlightdata(dirlight, lightdata)
      else
          logline("lightset requires more directional lights than are available")
      end

   elseif (type == "SPOT") then
      spotlight = getunusedlightbyclass('CGoSpotLight')
      if (spotlight ~= nil) then
          pushspotlightdata(spotlight, lightdata)
      else
          logline("lightset requires more spot lights than are available")
      end

   elseif (type == "POINT") then
      pointlight = getunusedlightbyclass('CGoPointLight')
      if (pointlight ~= nil) then
          pushpointlightdata(pointlight, lightdata)
      else
          logline("lightset requires more point lights than are available")
      end

   else
      logline("Unknown light type: "..type)
   end 
end


--                                   
-- 
-- 
function pushglobalsunshadowdata(lightset)
    --                                                    
    if (goworld ~= nil) then
        if (lightset.sunscreencolor ~= nil) then 
            goworld.lightsuncolorscreen = makergba(lightset.sunscreencolor)
        end

        if (lightset.sunbrightencolor ~= nil) then 
            goworld.lightsuncolorbrighten = makergba(lightset.sunbrightencolor)
        end

        if (lightset.shadowmultcolor ~= nil) then 
            goworld.lightshadecolormult = makergba(lightset.shadowmultcolor)
        end
    else
        logline("Could not locate CGoWorld object to set sun/shadow colors on.");
    end
end

--                       
-- 
-- 
function pushfogdata(lightset)
    --                                                    
    if (goworld ~= nil) then
        if (lightset.fogstartz ~= nil) then
            goworld.fognear = lightset.fogstartz
        end

        if (lightset.fogendz ~= nil) then
            goworld.fogfar = lightset.fogendz
        end

        if (lightset.fogcolor ~= nil) then
            goworld.fogcolor = makergba(lightset.fogcolor)
        end

        if (lightset.fogtype ~= nil) then
            goworld.fogtype = parsefogtype(lightset.fogtype)
        end
    else
        logline("Could not locate CGoWorld object to set fog data on.");
    end
end

--                                
-- 
-- 
function pushdepthoffielddata(lightset)
	if (goworld ~= nil) then 
	   if (lightset.circleofconfusion ~= nil) then
		  goworld.circleofconfusion = lightset.circleofconfusion
	   end
	   if (lightset.focusrange ~= nil) then
		  goworld.focusrange = lightset.focusrange
	   end
	   if (lightset.focusdistance ~= nil) then
		  goworld.focusdistance = lightset.focusdistance 
	   end
	end
end

--                       
-- 
-- 
function pushlightsetdata(sid)
    lightset = findlightset(sid)
    if (lightset ~= nil) then
        markalllightsunused()

  	    lights = lightset['lights']
        for lightIndex, light in ipairs(lights) do
            addlight(light)
     	end

        pushglobalsunshadowdata(lightset)
        pushfogdata(lightset)
		pushdepthoffielddata(lightset)
    else
       logline("failed to find lightset matching id")
    end
end



function getdefaultlightsetid()
   if (#lightsets > 0) then
      return lightsets[1].id
   else
      return -1
   end
