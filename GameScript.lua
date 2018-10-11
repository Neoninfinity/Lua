local serverStorage = game:GetService("ServerStorage")
local maps = serverStorage:WaitForChild("Maps")
local rounds = 0
local minPlayers = 2
local oldMessage=("1")

--[GUI CREATION]--
--StatusGUI
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.StarterGui
screenGui.Name = "statusGui"
local statusFrame = Instance.new("Frame")
statusFrame.Parent = screenGui
statusFrame.Position = UDim2.new(0.25,0,0,0)
statusFrame.Size = UDim2.new(0.5,0,0.15,0)
statusFrame.Transparency = 1
local statusImage = Instance.new("ImageLabel")
statusImage.Parent = statusFrame
statusImage.Position = UDim2.new(0,0,0.0,0)
statusImage.Size = UDim2.new(1,0,1,0)
statusImage.Transparency = 1
statusImage.Image = "rbxgameasset://Images/intermission"
wait(5)

-- On game join prep





--VoteGUI

function message(message)
	local rep = game:GetService("ReplicatedStorage")
	local event = rep:WaitForChild("Message")
	if oldMessage ~= message then
		oldMessage = message
	end
	event:FireAllClients(message)
end
--Message for only players that are playing

function message1(message)
	local rep = game:GetService("ReplicatedStorage")
	local event = rep:WaitForChild("Message1")
	if oldMessage ~= message then
		oldMessage = message
	end
	event:FireAllClients(message)
end
 
