local send = game.ReplicatedStorage.checkPurchase.send 
local PlayerDataStore = require(game.ServerStorage.Saving.PlayerDataStore)
local openCrate = game.ReplicatedStorage.checkPurchase.recieve
local function process(player,id,price,currency)
	local saveData = PlayerDataStore:GetSaveData(player)
	local currentCred = saveData:Get('credits')
	if currentCred >= price then -- If has more or equal credits process
		currentCred = currentCred - price -- take from value
		saveData:Set('credits', currentCred) -- save new value
		player.CREDITS.Value = currentCred -- Update user data
		openCrate:FireClient(player,id)
		return true -- return true
	else
		return false end -- tell the player the purchase cannot be completed
	
end
 
send.OnServerInvoke = process