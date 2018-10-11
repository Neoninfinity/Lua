

local serverStorage = game:GetService("Lighting")
local startVote = game.Lighting.GameStats.VoteMap.guiEngage
local text1 = script.Parent.Vote1.Frame.ImageButton.Votes
local text2 = script.Parent.Vote2.Frame.ImageButton.Votes
local text3 = script.Parent.Vote3.Frame.ImageButton.Votes

local selectedNames = game.Lighting.GameStats.VoteMap.mapNames
mapNames = selectedNames:GetChildren()

image1vote = mapNames[1]
image2vote = mapNames[2]
image3vote = mapNames[3]


m1 = game.Lighting.GameStats.VoteMap.mapNames.Map1
m2 = game.Lighting.GameStats.VoteMap.mapNames.Map2
m3 = game.Lighting.GameStats.VoteMap.mapNames.Map3




startVote.Changed:connect(function()
	if startVote.Value == 1 then
		while startVote.Value == 1 do
			wait(1)
			text1.Text = ("Votes:".." "..image1vote.Value)
			text2.Text = ("Votes:".." "..image2vote.Value)
			text3.Text = ("Votes:".." "..image3vote.Value)
		end
	else
		text1.Text = ("Votes:".." "..0)
		text2.Text = ("Votes:".." "..0)
		text3.Text = ("Votes:".." "..0)
		wait(5)
		image1vote.Value =0
		image2vote.Value = 0
		image3vote.Value = 0
	end
end)
