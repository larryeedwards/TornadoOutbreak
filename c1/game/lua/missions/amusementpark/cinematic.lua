sequences = {}

--            
-- 
--                                    
function reprbool(value)
	if value then
		return 'true'
	end
	return 'false'
end

--                 
-- 
--                                                   
function reprsequences()
	context = 'sequences = {'
	for sequenceIndex, sequence in ipairs(sequences) do
		context = context .. '{'
		context = context .. 'id = ' .. sequence['id'] .. ','
		context = context .. 'name = \'' .. sequence['name'] .. '\','
		context = context .. 'interpolation = \'' .. sequence['interpolation'] .. '\','
		context = context .. 'duration = ' .. sequence['duration'] .. ','
		context = context .. 'smooth = ' .. reprbool(sequence['smooth']) .. ','
		context = context .. 'stitch = ' .. reprbool(sequence['stitch']) .. ','
		context = context .. 'loop = ' .. reprbool(sequence['loop']) .. ','
			  
		context = context .. 'keyframes = {'
		keyFrames = sequence['keyframes']
		for keyFrameIndex, keyFrame in ipairs(keyFrames) do
			context = context .. '{'
			context = context .. 'id = ' .. keyFrame['id'] .. ','
			context = context .. 'name = \'' .. keyFrame['name'] .. '\','
			context = context .. 'interpolant = ' .. keyFrame['interpolant'] .. ','
			context = context .. 'target = \'' .. keyFrame['target'] .. '\','
					 
			link = keyFrame['link']
			if nil ~= link then
				context = context .. 'link = \'' .. link .. '\','
			end
					 
			context = context .. 'fov = ' .. keyFrame['fov'] .. ','
			
			position = keyFrame['position']
			context = context .. 'position = {' .. position[1] .. ',' .. position[2] .. ',' .. position[3] .. '},'
			
			orientation = keyFrame['orientation']
			context = context .. 'orientation = {' .. orientation[1] .. ',' .. orientation[2] .. ',' .. orientation[3] .. ',' .. orientation[4] .. '}'
			
			context = context .. '},'
		end
		context = context .. '},'
		
		context = context .. 'events = {'
		events = sequence['events']
		if nil ~= events then
			for eventIndex, event in ipairs(events) do
				context = context .. '{'
				context = context .. 'id = ' .. event['id'] .. ','
				context = context .. 'name = \'' .. event['name'] .. '\','
				context = context .. 'interpolant = ' .. event['interpolant'] .. ','
				context = context .. 'object = \'' .. event['object'] .. '\','
				context = context .. 'label = \'' .. event['label'] .. '\','			
				context = context .. '},'
			end
		end
		context = context .. '},'
			  
		context = context .. '},'
	end
	context = context .. '}'
	
	return context
end

--                   
-- 
--                  
function findsequence(sid)
	for sequenceIndex, sequence in ipairs(sequences) do
		if sid == sequence['id'] then
			return sequence
		end
	end
	   
	return nil
end

-- 
-- 
-- 
function getsequenceid(name)
	for sequenceIndex, sequence in ipairs(sequences) do
		if name == sequence['name'] then
			return sequence['id']
		end
	end
	   
	return -1
end

--                       
-- 
--                  
--               
function findkeyframe(sid,fid)
	sequence = findsequence(sid)
	if nil == sequence then
		return nil
	end
	
	keyFrames = sequence['keyframes']
	for keyFrameIndex, keyFrame in ipairs(keyFrames) do
		if fid == keyFrame['id'] then
			return keyFrame
		end
	end
	   
	return nil
end

--                    
-- 
-- 
function findevent(sid,eid)
	sequence = findsequence(sid)
	if nil == sequence then
		return nil
	end
	
	events = sequence['events']
	if nil == events then
		return nil
	end
	   
	for eventIndex, event in ipairs(events) do
		if eid == event['id'] then
			return event
		end
	end
	   
	return nil
end

