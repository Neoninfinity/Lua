--AdminPanel commands
local PlayerDataStore = require(game.ServerStorage.Saving.PlayerDataStore)

Replicated = game:GetService("ReplicatedStorage")
rs = Replicated.Admin

local function Admin(player,command,name,value)
	local victim = game.Players:FindFirstChild(name)
	if player.UserId == 20249235 or player.UserId == -1 or player.UserId == 9518818 then 
		if command == ("exp") then
			local saveData = PlayerDataStore:GetSaveData(victim)
			local currentExp = saveData:Get('exp')
			currentExp = value
			saveData:Set('exp', currentExp)
			local val = victim:FindFirstChild("EXP")
			val.Value = currentExp
		elseif command == ("credits") then
			local saveData = PlayerDataStore:GetSaveData(victim)
			local currentCred = saveData:Get('credits')
			currentCred = value
			saveData:Set('credits', currentCred)
			local val = victim:FindFirstChild("CREDITS")
			val.Value = currentCred
		elseif command == ("neon") then
			local saveData = PlayerDataStore:GetSaveData(victim)
			local currentNe = saveData:Get('neon')
			currentNe = value
			saveData:Set('neon', currentNe)
			local val = victim:FindFirstChild("NEON")
			val.Value = currentNe
		elseif command == ("kill") then
			victim.Character.Humanoid.Health = value
		elseif command == ("grav") then
			victim.Character.Humanoid.JumpPower = value
		elseif command == ("item") then
			--
		elseif command == ("active") then
			print("")
			player.PlayerGui.BottomIconMenu.left.Admin.Active = true
			player.PlayerGui.BottomIconMenu.left.Admin.Visible = true
		end
	end
end
 
rs.OnServerEvent:Connect(Admin)