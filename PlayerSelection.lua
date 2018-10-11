--[[

local PlayingPlayers = {}

for i, player in pairs(game.Players:GetPlayers()) do
	if player.Playing.Value == 1 then
		PlayingPlayers[i] = player.Name
		local Play1 = Instance.new("StringValue", game.Lighting.PlayersPlaying)
		Play1.Name = player.Name
	end		
end


Players = game.Lighting.PlayersPlaying:GetChildren()
Array = {}


function has_value (val)
    for index, value in ipairs (Array) do
        if value == val then
            return true
        end
    end
    return false
end

i = 1
while i <= #Players do
	x = math.random(1,#Players)
	while has_value(x) == true do
		wait(0.1)
		x = math.random(1,#Players)
	end
	print("x is..",x)
	Array[i] = x
	print("Array x name is "," ",Players[Array[i].Name)
	print("Players[i].Name"," ",Players[i].Name)
	print(" i is equal to"," ",i)
			
	if Players[i].Name ~= Players[Array[i].Name then
		Players[i].Value = Players[Array[i].Name
		i = i+1		
	else
		Array[i] = ""
		if i ~= 1 then
			i = i-1
		end
	end			
end

--]]

--[[
for i = 1,#Players do
	play = Players[i].Name
	vic = Players[i].Value
	player = game.Players:FindFirstChild(play)
	player.Hunting.Value = vic
	player2 = game.Players:FindFirstChild(vic)
	player2.HuntedBy.Value = play
end



for i = 1, #Players do
	x = math.random(1,#Players)
	while has_value(x) == true do
		wait(0.1)
		x = math.random(1,#Players)
	end
	print("x is..",x)
	Array[i] = x
	print("Array x name is "," ",Players[Array[i].Name)
		
	if Players[i].Name ~= Players[Array[i].Name then
		Players[i].Value = Players[Array[i].Name
	else
		i = i-1
	end
			
end

--]]

