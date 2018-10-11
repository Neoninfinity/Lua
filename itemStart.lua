x = 15
timer = 0.000000001
done = false
local move = coroutine.wrap(function()
	local i = 0
	while true do
		i = i - x
		script.Parent.Moving.Position = UDim2.new(0,i,0,0)
		wait()
		if x == 0 then
			script.Parent.trig.Value = true
			break
		end
	end
end)

local changei = coroutine.wrap(function()
	for i = 15, 0, -1 do 
		wait(1.5)
		x = i
	end
end)

remote = game.ReplicatedStorage.checkPurchase.recieve

function start()
	wait(0.8)
	move()
	changei()
end

remote.OnClientEvent:Connect(start)