local Players = game:GetService("Players")
 
function onPlayerAdded(player)
    local temp = game.Lighting.Template:Clone()
	temp.Parent = script.Parent.Box
	temp.Name = player.Name
	temp.Frame.pN.Value = player.Name
	temp.Frame.sender.Value = player.Name
	local ado = script.Parent:WaitForChild("incre")
	ado.Value = ado.Value + 0.060
	temp.Position = UDim2.new(0.04,0,0.105+ado.Value,0)	
end
 
Players.PlayerAdded:connect(onPlayerAdded)