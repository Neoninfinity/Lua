local rep = game:GetService("ReplicatedStorage")

rep:WaitForChild("Message1").OnClientEvent:connect(function(message)
	local player = script.Parent.Parent
	if player.Playing.Value == 1 then
		player.PlayerGui.statusGui.Frame:TweenPosition(UDim2.new(0.25,0,-0.2,0),"Out","Quad", 1)
		wait(1)
		player.PlayerGui.statusGui.Frame.ImageLabel.Image = message
		wait(1)
		player.PlayerGui.statusGui.Frame:TweenPosition(UDim2.new(0.25,0,0.4,0),"Out","Elastic",1)
		wait(2)
		player.PlayerGui.statusGui.Frame:TweenPosition(UDim2.new(0.25,0,0,0),"Out","Elastic", 2)	
	else
		player.PlayerGui.statusGui.Frame:TweenPosition(UDim2.new(0.25,0,-0.2,0),"Out","Quad", 1)
		wait(1)
		player.PlayerGui.statusGui.Frame.ImageLabel.Image = "rbxgameasset://Images/GameInProgress"
		wait(2)
		player.PlayerGui.statusGui.Frame:TweenPosition(UDim2.new(0.25,0,0,0),"Out","Quad", 2)	
			
	end
end)