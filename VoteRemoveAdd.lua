PlayersVoted1 = {}
local rs = game:GetService("ReplicatedStorage")
AddOne = rs.A1
TakeOne = rs.T1

local selectedNames = game.Lighting.GameStats.VoteMap.mapNames
mapNames = selectedNames:GetChildren()
local map1 = mapNames[1].Name
local map2 = mapNames[2].Name
local map3 = mapNames[3].Name


AddOne.OnServerEvent:connect(function(player,map) -- define the function that will be called when the event is fired
	print("VOTE1RECIEVED",player,map)
	local loc = game.Lighting.GameStats.VoteMap.mapNames:FindFirstChild(map.Name)
	loc.Value = loc.Value + 1
end)

TakeOne.OnServerEvent:connect(function(player,map) -- define the function that will be called when the event is fired
	local loc = game.Lighting.GameStats.VoteMap.mapNames:FindFirstChild(map.Name)
	loc.Value = loc.Value -1
end)
