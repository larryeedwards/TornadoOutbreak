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