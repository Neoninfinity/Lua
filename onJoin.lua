local PlayerDataStore = require(game.ServerStorage.Saving.PlayerDataStore)
rs = game:GetService("ReplicatedStorage")
remote = rs.dataUpdate.data
function HandlePlayer(player)
	
	---------------------------------------------------------------------create player values
	local exper = Instance.new("IntValue",player)
	exper.Name = ("EXP")
	local creds = Instance.new("IntValue",player)
	creds.Name = ("CREDITS")
	local neon = Instance.new("IntValue",player)
	neon.Name = ("NEON")
	-- Get a reference to the save data
	local saveData = PlayerDataStore:GetSaveData(player)
	------------------------------------------------------------------- exp
	-- get the visits
	local currentExp = saveData:Get('exp')
	if not currentExp then
		currentExp = 1000
	end
	-- set the new visits
	saveData:Set('exp', currentExp)
	exper.Value = currentExp
	-------------------------------------------------------------------------credits
	-- get the visits
	local currentCred = saveData:Get('credits')
	if not currentCred then
		currentCred = 0
	end
	-- set the new visits
	saveData:Set('credits', currentCred)
	creds.Value = currentCred
	--------------------------------------------------------------------------neonnites
	-- get the visits
	local currentNeon = saveData:Get('neon')
	if not currentNeon then
		currentNeon = 0
	end
	-- set the new visits
	saveData:Set('neon', currentNeon)
	remote:FireClient(player,"neon",currentNeon)
end





game.Players.PlayerAdded:connect(HandlePlayer)
for _, player in pairs(game.Players:GetChildren()) do
	if player:IsA('Player') then
		HandlePlayer(player)
	end
end

return true