--Random map pick
function pickMap()
	local mapList = maps:GetChildren()
	local selectedIndex = math.random(1,#mapList) -- Selects the map randomly (Until vote map is implemented)
	local map = mapList[selectedIndex]:Clone()
	map.Parent = workspace
	map.Name = "Map"
	return mapList[selectedIndex].Name
end

--Remove map from workspace

function unloadMap()
	if workspace:FindFirstChild("Map")then
		workspace.Map:Destroy()
		print("Map unloaded")
	end
end

-- Teleport to the maps
function teleportMap()	
	if workspace:FindFirstChild("Map")then
		local Spawns = game.workspace.Map.Spawns
		local SpawnList = Spawns:GetChildren()
		local playerList = game.Players:GetChildren()
		for i = 1,#playerList do
			playerList[i].Playing.Value = 1
			print ("x is now equal to", i)
			local selectedSpawn = SpawnList[i]
			local target = CFrame.new(selectedSpawn.Position)
			playerList[i].Character.Torso.CFrame = target
				
		end
	end
end

--VoteGUI
function voteGui()
	print("votegui start")
	local startVote = game.Lighting.GameStats.VoteMap.guiEngage
	local mapData = maps:GetChildren()
	local map1 = math.random(1,#mapData)
	local map2 = math.random(1,#mapData)
	local map3 = math.random(1,#mapData)
	while map1 == map2 or map2 == map3 or map3 == map1 do
		wait(0.5)
		map1 = math.random(1,#mapData)
		map2 = math.random(1,#mapData)
		map3 = math.random(1,#mapData)
	end
	print("map numbers",map1,map2,map3)
	local mapName1 =game.Lighting.GameStats.VoteMap.mapNames.Map1
	local mapName2 =game.Lighting.GameStats.VoteMap.mapNames.Map2
	local mapName3 =game.Lighting.GameStats.VoteMap.mapNames.Map3
	
	mapName1.Name = mapData[map1].Name
	mapName2.Name = mapData[map2].Name
	mapName3.Name = mapData[map3].Name
	
	mapName1.Name = mapData[map1].Name
	mapName2.Name = mapData[map2].Name
	mapName3.Name = mapData[map3].Name
	startVote.Value = 1
end

--Map which was selected from the voteGui()
function selectMapFromVote()
	local getVotes = game.Lighting.GameStats.VoteMap.mapNames:GetChildren()
	local map1 = getVotes[1]
	local map2 = getVotes[2]
	local map3 = getVotes[3]
	local votedMap = ""
	if map1.Value > map2.Value and map1.Value > map3.Value then
		votedMap = map1.Name
	elseif map2.Value > map1.Value and map2.Value > map3.Value then
		votedMap = map2.Name
	elseif map3.Value > map2.Value and map3.Value > map1.Value then
		votedMap = map3.Name
	elseif (map1.Value == map2.Value)and map1.Value > map3.Value then
		votedMap = map1.Name
	elseif (map2.Value == map3.Value)and map1.Value > map1.Value then
		votedMap = map2.Name
	elseif (map3.Value == map1.Value)and map1.Value > map2.Value then
		votedMap = map3.Name
	else
		votedMap = map3.Name
		
	end
			
	print("The map voted is", votedMap)
	local mapLocation = game.ServerStorage.Maps:FindFirstChild(votedMap)
	local map = mapLocation:Clone()
	map.Parent = workspace
	map.Name = "Map"
	

end

--Reset votes
function resetVotes()
	local votesloc = game.Lighting.GameStats.VoteMap.mapNames:GetChildren()
	local map1 = votesloc[1]
	local map2 = votesloc[2]
	local map3 = votesloc[3]
	map1.Value = 0
	map2.Value = 0
	map3.Value = 0
	map1.Name = "Map1"
	map2.Name = "Map2"
	map3.Name = "Map3"
end

function freezePlayers(time1)
	local playerList = game.Players:GetChildren()
	for i = 1,#playerList do
		if playerList[i].Playing.Value == 1 then
			playerList[i].Character.Humanoid.WalkSpeed = 0
		end	
	end
end

function unFreeze()
	local playerList = game.Players:GetChildren()
	for i = 1,#playerList do
		if playerList[i].Playing.Value == 1 then
			playerList[i].Character.Humanoid.WalkSpeed = 16
		end	
	end
end
function disableJump()
	local playerList = game.Players:GetChildren()
	for i = 1,#playerList do
		if playerList[i].Playing.Value == 1 then
			playerList[i].Character.Humanoid.JumpPower = 0
		end
	end
end

function enableJump()
	local playerList = game.Players:GetChildren()
	for i = 1,#playerList do
			playerList[i].Character.Humanoid.JumpPower = 50
	end
end

function forceZoom()
	local playerList = game.Players:GetChildren()
	for i = 1,#playerList do
		if playerList[i].Playing.Value == 1 then
			playerList[i].CameraMaxZoomDistance = 0	
		end
	end
end

function fixZoom()
	local playerList = game.Players:GetChildren()
	for i = 1,#playerList do
		playerList[i].CameraMaxZoomDistance = 12	
	end
end

function teleportLobby()	
		local Spawns = game.workspace.Spawns
		local SpawnList = Spawns:GetChildren()
		local playerList = game.Players:GetChildren()
		for i = 1,#playerList do
			if playerList[i].Playing.Value == 1 then
				local selectedSpawn = SpawnList[i]
				local target = CFrame.new(selectedSpawn.Position)
				playerList[i].Character.Torso.CFrame = target
				playerList[i].Playing.Value = 0
			end
				
		end
end

function sgtime()
	game.Lighting.GameStats.TTrigger.Value = 1
	freezePlayers()
	wait(11)
	game.Lighting.GameStats.TTrigger.Value = 0
end
-- Main game script

function setroles()
	local PlayingPlayers = {}
	
	for i, player in pairs(game.Players:GetPlayers()) do
		if player.Playing.Value == 1 then
			PlayingPlayers[i] = player.Name
			local Play1 = Instance.new("StringValue", game.Lighting.PlayersPlaying)
			Play1.Name = player.Name
		end		
	end
	
	
	local Players = game.Lighting.PlayersPlaying:GetChildren()
	Array = {}
	
	
	local function has_value (val)
	    for index, value in ipairs (Array) do
	        if value == val then
	            return true
	        end
	    end
	    return false
	end
	
	local i = 1
	while i <= #Players do
		wait(0.1)
		local x = math.random(1,#Players)
		while has_value(x) == true do
			wait(0.1)
			x = math.random(1,#Players)
		end

		Array[i] = x
				
		if Players[i].Name ~= Players[Array[i]].Name then
			wait(0.1)
			Players[i].Value = Players[Array[i]].Name
			i = i+1		
		else
			Array[i] = ""
			if i ~= 1 then
				wait(0.1)
				i = i-1
			end
		end			
	end
	for i = 1,#Players do
		local play = Players[i].Name
		local vic = Players[i].Value
		local player = game.Players:FindFirstChild(play)
		player.Hunting.Value = vic
		local player2 = game.Players:FindFirstChild(vic)
		player2.HuntedBy.Value = play
	end

end

function clearRoles()
	game.Lighting.PlayersPlaying:ClearAllChildren()
end

function changeHunting()
	local event = game.ReplicatedStorage.Hunting
	event:FireAllClients()
end

function mkHolderInv()
	local event = game.ReplicatedStorage.HuntingO
	event:FireAllClients()
end


function tempWep()
	local playerList = game.Players:GetChildren()
	for i = 1,#playerList do
		if playerList[i].Playing.Value == 1 then
			local knife = game.ReplicatedStorage.Weapons.Knife:Clone()
			knife.Parent = playerList[i].Backpack
			
		end
	end
end

function checkAlive()
	local i = true
	local counter = 0
	wait(0.1)
	local function cAlive(name)
		local children = game.Lighting.PlayersPlaying:GetChildren()
		for dex,child in pairs(children) do
			if child.Name == name then
				return true
			end
		end
		return false
	end
		
	local children = game.Lighting.PlayersPlaying:GetChildren()
	for index, child in pairs(children) do
		if cAlive(child.Value) == false then
			counter = counter + 1
		end 
	end
	
	if counter == #game.Lighting.PlayersPlaying:GetChildren() then
		return true
	end 
end

function checkAFK()
	local counter = 0
	for index, child in pairs(game.Players:GetChildren()) do
		if child.AFK.Value == 0 then
			counter = counter+1
		else
			--
		end
	end
	return counter
end

function enableEye()
	local rs = game:GetService("ReplicatedStorage")
	local remote = rs.enableye
	local playerList = game.Players:GetChildren()
	for i = 1,#playerList do
		if playerList[i].Playing.Value == 1 then
			remote:FireClient(playerList[i])	
		end
	end
end

function disableEye()
	local rs = game:GetService("ReplicatedStorage")
	local remote = rs.enableye
	local playerList = game.Players:GetChildren()
	for i = 1,#playerList do
		if playerList[i].Playing.Value == 1 then
			remote:FireClient(playerList[i], "disable")	
		end
	end
end

function clearWep()
	local playerList = game.Players:GetChildren()
	for i = 1,#playerList do
		local backpack =playerList[i].Backpack
		local children = backpack:GetChildren()
		for index, child in pairs(children) do
			wait()
			child:Destroy()
		end
	end
end

while true do
	wait(1)
	if #game.Players:GetPlayers() >= minPlayers and checkAFK() >= minPlayers then
		wait(30)
		message("rbxgameasset://Images/intermission")
		wait(1)
		message("rbxgameasset://Images/voteforamap")
		wait(1)
		voteGui()
		wait(20)
		selectMapFromVote()
		wait(8)
		resetVotes()
		print("Teleporting")
		message("rbxgameasset://Images/Starting")
		game.Lighting.GameStats.inProgress.Value = 1 -- Game in progress
		wait(5)
		game.Lighting.GameStats.BTrigger.Value = 1 -- Blackout On
		wait(2)
		teleportMap()
		setroles()
		freezePlayers()
		--disableJump()
		--tempWep() -- Remove during the final product
		enableEye()
		wait(5)
		game.Lighting.GameStats.BTrigger.Value = 0 -- Blackout Off
		changeHunting()
		sgtime()
		--forceZoom()
		message1("rbxgameasset://Images/Go")
		unFreeze()
		message1("rbxgameasset://Images/nil")
		repeat
			wait(1)
			a = checkAlive()
		until a == true
		mkHolderInv()
		fixZoom()
		enableJump()
		game.Lighting.GameStats.BTrigger.Value = 1 -- end game on off
		teleportLobby()
		clearRoles()
		unloadMap()
		clearWep()
		wait(5)
		game.Lighting.GameStats.BTrigger.Value = 0 -- off
		message("rbxgameasset://Images/intermission")
		wait(5)
		game.Lighting.GameStats.inProgress.Value = 0
		wait(15) -- time for the end round gui to show
		
	end
end