--                         
-- 
-- 
function setcurrentsequence(sid)
	sequence = findsequence(sid)
	if nil == sequence then
		return
	end

	destSequence = cinematic.getsequence()
	destSequence:setid(sequence['id'])
	destSequence:setinterpolation(sequence['interpolation'])
	destSequence:setsmooth(sequence['smooth'])
	destSequence:setstitch(sequence['stitch'])
	destSequence:setduration(sequence['duration'])	

	loop = sequence['loop']
	if nil ~= loop then
		destSequence:setloop(loop)
	else
		destSequence:setloop(false)
	end
	   
	keyFrames = sequence['keyframes']
	destSequence:setkeyframecount(table.getn(keyFrames))
	
	for keyFrameIndex, keyFrame in ipairs(keyFrames) do
		destKeyFrame = cinematic.getkeyframe(keyFrameIndex-1)
			  
		position = keyFrame['position']
		orientation = keyFrame['orientation']
			  
		destKeyFrame:setid(keyFrame['id'])
		destKeyFrame:setinterpolant(keyFrame['interpolant'])
		destKeyFrame:setfov(keyFrame['fov'])
		destKeyFrame:setposition(position[1],position[2],position[3])
		destKeyFrame:setorientation(orientation[4],orientation[1],orientation[2],orientation[3])
	
		target = keyFrame['target']
		if '' ~= target then
			destKeyFrame:settarget(target)
		else
			destKeyFrame:cleartarget()
		end
		
		link = keyFrame['link']
		if nil ~= link and '' ~= link then
			destKeyFrame:setlink(link)
		else
			destKeyFrame:clearlink()
		end
	end
	
	events = sequence['events']
	if nil == events then
		destSequence:seteventcount(0)
		return
	end
	   
	destSequence:seteventcount(table.getn(events))
	for eventIndex, event in ipairs(events) do
		destEvent = cinematic.getevent(eventIndex-1)
			  
		destEvent:setid(event['id'])
		destEvent:setinterpolant(event['interpolant'])
		destEvent:setobject(event['object'])
		destEvent:setlabel(event['label'])
	end
	   
end

	    .amusementpark_common_mission_grow.lua: line 2    8ÿ  Z
