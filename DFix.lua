game.ReplicatedStorage:WaitForChild("CredFix").OnClientEvent:connect(function(text)
	local player = game.Players.LocalPlayer
	player.PlayerGui.LevelSys.CValue.Text = (text)
end)

game.ReplicatedStorage:WaitForChild("LevelFix").OnClientEvent:connect(function(text)
	local player = game.Players.LocalPlayer
	player.PlayerGui.LevelSys.Lnum.Text = (text)
end)

game.ReplicatedStorage:WaitForChild("NeonFix").OnClientEvent:connect(function(text)
	local player = game.Players.LocalPlayer
	player.PlayerGui.neonnites.Frame.TextLabel.Text = text
end)

game.ReplicatedStorage:WaitForChild("Efix").OnClientEvent:connect(function(text)
	local player = game.Players.LocalPlayer
	player.EXP.Value = text
	player.EXP.Value = player.EXP.Value -1
	player.EXP.Value = player.EXP.Value +1
end)