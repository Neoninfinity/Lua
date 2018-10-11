game.ReplicatedStorage.GiveWep.OnServerEvent:connect(function(player,wep)
	if player.Backpack:FindFirstChild(wep) ~= wep then
		local Weapon = game.ReplicatedStorage.Weapons:FindFirstChild(wep)
		local a = Weapon:Clone()
		a.Parent = player.Backpack
	end
end)