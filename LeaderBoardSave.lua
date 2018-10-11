local DSService = game:GetService('DataStoreService'):GetOrderedDataStore('ConfinedLBRD')
local PlayerDataStore = require(game.ServerStorage.Saving.PlayerDataStore)

game.Players.PlayerAdded:connect(function(plr)
	local GetSaved = DSService:GetAsync(plr.UserId)
	local saveData = PlayerDataStore:GetSaveData(plr)
	if GetSaved == nil then
		local player = plr.Name
		local exp = saveData:Get('exp')
		DSService:SetAsync(player,exp)
	end
end)


game.Players.PlayerRemoving:connect(function(plr)
	local saveData = PlayerDataStore:GetSaveData(plr)
	local player = plr.Name
	local exp = saveData:Get('exp')
	DSService:SetAsync(player,exp)	
	
end)

local function savePlayerData(player)
	local saveData = PlayerDataStore:GetSaveData(player)
	local player = player.Name
	local exp = saveData:Get('exp')
	DSService:SetAsync(player,exp)
end

local AUTOSAVE_INTERVAL = 30
 
local function autosave()
	while wait(AUTOSAVE_INTERVAL) do
		local playerList = game.Players:GetChildren()
		for i = 1,#playerList do
			savePlayerData(playerList[i])
		end
	end
end
 
spawn(autosave)