local Players = game:GetService("Players")
local PlayerStore = {}
local counter = 1

game.Players.PlayerRemoving:connect(function(player)
	PlayerStore[counter] = player
	print(PlayerStore[counter])
	counter = counter + 1
	local ado = script.Parent.incre
	ado.Value = ado.Value - 0.060
end)

while true do
	wait(0.1)
	if counter > 1 then
		if counter>1 then
		local player = PlayerStore[counter-1]
		local aPlay = script.Parent.Box:GetChildren()
	    local something = script.Parent.Box:FindFirstChild(player.Name)
		local loc = 0
		for i,v in pairs(aPlay) do
	  		if v.Name == something.Name then
	   			loc = i
				something:Destroy()
	  		end
		end
		for i= loc+1,#aPlay,1 do
			local a = aPlay[i].Position
			local b = a-(UDim2.new(0,0,0.06,0))
			aPlay[i]:TweenPosition(b,"Out","Quint")
		end
		counter = counter -1
		end
		print (counter)
	end
end