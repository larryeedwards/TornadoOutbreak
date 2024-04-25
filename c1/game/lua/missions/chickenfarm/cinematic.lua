--              
-- 
-- 
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
			{id = 1,name = 'KeyFrame1',interpolant = 0,target = 'avatar_opening',link = 'avatar_opening',fov = 1.047198,position = {-100.00,0.00,100.00,},orientation = {0.00,-0.17,0.00,0.98,},},
			{id = 2,name = 'KeyFrame2',interpolant = 0.04,target = 'avatar_opening',link = 'avatar_opening',fov = 1.047198,position = {-97.55,0.36,138.19,},orientation = {0.00,-0.39,0.00,0.92,},},
			{id = 3,name = 'KeyFrame3',interpolant = 0.11,target = 'avatar_opening',link = 'avatar_opening',fov = 1.047198,position = {-273.37,27.49,216.93,},orientation = {-0.02,-0.30,0.05,0.95,},},
			{id = 4,name = 'KeyFrame4',interpolant = 0.15,target = 'avatar_opening',link = 'avatar_opening',fov = 1.22173,position = {-262.06,22.29,233.06,},orientation = {-0.01,-0.34,0.03,0.94,},},
			{id = 5,name = 'KeyFrame5',interpolant = 0.2,target = 'avatar_opening',link = 'avatar_opening',fov = 1.047198,position = {-297.41,11.14,219.25,},orientation = {0.00,-0.31,0.01,0.95,},},
			{id = 6,name = 'KeyFrame6',interpolant = 0.25,target = 'avatar_opening',link = 'avatar_opening',fov = 1.047198,position = {-265.14,76.95,133.57,},orientation = {-0.04,-0.19,0.13,0.97,},},
			{id = 7,name = 'KeyFrame7',interpolant = 0.3,target = 'avatar_opening',link = 'avatar_opening',fov = 1.047198,position = {-232.26,166.00,175.12,},orientation = {-0.11,-0.25,0.28,0.92,},},
			{id = 8,name = 'KeyFrame8',interpolant = 0.35,target = 'avatar_opening',link = 'avatar_opening',fov = 1.047198,position = {-119.53,402.40,42.15,},orientation = {-0.03,-0.01,0.58,0.82,},},
			{id = 9,name = 'KeyFrame9',interpolant = 0.4,target = 'avatar_opening',link = 'avatar_opening',fov = 1.047198,position = {91.07,354.87,-0.99,},orientation = {0.01,0.04,0.77,0.63,},},
			{id = 10,name = 'KeyFrame10',interpolant = 0.45,target = 'avatar_opening',link = 'avatar_opening',fov = 1.047198,position = {190.34,339.26,23.25,},orientation = {0.00,-0.02,0.85,0.53,},},
			{id = 11,name = 'KeyFrame11',interpolant = 0.5,target = 'avatar_opening',link = 'avatar_opening',fov = 1.047198,position = {186.41,313.99,3.21,},orientation = {0.07,-0.04,0.85,0.52,},},
			{id = 12,name = 'KeyFrame12',interpolant = 0.55,target = 'avatar_opening',link = 'avatar_opening',fov = 1.047198,position = {23.24,318.66,221.65,},orientation = {-0.17,-0.25,0.67,0.68,},},
			{id = 13,name = 'KeyFrame13',interpolant = 0.6,target = 'avatar_opening',link = 'avatar_opening',fov = 1.047198,position = {-228.04,57.64,229.21,},orientation = {-0.03,-0.34,0.08,0.93,},},
			{id = 14,name = 'KeyFrame14',interpolant = 0.65,target = 'avatar_opening',link = 'avatar_opening',fov = 1.047198,position = {-295.33,15.97,237.79,},orientation = {0.00,-0.30,0.00,0.95,},},
			{id = 15,name = 'KeyFrame15',interpolant = 0.7,target = 'avatar_opening',link = 'avatar_opening',fov = 1.047198,position = {-257.17,-131.10,7.23,},orientation = {0.02,0.00,-0.19,0.98,},},
			{id = 16,name = 'KeyFrame16',interpolant = 0.75,target = 'avatar_opening',link = 'avatar_opening',fov = 1.047198,position = {-262.75,-137.94,18.25,},orientation = {0.02,-0.05,-0.22,0.97,},},
			{id = 17,name = 'KeyFrame17',interpolant = 0.8,target = 'avatar_opening',link = 'avatar_opening',fov = 1.047198,position = {-221.77,-226.24,101.22,},orientation = {0.03,-0.12,-0.36,0.92,},},
			{id = 18,name = 'KeyFrame18',interpolant = 0.85,target = 'avatar_opening',link = 'avatar_opening',fov = 0.9599317,position = {-115.52,-399.95,107.07,},orientation = {0.03,-0.10,-0.58,0.81,},},
			{id = 19,name = 'KeyFrame19',interpolant = 0.91,target = 'avatar_opening',link = 'avatar_opening',fov = 0.8726652,position = {-139.83,-316.33,179.06,},orientation = {0.13,-0.20,-0.52,0.82,},},
			{id = 20,name = 'KeyFrame20',interpolant = 0.93,target = 'avatar_opening',link = 'avatar_opening',fov = 0.9599311,position = {-130.19,-215.65,150.78,},orientation = {0.17,-0.21,-0.43,0.86,},},
			{id = 21,name = 'KeyFrame21',interpolant = 0.96,target = 'avatar_opening',link = 'avatar_opening',fov = 1.134464,position = {-12.31,-118.46,123.89,},orientation = {0.33,-0.22,-0.58,0.71,},},
			{id = 22,name = 'KeyFrame22',interpolant = 0.98,target = 'avatar_opening',link = 'avatar_opening',fov = 1.22173,position = {22.55,-258.89,36.14,},orientation = {0.13,0.04,-0.71,0.69,},},
			{id = 23,name = 'KeyFrame23',interpolant = 0.99,target = 'avatar_opening',link = 'avatar_opening',fov = 1.22173,position = {50.00,-309.87,-10.01,},orientation = {0.07,0.15,-0.75,0.64,},},
			{id = 24,name = 'KeyFrame24',interpolant = 1,target = 'avatar_opening',link = 'avatar_opening',fov = 1.22173,position = {50.00,-640.00,20.00,},orientation = {0.00,0.00,0.91,-0.42,},},
			{id = 25,name = 'KeyFrame25',interpolant = 1.1,target = 'avatar_opening',link = 'avatar_opening',fov = 1.22173,position = {50.00,-600.00,50.00,},orientation = {0.00,0.00,0.91,-0.42,},},
		},
		events = 
		{
			{id = 1,name = 'Start',interpolant = 0,object = 'openingcamera',label = 'cinematic_start',},
			{id = 5,name = 'Split',interpolant = 0.95,object = 'openingcamera',label = 'cinematic_split',},
			{id = 6,name = 'Shadow',interpolant = 0.95,object = 'openingcamera',label = 'cinematic_shadow',},
			{id = 8,name = 'End',interpolant = 0.99,object = 'openingcamera',label = 'cinematic_at_end',},
		},
	},
	{
		id = 2,
		name = 'transition_01',
		interpolation = 'tornadoclone1',
		duration = 1,
		smooth = true,
		stitch = false,
		loop = false,
		keyframes = 
		{
			{id = 1,name = 'KeyFrame1',interpolant = 0,target = '',link = '',fov = 0.7854,position = {-4088.44,16660.47,-1288.19,},orientation = {-0.05,-0.04,0.79,0.62,},},
			{id = 2,name = 'KeyFrame2',interpolant = 0.15,target = '',link = '',fov = 0.7854,position = {-4088.44,16660.47,-1288.19,},orientation = {-0.05,-0.04,0.80,0.61,},},
			{id = 3,name = 'KeyFrame3',interpolant = 0.3,target = '',link = '',fov = 0.7854,position = {-4088.44,16660.47,-1288.19,},orientation = {-0.05,-0.04,0.82,0.60,},},
			{id = 4,name = 'KeyFrame4',interpolant = 0.5,target = '',link = '',fov = 0.7854,position = {-5377.80,12227.85,-302.66,},orientation = {-0.01,-0.01,0.83,0.55,},},
			{id = 5,name = 'KeyFrame5',interpolant = 0.7,target = '',link = '',fov = 0.7854,position = {-7672.26,6687.15,-470.19,},orientation = {-0.04,-0.01,0.99,0.11,},},
			{id = 6,name = 'KeyFrame6',interpolant = 0.8,target = '',link = '',fov = 0.7854,position = {-12646.07,4830.36,-353.78,},orientation = {-0.06,0.01,0.96,-0.28,},},
			{id = 7,name = 'KeyFrame7',interpolant = 0.93,target = '',link = '',fov = 0.7854,position = {-20659.14,9277.87,-1326.91,},orientation = {0.02,-0.10,-0.19,0.98,},},
			{id = 8,name = 'KeyFrame8',interpolant = 1,target = '',link = '',fov = 0.7854,position = {-19140.41,12708.29,-1292.29,},orientation = {-0.06,-0.11,0.49,0.86,},},
		},
		events = 
		{
			{id = 1,name = 'Start',interpolant = 0,object = '|cinematic1',label = 'cinematic_start',},
			{id = 3,name = 'End',interpolant = 0.99,object = '|cinematic1',label = 'cinematic_at_end',},
		},
	},
	{
		id = 3,
		name = 'transition_02',
		interpolation = 'tornadoclone2',
		duration = 1,
		smooth = true,
		stitch = false,
		loop = false,
		keyframes = 
		{
			{id = 1,name = 'KeyFrame1',interpolant = 0,target = '',link = '',fov = 0.7854,position = {-1126.03,-1974.85,-1371.87,},orientation = {0.01,-0.06,-0.19,0.98,},},
			{id = 2,name = 'KeyFrame2',interpolant = 0.15,target = '',link = '',fov = 0.7854,position = {-1126.03,-1974.85,-1371.87,},orientation = {0.01,-0.06,-0.19,0.98,},},
			{id = 3,name = 'KeyFrame3',interpolant = 0.3,target = '',link = '',fov = 0.7854,position = {5123.83,-102.79,-1112.13,},orientation = {-0.02,0.03,-0.53,0.84,},},
			{id = 4,name = 'KeyFrame4',interpolant = 0.5,target = '',link = '',fov = 0.7854,position = {11394.36,2298.45,-814.91,},orientation = {-0.02,0.01,-0.79,0.61,},},
			{id = 5,name = 'KeyFrame5',interpolant = 0.7,target = '',link = '',fov = 0.7854,position = {15003.29,10897.57,-617.22,},orientation = {0.00,0.00,1.00,-0.07,},},
			{id = 6,name = 'KeyFrame6',interpolant = 0.8,target = '',link = '',fov = 0.7854,position = {18684.38,22543.45,1355.84,},orientation = {-0.25,0.00,0.97,0.04,},},
			{id = 7,name = 'KeyFrame7',interpolant = 0.9,target = '',link = '',fov = 0.7854,position = {14208.39,27543.75,12.61,},orientation = {-0.24,-0.10,0.88,0.39,},},
			{id = 8,name = 'KeyFrame8',interpolant = 1,target = '',link = '',fov = 0.7854,position = {11478.54,27047.16,-499.02,},orientation = {-0.30,-0.23,0.74,0.57,},},
		},
		events = 
		{
			{id = 1,name = 'Start',interpolant = 0,object = '|cinematic2',label = 'cinematic_start',},
			{id = 3,name = 'End',interpolant = 0.99,object = '|cinematic2',label = 'cinematic_at_end',},
		},
	},
	{
		id = 4,
		name = 'cine_bosssetupA',
		interpolation = '__time__',
		duration = 6,
		smooth = true,
		stitch = false,
		loop = false,
		keyframes = 
		{
			{id = 1,name = 'KeyFrame1',interpolant = 0,target = '',link = '',fov = 0.7854,position = {-1126.03,-1974.85,-1371.87,},orientation = {0.01,-0.06,-0.19,0.98,},},
			{id = 2,name = 'KeyFrame2',interpolant = 3,target = '',link = '',fov = 0.7854,position = {-1126.03,-1974.85,-1371.87,},orientation = {0.01,-0.06,-0.19,0.98,},},
			{id = 3,name = 'KeyFrame3',interpolant = 6,target = '',link = '',fov = 0.7854,position = {5123.83,-102.79,-1112.13,},orientation = {-0.02,0.03,-0.53,0.84,},},
		},
		events = 
		{
			{id = 1,name = 'Start',interpolant = 0,object = '|cinematic3',label = 'cinematic_start',},
			{id = 2,name = 'Totem',interpolant = 2,object = '|cinematic3',label = 'cinematic_rise_totem',},
			{id = 2,name = 'End',interpolant = 6,object = '|cinematic3',label = 'cinematic_at_end',},
		},
	},
	{
		id = 5,
		name = 'barnIntro',
		interpolation = '__time__',
		duration = 17,
		smooth = true,
		stitch = true,
		loop = false,
		keyframes = 
		{
			{id = 1,name = 'KeyFrame1',interpolant = 0,target = '|chickenfarm_common_mission_grow|barncinematictarget',link = '',fov = 0.7854,position = {-4584.07,14266.85,1827.39,},orientation = {0.00,0.00,-0.12,0.99,},},
			{id = 2,name = 'KeyFrame2',interpolant = 1,target = '|chickenfarm_common_mission_grow|barncinematictarget',link = '',fov = 0.7854,position = {-3804.02,14450.39,1827.39,},orientation = {0.00,0.00,-0.21,0.98,},},
			{id = 3,name = 'KeyFrame3',interpolant = 2,target = '|chickenfarm_common_mission_grow|barncinematictarget',link = '',fov = 0.7854,position = {-2496.53,15043.89,1827.39,},orientation = {0.00,0.00,-0.34,0.94,},},
			{id = 4,name = 'KeyFrame4',interpolant = 3,target = '|chickenfarm_common_mission_grow|barncinematictarget',link = '',fov = 0.7854,position = {-1496.58,15891.86,1827.39,},orientation = {0.00,0.00,-0.52,0.85,},},
			{id = 5,name = 'KeyFrame5',interpolant = 4,target = '|chickenfarm_common_mission_grow|barncinematictarget',link = '',fov = 0.7854,position = {-910.27,17026.05,1827.39,},orientation = {0.00,0.00,-0.68,0.73,},},
			{id = 6,name = 'KeyFrame6',interpolant = 5,target = '|chickenfarm_common_mission_grow|barncinematictarget',link = '',fov = 0.7854,position = {-821.87,18396.51,1827.39,},orientation = {0.00,0.00,-0.80,0.60,},},
			{id = 7,name = 'KeyFrame7',interpolant = 6,target = '|chickenfarm_common_mission_grow|barncinematictarget',link = '',fov = 0.7854,position = {-1249.49,19821.01,1827.39,},orientation = {0.00,0.00,-0.90,0.45,},},
			{id = 8,name = 'KeyFrame8',interpolant = 7,target = '|chickenfarm_common_mission_grow|barncinematictarget',link = '',fov = 0.7854,position = {-2170.35,21036.78,1827.39,},orientation = {0.00,0.00,-0.97,0.25,},},
			{id = 9,name = 'KeyFrame9',interpolant = 8,target = '|chickenfarm_common_mission_grow|barncinematictarget',link = '',fov = 0.7854,position = {-3516.69,21798.28,1827.39,},orientation = {0.00,0.00,-1.00,0.05,},},
			{id = 10,name = 'KeyFrame10',interpolant = 9,target = '|chickenfarm_common_mission_grow|barncinematictarget',link = '',fov = 0.7854,position = {-5114.38,21947.95,1827.39,},orientation = {0.00,0.00,0.99,0.15,},},
			{id = 11,name = 'KeyFrame11',interpolant = 10,target = '|chickenfarm_common_mission_grow|barncinematictarget',link = '',fov = 0.7854,position = {-6674.10,21447.62,1827.39,},orientation = {0.00,0.00,0.94,0.35,},},
			{id = 12,name = 'KeyFrame12',interpolant = 11,target = '|chickenfarm_common_mission_grow|barncinematictarget',link = '',fov = 0.7854,position = {-7881.38,20385.34,1827.39,},orientation = {0.00,0.00,0.84,0.54,},},
			{id = 13,name = 'KeyFrame13',interpolant = 12,target = '|chickenfarm_common_mission_grow|barncinematictarget',link = '',fov = 0.7854,position = {-8517.10,18961.24,1827.39,},orientation = {0.00,0.00,0.71,0.71,},},
			{id = 14,name = 'KeyFrame14',interpolant = 13,target = '|chickenfarm_common_mission_grow|barncinematictarget',link = '',fov = 0.7854,position = {-8522.17,17434.73,1827.39,},orientation = {0.00,0.00,0.56,0.83,},},
			{id = 15,name = 'KeyFrame15',interpolant = 14,target = '|chickenfarm_common_mission_grow|barncinematictarget',link = '',fov = 0.7854,position = {-7960.67,16047.04,1827.39,},orientation = {0.00,0.00,0.39,0.92,},},
			{id = 16,name = 'KeyFrame16',interpolant = 15,target = '|chickenfarm_common_mission_grow|barncinematictarget',link = '',fov = 0.7854,position = {-6929.55,14976.54,1827.39,},orientation = {0.00,0.00,0.21,0.98,},},
			{id = 17,name = 'KeyFrame17',interpolant = 16,target = '|chickenfarm_common_mission_grow|barncinematictarget',link = '',fov = 0.7854,position = {-5500.36,14337.85,1827.39,},orientation = {0.00,0.00,0.04,1.00,},},
			{id = 18,name = 'KeyFrame18',interpolant = 17,target = '|chickenfarm_common_mission_grow|barncinematictarget',link = '',fov = 0.7854,position = {-4604.47,14266.85,1827.39,},orientation = {0.00,0.00,0.00,1.00,},},
		},
		events = 
		{
		},
	},
	{
		id = 6,
		name = 'toBarn',
		interpolation = '__time__',
		duration = 3,
		smooth = true,
		stitch = false,
		loop = false,
		keyframes = 
		{
			{id = 6,name = 'KeyFrame6',interpolant = 0,target = '|chickenfarm_common_mission_grow|barncinematictarget',link = '',fov = 0.7854,position = {-11327.67,20800.96,41.56,},orientation = {-0.01,0.07,-0.12,0.99,},},
			{id = 8,name = 'KeyFrame8',interpolant = 1.25,target = '|chickenfarm_common_mission_grow|barncinematictarget',link = '',fov = 0.7854,position = {-8286.69,16122.55,1157.09,},orientation = {0.01,0.04,0.23,0.97,},},
			{id = 9,name = 'KeyFrame9',interpolant = 3,target = '|chickenfarm_common_mission_grow|barncinematictarget',link = '',fov = 0.7854,position = {-4552.51,14288.68,1824.59,},orientation = {0.00,0.00,-0.92,0.39,},},
		},
		events = 
		{
		},
	},
	{
		id = 7,
		name = 'siloIntro',
		interpolation = '__time__',
		duration = 19,
		smooth = true,
		stitch = false,
		loop = false,
		keyframes = 
		{
			{id = 1,name = 'KeyFrame1',interpolant = 0,target = '|chickenfarm_common_mission_grow|silocameratarget',link = '',fov = 0.7854,position = {-19798.61,21513.13,1450.99,},orientation = {0.00,0.00,-0.31,0.95,},},
			{id = 2,name = 'KeyFrame2',interpolant = 1,target = '|chickenfarm_common_mission_grow|silocameratarget',link = '',fov = 0.7854,position = {-19484.17,21742.29,1450.99,},orientation = {0.00,0.00,-0.40,0.92,},},
			{id = 3,name = 'KeyFrame3',interpolant = 2,target = '|chickenfarm_common_mission_grow|silocameratarget',link = '',fov = 0.7854,position = {-18981.47,22289.69,1450.99,},orientation = {0.00,0.00,-0.51,0.86,},},
			{id = 4,name = 'KeyFrame4',interpolant = 3,target = '|chickenfarm_common_mission_grow|silocameratarget',link = '',fov = 0.7854,position = {-18635.38,22936.22,1450.99,},orientation = {0.00,0.00,-0.65,0.76,},},
			{id = 5,name = 'KeyFrame5',interpolant = 4,target = '|chickenfarm_common_mission_grow|silocameratarget',link = '',fov = 0.7854,position = {-18508.48,23687.14,1450.99,},orientation = {0.00,0.00,-0.77,0.64,},},
			{id = 6,name = 'KeyFrame6',interpolant = 5,target = '|chickenfarm_common_mission_grow|silocameratarget',link = '',fov = 0.7854,position = {-18657.63,24499.36,1450.99,},orientation = {0.00,0.00,-0.87,0.50,},},
			{id = 7,name = 'KeyFrame7',interpolant = 6,target = '|chickenfarm_common_mission_grow|silocameratarget',link = '',fov = 0.7854,position = {-19095.61,25260.99,1450.99,},orientation = {0.00,0.00,-0.94,0.34,},},
			{id = 8,name = 'KeyFrame8',interpolant = 7,target = '|chickenfarm_common_mission_grow|silocameratarget',link = '',fov = 0.7854,position = {-19784.81,25832.95,1450.99,},orientation = {0.00,0.00,-0.99,0.16,},},
			{id = 9,name = 'KeyFrame9',interpolant = 8,target = '|chickenfarm_common_mission_grow|silocameratarget',link = '',fov = 0.7854,position = {-20644.66,26112.56,1450.99,},orientation = {0.00,0.00,1.00,0.03,},},
			{id = 10,name = 'KeyFrame10',interpolant = 9,target = '|chickenfarm_common_mission_grow|silocameratarget',link = '',fov = 0.7854,position = {-21555.50,26062.57,1450.99,},orientation = {0.00,0.00,0.98,0.20,},},
			{id = 11,name = 'KeyFrame11',interpolant = 10,target = '|chickenfarm_common_mission_grow|silocameratarget',link = '',fov = 0.7854,position = {-22375.27,25706.90,1450.99,},orientation = {0.00,0.00,0.93,0.38,},},
			{id = 12,name = 'KeyFrame12',interpolant = 11,target = '|chickenfarm_common_mission_grow|silocameratarget',link = '',fov = 0.7854,position = {-22982.79,25114.06,1450.99,},orientation = {0.00,0.00,0.84,0.54,},},
			{id = 13,name = 'KeyFrame13',interpolant = 12,target = '|chickenfarm_common_mission_grow|silocameratarget',link = '',fov = 0.7854,position = {-23321.56,24368.39,1450.99,},orientation = {0.00,0.00,0.74,0.68,},},
			{id = 14,name = 'KeyFrame14',interpolant = 13,target = '|chickenfarm_common_mission_grow|silocameratarget',link = '',fov = 0.7854,position = {-23393.72,23548.10,1450.99,},orientation = {0.00,0.00,0.63,0.78,},},
			{id = 15,name = 'KeyFrame15',interpolant = 14,target = '|chickenfarm_common_mission_grow|silocameratarget',link = '',fov = 0.7854,position = {-23213.08,22736.69,1450.99,},orientation = {0.00,0.00,0.49,0.87,},},
			{id = 16,name = 'KeyFrame16',interpolant = 15,target = '|chickenfarm_common_mission_grow|silocameratarget',link = '',fov = 0.7854,position = {-22792.07,22032.74,1450.99,},orientation = {0.00,0.00,0.34,0.94,},},
			{id = 17,name = 'KeyFrame17',interpolant = 16,target = '|chickenfarm_common_mission_grow|silocameratarget',link = '',fov = 0.7854,position = {-22174.52,21519.90,1450.99,},orientation = {0.00,0.00,0.18,0.98,},},
			{id = 18,name = 'KeyFrame18',interpolant = 17,target = '|chickenfarm_common_mission_grow|silocameratarget',link = '',fov = 0.7854,position = {-21446.34,21238.87,1450.99,},orientation = {0.00,0.00,0.03,1.00,},},
			{id = 19,name = 'KeyFrame19',interpolant = 18,target = '|chickenfarm_common_mission_grow|silocameratarget',link = '',fov = 0.7854,position = {-20706.34,21199.04,1450.99,},orientation = {0.00,0.00,-0.15,0.99,},},
			{id = 20,name = 'KeyFrame20',interpolant = 19,target = '|chickenfarm_common_mission_grow|silocameratarget',link = '',fov = 0.7854,position = {-20374.18,21299.96,1450.99,},orientation = {0.00,0.00,-0.18,0.98,},},
		},
		events = 
		{
		},
	},
	{
		id = 8,
		name = 'toSilo',
		interpolation = '__time__',
		duration = 7.75,
		smooth = true,
		stitch = false,
		loop = false,
		keyframes = 
		{
			{id = 10,name = 'KeyFrame10',interpolant = 0,target = '',link = '',fov = 0.7854,position = {-5744.78,8356.87,-259.84,},orientation = {0.00,0.00,0.99,-0.16,},},
			{id = 11,name = 'KeyFrame11',interpolant = 1,target = '',link = '',fov = 0.7854,position = {-6478.89,8186.86,-90.28,},orientation = {-0.02,0.00,0.98,-0.20,},},
			{id = 12,name = 'KeyFrame12',interpolant = 2,target = '',link = '',fov = 0.7854,position = {-7998.93,8011.64,220.73,},orientation = {-0.06,0.02,0.97,-0.24,},},
			{id = 13,name = 'KeyFrame13',interpolant = 3,target = '',link = '',fov = 0.7854,position = {-11288.39,8681.04,121.25,},orientation = {-0.07,0.02,0.94,-0.34,},},
			{id = 14,name = 'KeyFrame14',interpolant = 4,target = '',link = '',fov = 0.7854,position = {-14802.70,10380.25,106.41,},orientation = {-0.07,0.03,0.91,-0.40,},},
			{id = 15,name = 'KeyFrame15',interpolant = 5,target = '',link = '',fov = 0.7854,position = {-18416.13,12579.54,-456.69,},orientation = {-0.02,0.01,-0.82,0.57,},},
			{id = 16,name = 'KeyFrame16',interpolant = 6,target = '',link = '',fov = 0.7854,position = {-20531.93,16056.43,-402.66,},orientation = {-0.01,0.01,-0.68,0.73,},},
			{id = 17,name = 'KeyFrame17',interpolant = 7,target = '|chickenfarm_common_mission_grow|silocameratarget',link = '',fov = 0.7854,position = {-20117.08,19920.86,283.01,},orientation = {0.03,-0.03,-0.72,0.69,},},
			{id = 18,name = 'KeyFrame18',interpolant = 7.75,target = '|chickenfarm_common_mission_grow|silocameratarget',link = '',fov = 0.7854,position = {-19798.61,21513.13,1450.99,},orientation = {0.15,-0.12,-0.78,0.59,},},
		},
		events = 
		{
		},
	},
	{
		id = 9,
		name = 'followSprites',
		interpolation = '__time__',
		duration = 7,
		smooth = false,
		stitch = false,
		loop = false,
		keyframes = 
		{
			{id = 1,name = 'KeyFrame1',interpolant = 0,target = '|chickenfarm_common_mission_grow|cinema_firesprite1',link = '',fov = 0.7854,position = {-21303.85,22853.10,1874.85,},orientation = {0.00,0.00,-0.61,0.79,},},
			{id = 2,name = 'KeyFrame2',interpolant = 0.3,target = '|chickenfarm_common_mission_grow|cinema_firesprite1',link = '',fov = 0.7854,position = {-21173.43,23347.61,1874.85,},orientation = {0.00,0.00,-0.61,0.79,},},
			{id = 3,name = 'KeyFrame3',interpolant = 1,target = '|chickenfarm_common_mission_grow|cinema_firesprite1',link = '',fov = 0.7854,position = {-20912.58,24336.64,1874.85,},orientation = {0.00,0.00,-0.88,0.47,},},
			{id = 6,name = 'KeyFrame6',interpolant = 3,target = '|chickenfarm_common_mission_grow|cinema_firesprite1',link = '',fov = 0.7854,position = {-22349.44,26847.81,1874.85,},orientation = {0.00,0.00,0.97,-0.23,},},
			{id = 4,name = 'KeyFrame4',interpolant = 5,target = '|chickenfarm_common_mission_grow|cinema_firesprite1',link = '',fov = 0.7854,position = {-24120.34,29194.10,1874.85,},orientation = {0.00,0.00,1.00,0.07,},},
			{id = 5,name = 'KeyFrame5',interpolant = 7,target = '|chickenfarm_common_mission_grow|cinema_firesprite1',link = '',fov = 0.7854,position = {-26812.68,28643.31,649.47,},orientation = {0.01,-0.01,-0.52,0.86,},},
		},
		events = 
		{
		},
	},
	{
		id = 10,
		name = 'followSprites2',
		interpolation = '__time__',
		duration = 6,
		smooth = true,
		stitch = false,
		loop = false,
		keyframes = 
		{
			{id = 6,name = 'KeyFrame6',interpolant = 0,target = '|chickenfarm_common_mission_grow|cinema_firesprite1',link = '',fov = 0.7854,position = {-19445.09,23261.04,1233.38,},orientation = {-0.35,0.16,0.84,-0.38,},},
			{id = 11,name = 'KeyFrame11',interpolant = 3,target = '|chickenfarm_common_mission_grow|cinema_firesprite1',link = '',fov = 0.7854,position = {-18302.83,23939.29,213.88,},orientation = {-0.03,0.02,0.87,-0.49,},},
			{id = 13,name = 'KeyFrame13',interpolant = 6,target = '|chickenfarm_common_mission_grow|cinema_firesprite1',link = '',fov = 0.7854,position = {-18322.68,24044.90,1.12,},orientation = {-0.08,0.00,1.00,-0.05,},},
			{id = 9,name = 'KeyFrame9',interpolant = 6,target = '|chickenfarm_common_mission_grow|cinema_firesprite1',link = '',fov = 0.7854,position = {-18322.68,24044.90,1.12,},orientation = {0.00,0.00,0.91,-0.41,},},
		},
		events = 
		{
		},
	},
	{
		id = 11,
		name = 'cine_opening',
		interpolation = '__time__',
		duration = 9,
		smooth = true,
		stitch = false,
		loop = false,
		keyframes = 
		{
			{id = 1,name = 'KeyFrame1',interpolant = 0,target = '',link = '',fov = 0.7854,position = {3972.22,30830.84,3453.36,},orientation = {-0.09,-0.12,0.60,0.79,},},
			{id = 2,name = 'KeyFrame2',interpolant = 2.5,target = '',link = '',fov = 0.7854,position = {-1047.40,24142.34,2037.70,},orientation = {-0.01,-0.08,0.10,0.99,},},
			{id = 3,name = 'KeyFrame3',interpolant = 4.75,target = '',link = '',fov = 0.7854,position = {2105.19,17430.53,1851.89,},orientation = {0.04,-0.07,-0.45,0.89,},},
			{id = 4,name = 'KeyFrame4',interpolant = 7,target = '',link = '',fov = 0.7854,position = {6988.91,17026.68,-10.83,},orientation = {-0.07,0.06,-0.75,0.65,},},
			{id = 5,name = 'KeyFrame5',interpolant = 9,target = '',link = '',fov = 0.9773844,position = {9905.64,18703.55,226.56,},orientation = {0.06,-0.03,0.92,-0.38,},},
		},
		events = 
		{
			{id = 1,name = 'Start',interpolant = 0,object = '|bossintro',label = 'cinematic_start',},
			{id = 3,name = 'Rise',interpolant = 6,object = '|chickenfarm_common_mission_grow|totem_one_a1',label = 'rise',},
			{id = 2,name = 'End',interpolant = 9,object = '|bossintro',label = 'cinematic_at_end',},
		},
	},
	{
		id = 12,
		name = 'Totem1_Frame',
		interpolation = '__time__',
		duration = 0.25,
		smooth = false,
		stitch = false,
		loop = false,
		keyframes = 
		{
			{id = 1,name = 'KeyFrame1',interpolant = 0,target = '',link = '',fov = 0.7854,position = {6997.78,17593.03,1005.94,},orientation = {0.10,-0.08,-0.76,0.63,},},
			{id = 2,name = 'KeyFrame2',interpolant = 0.25,target = '',link = '',fov = 0.7854,position = {6997.78,17593.03,1005.94,},orientation = {0.10,-0.08,-0.76,0.63,},},
		},
		events = 
		{
		},
	},
	{
		id = 13,
		name = 'Totem1_Down',
		interpolation = '__time__',
		duration = 0.25,
		smooth = false,
		stitch = false,
		loop = false,
		keyframes = 
		{
			{id = 1,name = 'KeyFrame1',interpolant = 0,target = '',link = '',fov = 0.7854,position = {5861.11,19034.91,-58.75,},orientation = {-0.11,0.17,-0.53,0.82,},},
			{id = 2,name = 'KeyFrame2',interpolant = 0.25,target = '',link = '',fov = 0.7854,position = {5861.11,19034.91,-58.75,},orientation = {-0.11,0.17,-0.53,0.82,},},
		},
		events = 
		{
		},
	},
	{
		id = 14,
		name = 'Totem1_Up',
		interpolation = '__time__',
		duration = 0.25,
		smooth = false,
		stitch = false,
		loop = false,
		keyframes = 
		{
			{id = 1,name = 'KeyFrame1',interpolant = 0,target = '',link = '',fov = 0.7854,position = {7752.99,19727.80,1295.55,},orientation = {-0.22,0.07,0.93,-0.29,},},
			{id = 2,name = 'KeyFrame2',interpolant = 0.25,target = '',link = '',fov = 0.7854,position = {7752.99,19727.80,1295.55,},orientation = {-0.22,0.07,0.93,-0.29,},},
		},
		events = 
		{
		},
	},
	{
		id = 15,
		name = 'barnSlowdown',
		interpolation = '__system__',
		duration = 17,
		smooth = true,
		stitch = false,
		loop = false,
		keyframes = 
		{
			{id = 1,name = 'KeyFrame1',interpolant = 0,target = '|chickenfarm_common_mission_grow|barncinematictarget',link = '',fov = 0.7854,position = {-4584.07,14266.85,1827.39,},orientation = {0.00,0.00,-0.12,0.99,},},
			{id = 2,name = 'KeyFrame2',interpolant = 1,target = '|chickenfarm_common_mission_grow|barncinematictarget',link = '',fov = 0.7854,position = {-3804.02,14450.39,1827.39,},orientation = {0.00,0.00,-0.21,0.98,},},
			{id = 3,name = 'KeyFrame3',interpolant = 2,target = '|chickenfarm_common_mission_grow|barncinematictarget',link = '',fov = 0.7854,position = {-2496.53,15043.89,1827.39,},orientation = {0.00,0.00,-0.34,0.94,},},
			{id = 4,name = 'KeyFrame4',interpolant = 3,target = '|chickenfarm_common_mission_grow|barncinematictarget',link = '',fov = 0.7854,position = {-1496.58,15891.86,1827.39,},orientation = {0.00,0.00,-0.52,0.85,},},
			{id = 5,name = 'KeyFrame5',interpolant = 4,target = '|chickenfarm_common_mission_grow|barncinematictarget',link = '',fov = 0.7854,position = {-910.27,17026.05,1827.39,},orientation = {0.00,0.00,-0.68,0.73,},},
			{id = 6,name = 'KeyFrame6',interpolant = 5,target = '|chickenfarm_common_mission_grow|barncinematictarget',link = '',fov = 0.7854,position = {-821.87,18396.51,1827.39,},orientation = {0.00,0.00,-0.80,0.60,},},
			{id = 7,name = 'KeyFrame7',interpolant = 6,target = '|chickenfarm_common_mission_grow|barncinematictarget',link = '',fov = 0.7854,position = {-1249.49,19821.01,1827.39,},orientation = {0.00,0.00,-0.90,0.45,},},
			{id = 8,name = 'KeyFrame8',interpolant = 7,target = '|chickenfarm_common_mission_grow|barncinematictarget',link = '',fov = 0.7854,position = {-2170.35,21036.78,1827.39,},orientation = {0.00,0.00,-0.97,0.25,},},
			{id = 9,name = 'KeyFrame9',interpolant = 8,target = '|chickenfarm_common_mission_grow|barncinematictarget',link = '',fov = 0.7854,position = {-3516.69,21798.28,1827.39,},orientation = {0.00,0.00,-1.00,0.05,},},
			{id = 10,name = 'KeyFrame10',interpolant = 9,target = '|chickenfarm_common_mission_grow|barncinematictarget',link = '',fov = 0.7854,position = {-5114.38,21947.95,1827.39,},orientation = {0.00,0.00,0.99,0.15,},},
			{id = 11,name = 'KeyFrame11',interpolant = 10,target = '|chickenfarm_common_mission_grow|barncinematictarget',link = '',fov = 0.7854,position = {-6674.10,21447.62,1827.39,},orientation = {0.00,0.00,0.94,0.35,},},
			{id = 12,name = 'KeyFrame12',interpolant = 11,target = '|chickenfarm_common_mission_grow|barncinematictarget',link = '',fov = 0.7854,position = {-7881.38,20385.34,1827.39,},orientation = {0.00,0.00,0.84,0.54,},},
			{id = 13,name = 'KeyFrame13',interpolant = 12,target = '|chickenfarm_common_mission_grow|barncinematictarget',link = '',fov = 0.7854,position = {-8517.10,18961.24,1827.39,},orientation = {0.00,0.00,0.71,0.71,},},
			{id = 14,name = 'KeyFrame14',interpolant = 13,target = '|chickenfarm_common_mission_grow|barncinematictarget',link = '',fov = 0.7854,position = {-8522.17,17434.73,1827.39,},orientation = {0.00,0.00,0.56,0.83,},},
			{id = 15,name = 'KeyFrame15',interpolant = 14,target = '|chickenfarm_common_mission_grow|barncinematictarget',link = '',fov = 0.7854,position = {-7960.67,16047.04,1827.39,},orientation = {0.00,0.00,0.39,0.92,},},
			{id = 16,name = 'KeyFrame16',interpolant = 15,target = '|chickenfarm_common_mission_grow|barncinematictarget',link = '',fov = 0.7854,position = {-6929.55,14976.54,1827.39,},orientation = {0.00,0.00,0.21,0.98,},},
			{id = 17,name = 'KeyFrame17',interpolant = 16,target = '|chickenfarm_common_mission_grow|barncinematictarget',link = '',fov = 0.7854,position = {-5500.36,14337.85,1827.39,},orientation = {0.00,0.00,0.04,1.00,},},
			{id = 18,name = 'KeyFrame18',interpolant = 17,target = '|chickenfarm_common_mission_grow|barncinematictarget',link = '',fov = 0.7854,position = {-4604.47,14266.85,1827.39,},orientation = {0.00,0.00,0.00,1.00,},},
		},
		events = 
		{
		},
	},
	{
		id = 16,
		name = 'loadIntro2',
		interpolation = '__time__',
		duration = 16,
		smooth = true,
		stitch = false,
		loop = false,
		keyframes = 
		{
			{id = 18,name = 'KeyFrame18',interpolant = 0,target = 'loadcameratarget',link = '',fov = 0.7854,position = {-6157.84,5756.07,304.40,},orientation = {0.00,0.00,-0.11,0.99,},},
			{id = 19,name = 'KeyFrame19',interpolant = 1,target = '|chickenfarm_common_mission_grow|loadcameratarget',link = '',fov = 0.7854,position = {-5948.10,5802.44,304.40,},orientation = {0.00,0.00,-0.22,0.98,},},
			{id = 20,name = 'KeyFrame20',interpolant = 2,target = '|chickenfarm_common_mission_grow|loadcameratarget',link = '',fov = 0.7854,position = {-5572.86,5976.35,304.40,},orientation = {0.00,0.00,-0.34,0.94,},},
			{id = 21,name = 'KeyFrame21',interpolant = 3,target = '|chickenfarm_common_mission_grow|loadcameratarget',link = '',fov = 0.7854,position = {-5259.96,6239.53,304.40,},orientation = {0.00,0.00,-0.50,0.87,},},
			{id = 22,name = 'KeyFrame22',interpolant = 4,target = '|chickenfarm_common_mission_grow|loadcameratarget',link = '',fov = 0.7854,position = {-5050.01,6597.96,304.40,},orientation = {0.00,0.00,-0.65,0.76,},},
			{id = 23,name = 'KeyFrame23',interpolant = 5,target = '|chickenfarm_common_mission_grow|loadcameratarget',link = '',fov = 0.7854,position = {-4987.92,7027.37,304.40,},orientation = {0.00,0.00,-0.79,0.62,},},
			{id = 24,name = 'KeyFrame24',interpolant = 6,target = '|chickenfarm_common_mission_grow|loadcameratarget',link = '',fov = 0.7854,position = {-5097.14,7464.92,304.40,},orientation = {0.00,0.00,-0.89,0.45,},},
			{id = 25,name = 'KeyFrame25',interpolant = 7,target = '|chickenfarm_common_mission_grow|loadcameratarget',link = '',fov = 0.7854,position = {-5369.15,7836.70,304.40,},orientation = {0.00,0.00,-0.96,0.27,},},
			{id = 26,name = 'KeyFrame26',interpolant = 8,target = '|chickenfarm_common_mission_grow|loadcameratarget',link = '',fov = 0.7854,position = {-5769.08,8084.42,304.40,},orientation = {0.00,0.00,-1.00,0.09,},},
			{id = 27,name = 'KeyFrame27',interpolant = 9,target = '|chickenfarm_common_mission_grow|loadcameratarget',link = '',fov = 0.7854,position = {-6241.56,8169.51,304.40,},orientation = {0.00,0.00,0.99,0.10,},},
			{id = 28,name = 'KeyFrame28',interpolant = 10,target = '|chickenfarm_common_mission_grow|loadcameratarget',link = '',fov = 0.7854,position = {-6712.43,8073.05,304.40,},orientation = {0.00,0.00,0.95,0.30,},},
			{id = 29,name = 'KeyFrame29',interpolant = 11,target = '|chickenfarm_common_mission_grow|loadcameratarget',link = '',fov = 0.7854,position = {-7100.28,7800.79,304.40,},orientation = {0.00,0.00,0.87,0.50,},},
			{id = 30,name = 'KeyFrame30',interpolant = 12,target = '|chickenfarm_common_mission_grow|loadcameratarget',link = '',fov = 0.7854,position = {-7340.86,7385.71,304.40,},orientation = {0.00,0.00,0.75,0.66,},},
			{id = 31,name = 'KeyFrame31',interpolant = 13,target = '|chickenfarm_common_mission_grow|loadcameratarget',link = '',fov = 0.7854,position = {-7399.30,6888.01,304.40,},orientation = {0.00,0.00,0.60,0.80,},},
			{id = 32,name = 'KeyFrame32',interpolant = 14,target = '|chickenfarm_common_mission_grow|loadcameratarget',link = '',fov = 0.7854,position = {-7257.99,6389.32,304.40,},orientation = {0.00,0.00,0.42,0.91,},},
			{id = 33,name = 'KeyFrame33',interpolant = 15,target = '|chickenfarm_common_mission_grow|loadcameratarget',link = '',fov = 0.7854,position = {-6907.64,5971.14,304.40,},orientation = {0.00,0.00,0.23,0.97,},},
			{id = 34,name = 'KeyFrame34',interpolant = 16,target = '|chickenfarm_common_mission_grow|loadcameratarget',link = '',fov = 0.7854,position = {-6630.32,5831.14,304.40,},orientation = {0.00,0.00,0.08,1.00,},},
		},
		events = 
		{
		},
	},
	{
		id = 17,
		name = 'cine_bossdestroy',
		interpolation = '__time__',
		duration = 12,
		smooth = true,
		stitch = false,
		loop = false,
		keyframes = 
		{
			{id = 1,name = 'KeyFrame1',interpolant = 0,target = '',link = '',fov = 0.7854,position = {11045.64,17468.91,2148.18,},orientation = {-0.04,0.02,0.92,-0.39,},},
			{id = 2,name = 'KeyFrame2',interpolant = 4,target = '',link = '',fov = 0.8726646,position = {8424.93,17098.12,1302.23,},orientation = {0.01,0.00,-0.83,0.56,},},
			{id = 3,name = 'KeyFrame3',interpolant = 6,target = '',link = '',fov = 0.9599311,position = {5449.63,16848.53,414.43,},orientation = {-0.02,0.02,-0.72,0.69,},},
			{id = 4,name = 'KeyFrame4',interpolant = 9,target = '',link = '',fov = 1.047198,position = {2612.89,17818.14,79.61,},orientation = {-0.02,0.03,-0.57,0.82,},},
			{id = 5,name = 'KeyFrame5',interpolant = 9,target = '',link = '',fov = 1.047198,position = {2612.89,17818.14,79.61,},orientation = {-0.02,0.03,-0.57,0.82,},},
			{id = 6,name = 'KeyFrame6',interpolant = 12,target = '',link = '',fov = 1.047198,position = {2612.89,17818.14,79.61,},orientation = {-0.02,0.03,-0.57,0.82,},},
		},
		events = 
		{
			{id = 1,name = 'Start',interpolant = 0,object = '|cinematic_bossdestroy',label = 'cinematic_start',},
			{id = 2,name = 'Explode',interpolant = 1.5,object = '|cinematic_bossdestroy',label = 'cinematic_explode',},
			{id = 3,name = 'Calming',interpolant = 10,object = '|cinematic_bossdestroy',label = 'cinematic_calming',},
			{id = 4,name = 'End',interpolant = 12,object = '|cinematic_bossdestroy',label = 'cinematic_at_end',},
		},
	},
}