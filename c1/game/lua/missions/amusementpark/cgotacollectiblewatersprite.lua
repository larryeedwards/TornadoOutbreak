function on_death()

	if cameravolume ~= nil then
		cameravolume:removefromworld()
	end

	if matchingwatersprite ~= nil then
		matchingwatersprite:removefromworld()
	end
	   
end

function on_collected()
	removefromworld()
end

function on_watersprintfail()
	resetforwatersprint()
end