local playr = game.Players.LocalPlayer

function onPlayerRespawned(newPlayer)
wait(0.5)
game.Workspace[newPlayer.Name].Health:Remove()
end

function onPlayerEntered(newPlayer)
	newPlayer.Changed:connect(function (property)
		if (property == "Character") then
			onPlayerRespawned(newPlayer)
		end
	end)
end

game.Players.PlayerAdded:connect(onPlayerEntered)