for i =1, #game.Players:GetPlayers() do
	if (game.Players:GetPlayers())[i].Name ~= game.Players.LocalPlayer.Name then
		temp = game.Lighting.Template:Clone()
		temp.Parent = script.Parent.Box
		temp.Name = (game.Players:GetPlayers())[i].Name
		temp.Frame.pN.Value = (game.Players:GetPlayers())[i].Name
		temp.Frame.sender.Value = (game.Players:GetPlayers())[i].Name
		local ado = script.Parent:WaitForChild("incre")
		ado.Value = ado.Value + 0.060
		temp.Position = UDim2.new(0.04,0,0.105+ado.Value,0)	
	end
end