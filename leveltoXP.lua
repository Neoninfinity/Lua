local function XPToLevel(xp)
	local result = 0
	local i = 1
	while true do
		local req = math.floor(i + 500 * (2 ^ (i / 15.47452)))
		if xp >= req then
			xp = xp - req
			result = result + 1
		else
			break
		end
		i = i + 1
	end
	return result
end	