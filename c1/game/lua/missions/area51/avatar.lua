function on_animtag(animname, animtag)
	if animname == "spinup" then 
		if animtag == "fx_swirlies" then
			fx = childbyoid(3135)
			fx:addtoworld()
			fx:reset()
			fx:start()
		end
	end
end