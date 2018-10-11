game:GetService('Players').PlayerAdded:connect(function(player)
	player.CharacterAdded:connect(function(character)
		character:WaitForChild("Humanoid").Died:connect(function()
			if player.Playing.Value == 1 then
				local rep = game:GetService("ReplicatedStorage")
				rep.death:FireClient(player)
			end
			player.Playing.Value = 0
			player.Character.Humanoid.JumpPower = 50
			player.CameraMaxZoomDistance = 12
		end)
	end)
 
	local playing = Instance.new("IntValue", player)
	playing.Value = 0
	playing.Name = "Playing"
	
	local AFK = Instance.new("IntValue", player)
	AFK.Value = 0
	AFK.Name = "AFK"
	
	local Hunting = Instance.new("StringValue", player)
 	Hunting.Value = ""
    Hunting.Name = "Hunting"
	
	local Huntedby = Instance.new("StringValue", player)
	Huntedby.Value = ""
	Huntedby.Name = "HuntedBy"
	
	local dis = Instance.new("IntValue", player)
	dis.Value = 0
	dis.Name = "Disabled"	
end)