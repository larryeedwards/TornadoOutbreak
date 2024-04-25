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
		name = 'flythrough',
		interpolation = '__time__',
		duration = 37,
		smooth = true,
		stitch = false,
		loop = false,
		keyframes = 
		{
			{id = 1,name = 'KeyFrame1',interpolant = 0,target = '',link = '',fov = 1.134464,position = {15282.95,-61596.89,-2157.67,},orientation = {0.04,-0.02,0.92,-0.40,},},
			{id = 2,name = 'KeyFrame2',interpolant = 1.26,target = '',link = '',fov = 1.047198,position = {14455.33,-61395.16,-1571.89,},orientation = {-0.02,-0.14,-0.82,0.55,},},
			{id = 3,name = 'KeyFrame3',interpolant = 2.7,target = '',link = '',fov = 1.047198,position = {14034.13,-60002.08,-1524.68,},orientation = {-0.02,-0.12,-0.62,0.77,},},
			{id = 4,name = 'KeyFrame4',interpolant = 4.103186,target = '',link = '',fov = 1.047198,position = {14559.77,-55843.82,-1358.58,},orientation = {0.05,-0.08,-0.55,0.83,},},
			{id = 5,name = 'KeyFrame5',interpolant = 5.996263,target = '',link = '',fov = 1.047198,position = {17079.54,-50388.61,-2253.80,},orientation = {0.01,0.06,-0.69,0.72,},},
			{id = 6,name = 'KeyFrame6',interpolant = 7.962993,target = '',link = '',fov = 1.047198,position = {15550.79,-44766.32,-1349.60,},orientation = {0.03,0.04,-0.68,0.73,},},
			{id = 7,name = 'KeyFrame7',interpolant = 9.5,target = '',link = '',fov = 1.047198,position = {15176.00,-39413.60,-422.94,},orientation = {0.10,0.02,-0.70,0.71,},},
			{id = 8,name = 'KeyFrame8',interpolant = 11.56456,target = '',link = '',fov = 1.047198,position = {15349.63,-33425.90,482.29,},orientation = {-0.15,0.06,0.91,-0.38,},},
			{id = 9,name = 'KeyFrame9',interpolant = 13.15,target = '',link = '',fov = 1.047198,position = {11940.91,-30120.36,150.57,},orientation = {-0.15,0.07,0.90,-0.41,},},
			{id = 10,name = 'KeyFrame10',interpolant = 14.96953,target = '',link = '',fov = 1.047198,position = {9412.34,-24888.00,335.66,},orientation = {0.06,-0.06,-0.73,0.68,},},
			{id = 11,name = 'KeyFrame11',interpolant = 18.00945,target = '',link = '',fov = 1.047198,position = {11236.06,-15112.07,230.11,},orientation = {-0.03,0.13,-0.82,0.56,},},
			{id = 12,name = 'KeyFrame12',interpolant = 20.51604,target = '',link = '',fov = 1.047198,position = {4389.74,-9377.17,1761.74,},orientation = {-0.15,0.05,0.94,-0.32,},},
			{id = 13,name = 'KeyFrame13',interpolant = 22.52636,target = '',link = '',fov = 1.047198,position = {-376.03,-5885.86,2639.32,},orientation = {-0.14,0.04,0.95,-0.27,},},
			{id = 14,name = 'KeyFrame14',interpolant = 25.02802,target = '',link = '',fov = 1.047198,position = {-7456.73,-2524.23,1746.85,},orientation = {-0.02,0.00,0.97,-0.25,},},
			{id = 15,name = 'KeyFrame15',interpolant = 26.90182,target = '',link = '',fov = 1.047198,position = {-13148.71,-335.33,2426.34,},orientation = {0.05,-0.07,-0.89,0.45,},},
			{id = 16,name = 'KeyFrame16',interpolant = 29.75,target = '',link = '',fov = 1.047198,position = {-20284.58,6128.54,2470.89,},orientation = {0.03,0.04,-0.98,0.19,},},
			{id = 17,name = 'KeyFrame17',interpolant = 31.75,target = '',link = '',fov = 1.047198,position = {-25833.34,8170.53,2344.09,},orientation = {-0.05,0.00,1.00,-0.05,},},
			{id = 22,name = 'KeyFrame22',interpolant = 34,target = '',link = '',fov = 1.047199,position = {-30228.62,9198.33,3014.95,},orientation = {-0.12,0.00,0.99,-0.01,},},
			{id = 18,name = 'KeyFrame18',interpolant = 35.75,target = '',link = '',fov = 1.047198,position = {-33394.27,9550.91,2818.33,},orientation = {-0.05,0.00,1.00,0.01,},},
			{id = 19,name = 'KeyFrame19',interpolant = 36.6,target = '',link = '',fov = 1.047198,position = {-35788.34,10385.01,2647.68,},orientation = {-0.01,-0.01,0.84,0.54,},},
			{id = 20,name = 'KeyFrame20',interpolant = 36.6,target = '',link = '',fov = 1.047198,position = {-36529.83,10666.31,2738.76,},orientation = {-0.07,-0.08,0.69,0.71,},},
			{id = 21,name = 'KeyFrame21',interpolant = 37,target = '',link = '',fov = 0.8726646,position = {-37368.68,9967.52,2626.15,},orientation = {0.00,-0.01,0.09,1.00,},},
		},
		events = 
		{
			{id = 1,name = 'start',interpolant = 0,object = 'openingcamera',label = 'cinematic_start',},
			{id = 2,name = 'end',interpolant = 36,object = 'openingcamera',label = 'cinematic_at_end',},
		},
	},
	{
		id = 2,
		name = 'cine_pumpkin_to_cannon',
		interpolation = '__time__',
		duration = 4,
		smooth = true,
		stitch = false,
		loop = false,
		keyframes = 
		{
			{id = 1,name = 'KeyFrame1',interpolant = 0,target = '',link = '',fov = 0.7854,position = {-26731.28,9339.46,2834.33,},orientation = {-0.03,-0.08,0.34,0.94,},},
			{id = 4,name = 'KeyFrame4',interpolant = 1,target = '',link = '',fov = 0.7854,position = {-25550.29,8915.16,2923.29,},orientation = {0.03,0.06,0.39,0.92,},},
			{id = 2,name = 'KeyFrame2',interpolant = 1.9,target = '',link = '',fov = 0.7854,position = {-21166.31,6584.02,3009.44,},orientation = {0.01,0.02,0.34,0.94,},},
			{id = 5,name = 'KeyFrame5',interpolant = 2.5,target = '',link = '',fov = 0.7854,position = {-17711.76,4275.53,2756.94,},orientation = {0.02,0.04,0.38,0.92,},},
			{id = 3,name = 'KeyFrame3',interpolant = 3.1,target = '',link = '',fov = 0.7854,position = {-15770.70,3001.71,2691.85,},orientation = {-0.02,-0.05,0.39,0.92,},},
			{id = 6,name = 'KeyFrame6',interpolant = 4,target = '',link = '',fov = 0.7854,position = {-15187.23,2397.88,2488.37,},orientation = {-0.01,-0.03,0.39,0.92,},},
		},
		events = 
		{
			{id = 1,name = 'start',interpolant = 0,object = 'cine_sequences_mgr',label = 'cinematic_pumpkin_cannon_start',},
			{id = 2,name = 'end',interpolant = 4,object = 'cine_sequences_mgr',label = 'cinematic_pumpkin_cannon_at_end',},
		},
	},
	{
		id = 3,
		name = 'cine_cannon_to_ball',
		interpolation = '__time__',
		duration = 7,
		smooth = true,
		stitch = false,
		loop = false,
		keyframes = 
		{
			{id = 1,name = 'KeyFrame1',interpolant = 0,target = '',link = '',fov = 0.7854,position = {-14446.18,2065.25,2545.34,},orientation = {-0.03,-0.06,0.45,0.89,},},
			{id = 2,name = 'KeyFrame2',interpolant = 0.75,target = '',link = '',fov = 0.7854,position = {-14446.18,2065.25,2545.34,},orientation = {-0.02,-0.04,0.37,0.93,},},
			{id = 8,name = 'KeyFrame8',interpolant = 0.75,target = '',link = '',fov = 0.7854,position = {-14446.18,2065.25,2545.34,},orientation = {-0.02,-0.04,0.37,0.93,},},
			{id = 3,name = 'KeyFrame3',interpolant = 2.1,target = '',link = '',fov = 0.7854,position = {-7798.65,-1560.73,3195.57,},orientation = {-0.02,-0.07,0.34,0.94,},},
			{id = 4,name = 'KeyFrame4',interpolant = 3.75,target = '',link = '',fov = 0.7854,position = {-995.21,-4342.23,3251.48,},orientation = {-0.16,-0.26,0.49,0.81,},},
			{id = 5,name = 'KeyFrame5',interpolant = 4.75,target = '',link = '',fov = 0.7854,position = {3133.71,-8336.71,2337.93,},orientation = {-0.01,-0.05,0.26,0.96,},},
			{id = 6,name = 'KeyFrame6',interpolant = 6,target = '',link = '',fov = 0.7854,position = {5566.65,-11207.63,1745.38,},orientation = {0.00,0.01,0.04,1.00,},},
			{id = 7,name = 'KeyFrame7',interpolant = 7,target = '',link = '',fov = 0.7854,position = {6737.52,-11547.39,1234.89,},orientation = {0.00,0.07,0.05,1.00,},},
		},
		events = 
		{
			{id = 1,name = 'start',interpolant = 0,object = 'cine_sequences_mgr',label = 'cinematic_cannon_ball_start',},
			{id = 2,name = 'end',interpolant = 6,object = 'cine_sequences_mgr',label = 'cinematic_cannon_ball_at_end',},
		},
	},
	{
		id = 4,
		name = 'cine_ball_to_bull',
		interpolation = '__time__',
		duration = 9,
		smooth = true,
		stitch = false,
		loop = false,
		keyframes = 
		{
			{id = 1,name = 'KeyFrame1',interpolant = 0,target = '',link = '',fov = 1.047198,position = {7156.26,-10305.67,1971.53,},orientation = {-0.05,-0.08,0.48,0.87,},},
			{id = 2,name = 'KeyFrame2',interpolant = 1,target = '',link = '',fov = 0.7854,position = {7635.92,-11741.64,2384.76,},orientation = {-0.08,-0.11,0.57,0.81,},},
			{id = 3,name = 'KeyFrame3',interpolant = 2.5,target = '',link = '',fov = 0.7854,position = {8936.27,-16752.16,1399.19,},orientation = {-0.06,-0.06,0.72,0.69,},},
			{id = 4,name = 'KeyFrame4',interpolant = 4,target = '',link = '',fov = 0.7854,position = {8393.62,-20344.08,1293.66,},orientation = {-0.08,-0.10,0.64,0.76,},},
			{id = 5,name = 'KeyFrame5',interpolant = 5.75,target = '',link = '',fov = 0.7854,position = {7992.04,-26007.75,759.32,},orientation = {-0.06,-0.12,0.44,0.89,},},
			{id = 6,name = 'KeyFrame6',interpolant = 8,target = '',link = '',fov = 0.7854,position = {12595.43,-34145.42,-8.17,},orientation = {0.00,-0.04,0.11,0.99,},},
			{id = 7,name = 'KeyFrame7',interpolant = 9,target = '',link = '',fov = 0.7854,position = {13132.15,-34641.76,-55.22,},orientation = {-0.01,-0.04,0.15,0.99,},},
		},
		events = 
		{
			{id = 1,name = 'start',interpolant = 0,object = 'cine_sequences_mgr',label = 'cinematic_ball_bull_start',},
			{id = 2,name = 'end',interpolant = 10,object = 'cine_sequences_mgr',label = 'cinematic_ball_bull_at_end',},
		},
	},
}