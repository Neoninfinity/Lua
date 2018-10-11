local ReplicatedStorage = game:GetService("ReplicatedStorage")

remote = ReplicatedStorage.boxes.uniqueitem
Array = {}

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local function playerArray(player ,box,num,texture1)
	if num ~= 1 then
		local function isArray()
			for index, value in ipairs(Array) do
	   			 if (player.Name .. box) == value then
					return true
				 end
			end
			return false
		end
		
		if isArray() == false then
			Array[#Array +1] = player.Name .. box
			return true
		end
		return false
		
	else		
		local newfod = Instance.new("Folder")
		newfod.Parent = box.texture
		newfod.Name = player.Name
		local stringv = Instance.new("StringValue")
		stringv.Parent = newfod
		print("texture1 is"..texture1)
		stringv.Value = texture1
	end
end
 
remote.OnServerInvoke = playerArray