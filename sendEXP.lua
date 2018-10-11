local PlayerDataStore = require(game.ServerStorage.Saving.PlayerDataStore)
local rep = game:GetService("ReplicatedStorage")
local rem = rep.updateEX

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



local function sendex(player,name)
	local play1 = game.Players:FindFirstChild(name)
	local saveData = PlayerDataStore:GetSaveData(play1)
	local level = saveData:Get('exp')
	local value = XPToLevel(level)
	return value
end
 
rem.OnServerInvoke = sendex