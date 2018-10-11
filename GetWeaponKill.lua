local event = Instance.new("RemoteEvent")
event.Parent = game.Workspace 
event.Name = "Kill" 
event.OnServerEvent:connect(function(player,plr)
	print("plr is ",(plr))
	local a = game.Workspace:FindFirstChild(plr)
	a.Humanoid.Health = 0
end)