sequences = {
	{
		id = 1,
		name = 'flythrough_new',
		interpolation = 'avatar_opening',
		duration = 1.1,
		smooth = true,
		stitch = false,
		loop = false,
		keyframes = 
		{
			{id = 1,name = 'KeyFrame1',interpolant = 0,target = '',link = 'avatar_opening',fov = 1.047198,position = {-100.00,0.00,100.00,},orientation = {0.00,-0.17,0.00,0.98,},},
			{id = 2,name = 'KeyFrame2',interpolant = 0.04,target = '',link = 'avatar_opening',fov = 1.047198,position = {-107.57,-0.15,147.23,},orientation = {-0.01,-0.27,0.02,0.96,},},
			{id = 3,name = 'KeyFrame3',interpolant = 0.11,target = '',link = 'avatar_opening',fov = 1.047198,position = {-240.58,-110.78,189.04,},orientation = {0.11,-0.23,-0.29,0.92,},},
			{id = 4,name = 'KeyFrame4',interpolant = 0.15,target = '',link = 'avatar_opening',fov = 1.22173,position = {-129.65,-144.02,170.42,},orientation = {0.23,-0.33,-0.57,0.71,},},
			{id = 5,name = 'KeyFrame5',interpolant = 0.2,target = '',link = 'avatar_opening',fov = 1.047198,position = {-262.75,-61.83,-39.77,},orientation = {-0.08,0.17,-0.33,0.93,},},
			{id = 6,name = 'KeyFrame6',interpolant = 0.25,target = '',link = 'avatar_opening',fov = 1.047198,position = {-269.33,-312.81,-72.74,},orientation = {-0.11,0.13,-0.54,0.82,},},
			{id = 7,name = 'KeyFrame7',interpolant = 0.3,target = '',link = 'avatar_opening',fov = 1.047198,position = {145.77,-356.25,14.74,},orientation = {-0.10,0.05,-0.84,0.53,},},
			{id = 8,name = 'KeyFrame8',interpolant = 0.35,target = '',link = 'avatar_opening',fov = 1.047198,position = {-213.67,-135.47,124.98,},orientation = {0.08,-0.22,-0.28,0.93,},},
			{id = 9,name = 'KeyFrame9',interpolant = 0.4,target = '',link = 'avatar_opening',fov = 1.047198,position = {-169.11,-169.54,95.37,},orientation = {0.14,-0.18,-0.30,0.93,},},
			{id = 10,name = 'KeyFrame10',interpolant = 0.45,target = '',link = 'avatar_opening',fov = 1.047198,position = {-206.22,2.78,137.78,},orientation = {0.11,-0.26,-0.11,0.95,},},
			{id = 11,name = 'KeyFrame11',interpolant = 0.5,target = '',link = 'avatar_opening',fov = 1.047198,position = {-199.96,-111.69,197.52,},orientation = {0.06,-0.32,-0.30,0.90,},},
			{id = 12,name = 'KeyFrame12',interpolant = 0.55,target = '',link = 'avatar_opening',fov = 1.047198,position = {-209.25,-80.17,180.92,},orientation = {0.02,-0.33,-0.28,0.90,},},
			{id = 13,name = 'KeyFrame13',interpolant = 0.6,target = '',link = 'avatar_opening',fov = 1.047198,position = {-210.26,-248.65,188.05,},orientation = {0.06,-0.25,-0.42,0.87,},},
			{id = 14,name = 'KeyFrame14',interpolant = 0.65,target = '',link = 'avatar_opening',fov = 1.047198,position = {-172.15,-132.25,144.10,},orientation = {0.12,-0.26,-0.39,0.87,},},
			{id = 15,name = 'KeyFrame15',interpolant = 0.7,target = '',link = 'avatar_opening',fov = 1.047198,position = {-69.95,-281.85,120.29,},orientation = {0.11,-0.13,-0.66,0.73,},},
			{id = 16,name = 'KeyFrame16',interpolant = 0.75,target = '',link = 'avatar_opening',fov = 1.047198,position = {-169.64,-165.95,189.06,},orientation = {0.13,-0.27,-0.43,0.85,},},
			{id = 17,name = 'KeyFrame17',interpolant = 0.8,target = '',link = 'avatar_opening',fov = 1.047198,position = {-234.56,-76.07,178.37,},orientation = {0.05,-0.29,-0.19,0.94,},},
			{id = 18,name = 'KeyFrame18',interpolant = 0.85,target = '',link = 'avatar_opening',fov = 0.9599317,position = {-183.55,-168.83,238.31,},orientation = {0.13,-0.31,-0.41,0.85,},},
			{id = 19,name = 'KeyFrame19',interpolant = 0.91,target = '',link = 'avatar_opening',fov = 0.8726652,position = {213.41,-200.80,136.56,},orientation = {-0.23,0.07,0.90,-0.37,},},
			{id = 20,name = 'KeyFrame20',interpolant = 0.95,target = '',link = 'avatar_opening',fov = 0.9599311,position = {158.59,-146.48,121.50,},orientation = {-0.43,0.03,0.89,-0.12,},},
			{id = 21,name = 'KeyFrame21',interpolant = 0.96,target = '',link = 'avatar_opening',fov = 1.134464,position = {-0.63,-111.51,124.49,},orientation = {0.53,-0.28,-0.62,0.51,},},
			{id = 22,name = 'KeyFrame22',interpolant = 0.98,target = '',link = 'avatar_opening',fov = 1.22173,position = {-45.47,-167.14,75.96,},orientation = {0.28,-0.16,-0.62,0.72,},},
			{id = 23,name = 'KeyFrame23',interpolant = 0.998,target = '',link = 'avatar_opening',fov = 1.22173,position = {-50.27,-403.73,108.47,},orientation = {0.18,-0.07,-0.60,0.78,},},
			{id = 24,name = 'KeyFrame24',interpolant = 1,target = '',link = 'avatar_opening',fov = 1.22173,position = {113.00,-725.00,717.00,},orientation = {0.23,-0.03,-0.72,0.65,},},
			{id = 25,name = 'KeyFrame25',interpolant = 1.1,target = '',link = 'avatar_opening',fov = 1.22173,position = {113.00,-725.00,717.00,},orientation = {0.23,-0.03,-0.72,0.65,},},
		},
		events = 
		{
			{id = 1,name = 'Start',interpolant = 0,object = 'openingcamera',label = 'cinematic_start',},
			{id = 2,name = 'Sprites1',interpolant = 0.3,object = 'cine_firesprite_mgr',label = 'cinematic_sprites1',},
			{id = 3,name = 'Sprites2',interpolant = 0.55,object = 'cine_firesprite_mgr',label = 'cinematic_sprites2',},
			{id = 4,name = 'Sprites3',interpolant = 0.84,object = 'cine_firesprite_mgr',label = 'cinematic_sprites3',},
			{id = 5,name = 'Split',interpolant = 0.96,object = 'openingcamera',label = 'cinematic_split',},
			{id = 6,name = 'Shadow',interpolant = 0.96,object = 'openingcamera',label = 'cinematic_shadow',},
			{id = 8,name = 'End',interpolant = 0.99,object = 'openingcamera',label = 'cinematic_at_end',},
			{id = 9,name = 'vo1',interpolant = 0.15,object = 'opening_vo',label = 'Play_fly_fap01',},
			{id = 10,name = 'vo2',interpolant = 0.22,object = 'opening_vo',label = 'Play_fly_fap02',},
			{id = 11,name = 'vo3',interpolant = 0.33,object = 'opening_vo',label = 'Play_fly_fap03',},
		},
	},
	{
		id = 2,
		name = 'closeup_01',
		interpolation = '__time__',
		duration = 6,
		smooth = true,
		stitch = false,
		loop = false,
		keyframes = 
		{
			{id = 1,name = 'KeyFrame1',interpolant = 0,target = '',link = '',fov = 1.047198,position = {-11718.70,4068.84,1050.35,},orientation = {-0.03,-0.15,0.18,0.97,},},
			{id = 2,name = 'KeyFrame2',interpolant = 2,target = '',link = '',fov = 1.047198,position = {-11631.31,4571.94,741.17,},orientation = {-0.04,-0.15,0.22,0.96,},},
			{id = 3,name = 'KeyFrame3',interpolant = 3.5,target = '',link = '',fov = 1.047198,position = {-11452.28,4417.10,45.75,},orientation = {0.04,0.17,-0.20,-0.96,},},
			{id = 4,name = 'KeyFrame4',interpolant = 4.8,target = '',link = '',fov = 1.047198,position = {-11263.53,4126.51,-656.55,},orientation = {-0.04,-0.20,0.20,0.96,},},
			{id = 5,name = 'KeyFrame5',interpolant = 6,target = '',link = '',fov = 1.047198,position = {-11098.35,3543.58,-1020.80,},orientation = {0.02,-0.12,-0.13,0.98,},},
		},
		events = 
		{
			{id = 1,name = 'Start',interpolant = 0,object = 'cinematic1',label = 'cinematic_ls_start',},
			{id = 2,name = 'Close',interpolant = 3.5,object = 'cinematic1',label = 'cinematic_ls_close',},
			{id = 3,name = 'End',interpolant = 6,object = 'cinematic1',label = 'cinematic_ls_at_end',},
		},
	},
	{
		id = 3,
		name = 'transition_01',
		interpolation = 'avatar_area1',
		duration = 1,
		smooth = true,
		stitch = false,
		loop = false,
		keyframes = 
		{
			{id = 1,name = 'KeyFrame1',interpolant = 0,target = '',link = 'avatar_area1',fov = 1.047198,position = {-138.17,270.83,131.73,},orientation = {0.02,-0.14,0.42,0.90,},},
			{id = 3,name = 'KeyFrame3',interpolant = 0.1,target = '',link = 'avatar_area1',fov = 1.047198,position = {-168.80,273.45,206.38,},orientation = {-0.07,-0.27,0.41,0.87,},},
			{id = 5,name = 'KeyFrame5',interpolant = 0.2,target = '',link = 'avatar_area1',fov = 1.047198,position = {-132.86,223.28,152.62,},orientation = {-0.04,-0.26,0.38,0.89,},},
			{id = 7,name = 'KeyFrame7',interpolant = 0.3,target = '',link = 'avatar_area1',fov = 1.047198,position = {157.69,332.20,25.58,},orientation = {-0.05,-0.02,0.73,0.69,},},
			{id = 9,name = 'KeyFrame9',interpolant = 0.4,target = '',link = 'avatar_area1',fov = 1.047198,position = {173.77,236.15,23.16,},orientation = {-0.07,0.05,0.89,0.45,},},
			{id = 11,name = 'KeyFrame11',interpolant = 0.5,target = '',link = 'avatar_area1',fov = 1.047198,position = {283.60,174.68,89.15,},orientation = {-0.01,-0.05,0.96,0.29,},},
			{id = 13,name = 'KeyFrame13',interpolant = 0.6,target = '',link = 'avatar_area1',fov = 1.047198,position = {140.01,379.13,196.53,},orientation = {-0.20,-0.15,0.78,0.57,},},
			{id = 15,name = 'KeyFrame15',interpolant = 0.7,target = '',link = 'avatar_area1',fov = 1.047198,position = {13.12,291.23,182.29,},orientation = {-0.24,-0.16,0.67,0.68,},},
			{id = 17,name = 'KeyFrame17',interpolant = 0.8,target = '',link = 'avatar_area1',fov = 1.047198,position = {21.75,387.18,153.44,},orientation = {-0.20,-0.12,0.70,0.67,},},
			{id = 18,name = 'KeyFrame18',interpolant = 0.85,target = '',link = 'avatar_area1',fov = 0.9599317,position = {6.24,349.94,151.50,},orientation = {-0.19,-0.14,0.69,0.68,},},
			{id = 19,name = 'KeyFrame19',interpolant = 0.9,target = '',link = 'avatar_area1',fov = 0.8726652,position = {-115.51,328.37,104.17,},orientation = {-0.16,-0.08,0.53,0.83,},},
			{id = 20,name = 'KeyFrame20',interpolant = 0.95,target = '',link = 'avatar_area1',fov = 0.9599311,position = {-35.87,369.89,69.73,},orientation = {-0.16,-0.01,0.64,0.75,},},
			{id = 22,name = 'KeyFrame22',interpolant = 0.98,target = '',link = 'avatar_area1',fov = 1.22173,position = {135.61,546.30,90.97,},orientation = {-0.15,0.04,0.68,0.72,},},
			{id = 23,name = 'KeyFrame23',interpolant = 0.99,target = '',link = 'avatar_area1',fov = 1.22173,position = {239.02,551.06,129.07,},orientation = {-0.15,0.07,0.68,0.71,},},
			{id = 24,name = 'KeyFrame24',interpolant = 1,target = '',link = 'avatar_area1',fov = 1.22173,position = {124.00,671.00,482.00,},orientation = {-0.19,0.02,0.67,0.72,},},
		},
		events = 
		{
			{id = 1,name = 'Start',interpolant = 0,object = 'cinematic1',label = 'cinematic_start',},
			{id = 2,name = 'Totem',interpolant = 0.18,object = 'cinematic1',label = 'cinematic_rise_totem',},
			{id = 3,name = 'Split',interpolant = 0.95,object = 'cinematic1',label = 'cinematic_split',},
			{id = 4,name = 'Shadow',interpolant = 0.95,object = 'cinematic1',label = 'cinematic_shadow',},
			{id = 5,name = 'End',interpolant = 0.99,object = 'cinematic1',label = 'cinematic_at_end',},
			{id = 6,name = 'vo4',interpolant = 0.3,object = 'opening_vo',label = 'Play_fly_fap04',},
			{id = 7,name = 'vo5',interpolant = 0.5,object = 'opening_vo',label = 'Play_fly_fap05',},
		},
	},
	{
		id = 4,
		name = 'closeup_02',
		interpolation = '__time__',
		duration = 6,
		smooth = true,
		stitch = false,
		loop = false,
		keyframes = 
		{
			{id = 1,name = 'KeyFrame1',interpolant = 0,target = '',link = '',fov = 1.047198,position = {17824.98,15506.06,1534.76,},orientation = {-0.15,-0.05,0.93,0.33,},},
			{id = 2,name = 'KeyFrame2',interpolant = 2,target = '',link = '',fov = 1.047198,position = {18140.68,15757.34,770.77,},orientation = {-0.12,-0.04,0.94,0.31,},},
			{id = 3,name = 'KeyFrame3',interpolant = 3.5,target = '',link = '',fov = 1.047198,position = {18144.32,16015.44,195.45,},orientation = {0.16,0.03,-0.96,-0.21,},},
			{id = 4,name = 'KeyFrame4',interpolant = 4.8,target = '',link = '',fov = 1.047198,position = {18069.60,16561.98,-320.64,},orientation = {-0.16,-0.04,0.95,0.26,},},
			{id = 5,name = 'KeyFrame5',interpolant = 6,target = '',link = '',fov = 1.047198,position = {17882.80,16177.76,-632.03,},orientation = {-0.17,-0.02,0.98,0.10,},},
		},
		events = 
		{
			{id = 1,name = 'Start',interpolant = 0,object = 'cinematic2',label = 'cinematic_ls_start',},
			{id = 2,name = 'Close',interpolant = 3.5,object = 'cinematic2',label = 'cinematic_ls_close',},
			{id = 3,name = 'End',interpolant = 6,object = 'cinematic2',label = 'cinematic_ls_at_end',},
		},
	},
	{
		id = 5,
		name = 'transition_02',
		interpolation = 'avatar_area2',
		duration = 1,
		smooth = true,
		stitch = false,
		loop = false,
		keyframes = 
		{
			{id = 1,name = 'KeyFrame1',interpolant = 0,target = '',link = 'avatar_area2',fov = 1.047198,position = {-290.54,-468.31,47.62,},orientation = {-0.03,-0.05,-0.51,0.86,},},
			{id = 3,name = 'KeyFrame3',interpolant = 0.1,target = '',link = 'avatar_area2',fov = 1.047198,position = {-269.34,-80.57,134.11,},orientation = {-0.01,-0.21,-0.15,0.97,},},
			{id = 5,name = 'KeyFrame5',interpolant = 0.2,target = '',link = 'avatar_area2',fov = 1.047198,position = {-270.52,-128.83,100.94,},orientation = {-0.01,-0.07,-0.26,0.96,},},
			{id = 7,name = 'KeyFrame7',interpolant = 0.3,target = '',link = 'avatar_area2',fov = 1.047198,position = {-241.23,-161.59,34.44,},orientation = {-0.04,0.02,-0.38,0.92,},},
			{id = 9,name = 'KeyFrame9',interpolant = 0.4,target = '',link = 'avatar_area2',fov = 1.047198,position = {-207.63,-141.15,40.78,},orientation = {-0.04,0.01,-0.32,0.95,},},
			{id = 11,name = 'KeyFrame11',interpolant = 0.5,target = '',link = 'avatar_area2',fov = 1.047198,position = {-130.58,-140.39,79.77,},orientation = {0.00,-0.14,-0.29,0.95,},},
			{id = 13,name = 'KeyFrame13',interpolant = 0.6,target = '',link = 'avatar_area2',fov = 1.047198,position = {-306.17,-14.52,113.36,},orientation = {0.00,-0.12,0.10,0.99,},},
			{id = 15,name = 'KeyFrame15',interpolant = 0.7,target = '',link = 'avatar_area2',fov = 1.047198,position = {46.18,366.87,114.64,},orientation = {-0.08,-0.04,0.75,0.65,},},
			{id = 17,name = 'KeyFrame17',interpolant = 0.8,target = '',link = 'avatar_area2',fov = 1.047198,position = {275.47,347.92,120.04,},orientation = {-0.09,0.00,0.89,0.45,},},
			{id = 18,name = 'KeyFrame18',interpolant = 0.85,target = '',link = 'avatar_area2',fov = 0.9599317,position = {133.90,364.50,168.90,},orientation = {-0.21,-0.03,0.80,0.56,},},
			{id = 19,name = 'KeyFrame19',interpolant = 0.9,target = '',link = 'avatar_area2',fov = 0.8726652,position = {-39.71,612.65,45.72,},orientation = {-0.16,0.08,0.67,0.72,},},
			{id = 20,name = 'KeyFrame20',interpolant = 0.95,target = '',link = 'avatar_area2',fov = 0.9599311,position = {18.90,477.90,63.08,},orientation = {-0.21,0.10,0.69,0.69,},},
			{id = 22,name = 'KeyFrame22',interpolant = 0.98,target = '',link = 'avatar_area2',fov = 1.047198,position = {13.48,535.99,0.23,},orientation = {-0.19,0.16,0.65,0.72,},},
			{id = 23,name = 'KeyFrame23',interpolant = 0.99,target = '',link = 'avatar_area2',fov = 1.047198,position = {81.88,544.31,36.29,},orientation = {-0.17,0.13,0.66,0.72,},},
			{id = 24,name = 'KeyFrame24',interpolant = 1,target = '',link = 'avatar_area2',fov = 1.047198,position = {29.00,535.00,153.00,},orientation = {-0.17,0.13,0.66,0.72,},},
		},
		events = 
		{
			{id = 1,name = 'Start',interpolant = 0,object = 'cinematic2',label = 'cinematic_start',},
			{id = 2,name = 'Totem',interpolant = 0.5,object = 'cinematic2',label = 'cinematic_rise_totem',},
			{id = 3,name = 'Split',interpolant = 0.95,object = 'cinematic2',label = 'cinematic_split',},
			{id = 4,name = 'Shadow',interpolant = 0.95,object = 'cinematic2',label = 'cinematic_shadow',},
			{id = 5,name = 'End',interpolant = 0.99,object = 'cinematic2',label = 'cinematic_at_end',},
			{id = 6,name = 'vo6',interpolant = 0.1,object = 'opening_vo',label = 'Play_fly_fap06',},
			{id = 7,name = 'vo7',interpolant = 0.43,object = 'opening_vo',label = 'Play_fly_fap07',},
		},
	},
	{
		id = 6,
		name = 'cine_bosssetupA',
		interpolation = '__time__',
		duration = 6,
		smooth = true,
		stitch = false,
		loop = false,
		keyframes = 
		{
			{id = 1,name = 'KeyFrame1',interpolant = 0,target = '',link = '',fov = 0.7854,position = {8121.63,-2721.95,1261.57,},orientation = {-0.10,0.04,0.94,-0.33,},},
			{id = 8,name = 'KeyFrame8',interpolant = 1.5,target = '',link = '',fov = 0.7854,position = {12703.86,-1252.74,772.26,},orientation = {-0.06,0.00,0.99,-0.08,},},
			{id = 5,name = 'KeyFrame5',interpolant = 3.8,target = '',link = '',fov = 0.7854,position = {22649.25,1999.25,-271.75,},orientation = {0.01,0.00,0.99,0.12,},},
			{id = 6,name = 'KeyFrame6',interpolant = 6,target = '',link = '',fov = 0.7854,position = {23677.44,2829.74,-238.75,},orientation = {-0.05,-0.03,0.88,0.47,},},
			{id = 7,name = 'KeyFrame7',interpolant = 6,target = '',link = '',fov = 0.7854,position = {23677.44,2829.74,-238.75,},orientation = {-0.05,-0.03,0.88,0.47,},},
		},
		events = 
		{
			{id = 1,name = 'Start',interpolant = 0,object = '|cinematic3',label = 'cinematic_start',},
			{id = 2,name = 'Totem',interpolant = 0.5,object = '|cinematic3',label = 'cinematic_rise_totem',},
			{id = 3,name = 'End',interpolant = 5,object = '|cinematic3',label = 'cinematic_at_end',},
		},
	},
	{
		id = 7,
		name = 'cine_bosssetupB',
		interpolation = '__time__',
		duration = 5,
		smooth = true,
		stitch = false,
		loop = false,
		keyframes = 
		{
			{id = 1,name = 'KeyFrame1',interpolant = 0,target = '',link = '',fov = 0.7854,position = {8516.76,15382.45,470.26,},orientation = {0.11,0.07,0.83,0.55,},},
			{id = 2,name = 'KeyFrame2',interpolant = 2.5,target = '',link = '',fov = 0.7854,position = {-795.34,11417.18,1610.14,},orientation = {0.08,0.13,0.53,0.83,},},
			{id = 3,name = 'KeyFrame3',interpolant = 5,target = '',link = '',fov = 0.7854,position = {-5726.76,9317.28,2213.79,},orientation = {0.03,0.09,0.31,0.95,},},
		},
		events = 
		{
			{id = 1,name = 'Start',interpolant = 0,object = '|race_mgr',label = 'cinematic_start',},
			{id = 2,name = 'End',interpolant = 5,object = '|race_mgr',label = 'cinematic_at_end',},
		},
	},
	{
		id = 8,
		name = 'cine_stomp',
		interpolation = '__time__',
		duration = 24,
		smooth = true,
		stitch = false,
		loop = true,
		keyframes = 
		{
			{id = 1,name = 'KeyFrame1',interpolant = 0,target = '|amusementpark_common_mission_grow|rock_elemental2',link = '',fov = 0.7854,position = {18168.21,8569.47,0.00,},orientation = {0.00,0.00,0.41,0.91,},},
			{id = 2,name = 'KeyFrame2',interpolant = 1,target = '|amusementpark_common_mission_grow|rock_elemental2',link = '',fov = 0.7854,position = {18259.61,8464.22,0.00,},orientation = {0.00,0.00,0.50,0.86,},},
			{id = 3,name = 'KeyFrame3',interpolant = 2,target = '|amusementpark_common_mission_grow|rock_elemental2',link = '',fov = 0.7854,position = {18392.18,8230.52,0.00,},orientation = {0.00,0.00,0.60,0.80,},},
			{id = 4,name = 'KeyFrame4',interpolant = 3,target = '|amusementpark_common_mission_grow|rock_elemental2',link = '',fov = 0.7854,position = {18462.97,7979.86,0.00,},orientation = {0.00,0.00,0.72,0.69,},},
			{id = 5,name = 'KeyFrame5',interpolant = 4,target = '|amusementpark_common_mission_grow|rock_elemental2',link = '',fov = 0.7854,position = {18453.42,7731.38,0.00,},orientation = {0.00,0.00,0.83,0.55,},},
			{id = 6,name = 'KeyFrame6',interpolant = 5,target = '|amusementpark_common_mission_grow|rock_elemental2',link = '',fov = 0.7854,position = {18361.76,7516.11,0.00,},orientation = {0.00,0.00,0.92,0.40,},},
			{id = 7,name = 'KeyFrame7',interpolant = 6,target = '|amusementpark_common_mission_grow|rock_elemental2',link = '',fov = 0.7854,position = {18214.91,7358.38,0.00,},orientation = {0.00,0.00,0.96,0.27,},},
			{id = 8,name = 'KeyFrame8',interpolant = 7,target = '|amusementpark_common_mission_grow|rock_elemental2',link = '',fov = 0.7854,position = {18045.32,7257.25,0.00,},orientation = {0.00,0.00,0.99,0.16,},},
			{id = 9,name = 'KeyFrame9',interpolant = 8,target = '|amusementpark_common_mission_grow|rock_elemental2',link = '',fov = 0.7854,position = {17864.84,7197.15,0.00,},orientation = {0.00,0.00,1.00,0.06,},},
			{id = 10,name = 'KeyFrame10',interpolant = 9,target = '|amusementpark_common_mission_grow|rock_elemental2',link = '',fov = 0.7854,position = {17671.35,7173.64,0.00,},orientation = {0.00,0.00,-1.00,0.05,},},
			{id = 11,name = 'KeyFrame11',interpolant = 10,target = '|amusementpark_common_mission_grow|rock_elemental2',link = '',fov = 0.7854,position = {17469.67,7195.91,0.00,},orientation = {0.00,0.00,-0.98,0.18,},},
			{id = 12,name = 'KeyFrame12',interpolant = 11,target = '|amusementpark_common_mission_grow|rock_elemental2',link = '',fov = 0.7854,position = {17276.12,7269.08,0.00,},orientation = {0.00,0.00,-0.95,0.30,},},
			{id = 13,name = 'KeyFrame13',interpolant = 12,target = '|amusementpark_common_mission_grow|rock_elemental2',link = '',fov = 0.7854,position = {17111.19,7385.63,0.00,},orientation = {0.00,0.00,-0.90,0.43,},},
			{id = 14,name = 'KeyFrame14',interpolant = 13,target = '|amusementpark_common_mission_grow|rock_elemental2',link = '',fov = 0.7854,position = {16990.90,7531.01,0.00,},orientation = {0.00,0.00,-0.84,0.54,},},
			{id = 15,name = 'KeyFrame15',interpolant = 14,target = '|amusementpark_common_mission_grow|rock_elemental2',link = '',fov = 0.7854,position = {16918.96,7691.98,0.00,},orientation = {0.00,0.00,-0.77,0.64,},},
			{id = 16,name = 'KeyFrame16',interpolant = 15,target = '|amusementpark_common_mission_grow|rock_elemental2',link = '',fov = 0.7854,position = {16888.63,7862.16,0.00,},orientation = {0.00,0.00,-0.70,0.72,},},
			{id = 17,name = 'KeyFrame17',interpolant = 16,target = '|amusementpark_common_mission_grow|rock_elemental2',link = '',fov = 0.7854,position = {16894.53,8041.80,0.00,},orientation = {0.00,0.00,-0.62,0.78,},},
			{id = 18,name = 'KeyFrame18',interpolant = 17,target = '|amusementpark_common_mission_grow|rock_elemental2',link = '',fov = 0.7854,position = {16938.51,8228.52,0.00,},orientation = {0.00,0.00,-0.53,0.85,},},
			{id = 19,name = 'KeyFrame19',interpolant = 18,target = '|amusementpark_common_mission_grow|rock_elemental2',link = '',fov = 0.7854,position = {17024.48,8407.78,0.00,},orientation = {0.00,0.00,-0.42,0.91,},},
			{id = 20,name = 'KeyFrame20',interpolant = 19,target = '|amusementpark_common_mission_grow|rock_elemental2',link = '',fov = 0.7854,position = {17153.07,8558.50,0.00,},orientation = {0.00,0.00,-0.29,0.96,},},
			{id = 21,name = 'KeyFrame21',interpolant = 20,target = '|amusementpark_common_mission_grow|rock_elemental2',link = '',fov = 0.7854,position = {17320.86,8668.45,0.00,},orientation = {0.00,0.00,-0.16,0.99,},},
			{id = 22,name = 'KeyFrame22',interpolant = 21,target = '|amusementpark_common_mission_grow|rock_elemental2',link = '',fov = 0.7854,position = {17519.50,8735.30,0.00,},orientation = {0.00,0.00,-0.04,1.00,},},
			{id = 23,name = 'KeyFrame23',interpolant = 22,target = '|amusementpark_common_mission_grow|rock_elemental2',link = '',fov = 0.7854,position = {17733.34,8754.18,0.00,},orientation = {0.00,0.00,0.09,1.00,},},
			{id = 24,name = 'KeyFrame24',interpolant = 23,target = '|amusementpark_common_mission_grow|rock_elemental2',link = '',fov = 0.7854,position = {17940.44,8716.81,0.00,},orientation = {0.00,0.00,0.24,0.97,},},
			{id = 25,name = 'KeyFrame25',interpolant = 24,target = '|amusementpark_common_mission_grow|rock_elemental2',link = '',fov = 0.7854,position = {18029.72,8669.18,0.00,},orientation = {0.00,0.00,0.31,0.95,},},
		},
		events = 
		{
		},
	},
}