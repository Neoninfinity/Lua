
remote = game.ReplicatedStorage.boxes.getweapon

local function store(player,wep,id)
	local loc = game.ReplicatedStorage.boxes:FindFirstChild(id)
	local locvalues = loc:GetChildren()
	for index, child in pairs(locvalues) do
		if child.Value == "nil" or nil then
			child.Value = wep
			return true
		else
			
		end
	end
	return false
end
 
remote.OnServerInvoke = store
