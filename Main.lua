local serverStorage = game:GetService("Lighting")
local startVote = game.Lighting.GameStats.VoteMap.guiEngage
local selectedNames = game.Lighting.GameStats.VoteMap.mapNames
local image1 = script.Parent.Vote1.Frame.ImageButton
local image2 = script.Parent.Vote2.Frame.ImageButton
local image3 = script.Parent.Vote3.Frame.ImageButton
local text1 = script.Parent.Vote1.Frame.ImageButton.Votes
local text2 = script.Parent.Vote2.Frame.ImageButton.Votes
local text3 = script.Parent.Vote3.Frame.ImageButton.Votes
local vote1 = script.Parent.Vote1.Frame
local vote2 = script.Parent.Vote2.Frame
local vote3 = script.Parent.Vote3.Frame
local rs = game:GetService("ReplicatedStorage")
AddOne = rs.A1
TakeOne = rs.T1

m1 = game.Lighting.GameStats.VoteMap.mapNames.Map1
m2 = game.Lighting.GameStats.VoteMap.mapNames.Map2
m3 = game.Lighting.GameStats.VoteMap.mapNames.Map3

function debounce(func)
    local isRunning = false    -- Create a local debounce variable
    return function(...)       -- Return a new function
        if not isRunning then
            isRunning = true
 
            func(...)          -- Call it with the original arguments
 
            isRunning = false
        end
    end
end

startVote.Changed:connect(debounce(function()
	if startVote.Value == 1 then
		tweenin()
		
		mapNames = selectedNames:GetChildren()
		local map1 = mapNames[1].Name
		local map2 = mapNames[2].Name
		local map3 = mapNames[3].Name
		print(map1,map2,map3)
		local id1 = game.Lighting.GameStats.VoteMap:FindFirstChild(map1).Value
		local id2 = game.Lighting.GameStats.VoteMap:FindFirstChild(map2).Value
		local id3 = game.Lighting.GameStats.VoteMap:FindFirstChild(map3).Value



		image1.Image = id1
		image2.Image = id2
		image3.Image = id3
		wait(22)
		tweenout()
		game.ReplicatedStorage.VGuiC:FireServer()
		hasVoted = script.Parent.playerVoted
		hasVoted.Value = 0

	else
		end
end))



function tweenin()
	vote1:TweenPosition(UDim2.new(0.15,0,0.5,0),"Out","Quint",3)-- tween to
	wait(0.5)
	vote2:TweenPosition(UDim2.new(0.25,0,0.5,0),"Out","Quint",3)
	vote3:TweenPosition(UDim2.new(0.35,0,0.5,0),"Out","Quint",3)
end

function tweenout()
	vote1:TweenPosition(UDim2.new(-5,0,0.5,0),"Out","Quint",3) -- tween out to
	vote2:TweenPosition(UDim2.new(-5,0,0.5,0),"Out","Quint",3)
	vote3:TweenPosition(UDim2.new(-5,0,0.5,0),"Out","Quint",3)
	wait(15)
	vote1.Position= UDim2.new(2.5, 0,0.5, 0) -- reset position
	vote2.Position = UDim2.new(2, 0,0.5, 0)
	vote3.Position = UDim2.new(3, 0,0.5, 0)
end

image1.MouseButton1Up:connect(function()
	hasVoted = script.Parent.playerVoted
	image1vote = mapNames[1]
	image2vote = mapNames[2]
	image3vote = mapNames[3]

	if hasVoted.Value == 0 then
		print("ADDED")
		AddOne:FireServer(image1vote)
		hasVoted.Value = 1
		wait(1)
	elseif hasVoted.Value == 1 then
		TakeOne:FireServer(image1vote)
		AddOne:FireServer(image1vote)
		hasVoted.Value = 1
		wait(1)
	elseif hasVoted.Value == 2 then
		TakeOne:FireServer(image2vote)
		AddOne:FireServer(image1vote)
		hasVoted.Value= 1
		wait(1)
	else
		TakeOne:FireServer(image3vote)
		AddOne:FireServer(image1vote)	
		hasVoted.Value = 1
		wait(1)
		
	end
	
	
end)


--image2

image2.MouseButton1Up:connect(debounce(function()
	hasVoted = script.Parent.playerVoted
	image1vote = mapNames[1]
	image2vote = mapNames[2]
	image3vote = mapNames[3]
	print(image2vote)
	if hasVoted.Value == 0 then
		AddOne:FireServer(image2vote)
		hasVoted.Value = 2
		wait(1)
	elseif hasVoted.Value == 1 then
		TakeOne:FireServer(image1vote)
		AddOne:FireServer(image2vote)	
		hasVoted.Value = 2
		wait(1)
	elseif hasVoted.Value == 2 then
		TakeOne:FireServer(image2vote)
		AddOne:FireServer(image2vote)
		hasVoted.Value= 2
		wait(1)
	else
		TakeOne:FireServer(image3vote)
		AddOne:FireServer(image2vote)	
		hasVoted.Value = 2
		wait(1)
	end
	
	
end))

-- image3

image3.MouseButton1Up:connect(debounce(function()
	print("BUTTON WAS CLICKED") 
	hasVoted = script.Parent.playerVoted
	image1vote = mapNames[1]
	image2vote = mapNames[2]
	image3vote = mapNames[3]
	if hasVoted.Value == 0 then
		AddOne:FireServer(image3vote)
		hasVoted.Value = 3
		wait(1)
	elseif hasVoted.Value == 1 then
		TakeOne:FireServer(image1vote)
		AddOne:FireServer(image3vote)
		hasVoted.Value = 3
		wait(1)
	elseif hasVoted.Value == 2 then
		TakeOne:FireServer(image2vote)
		AddOne:FireServer(image3vote)
		hasVoted.Value= 3
		wait(1)
	else
		TakeOne:FireServer(image3vote)
		AddOne:FireServer(image3vote)	
		hasVoted.Value = 3
		wait(1)
	end
	
	
end))