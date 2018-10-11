
local ChatService = game:GetService("Chat")
 
-- Local variables
local chatMessage = game.ReplicatedStorage.ChatMessage
 
-- Function called when a player sends a chat message
local function onChatReceived(sender, message)
	-- Loop through all of the players in the game (except for the player that sent the message)
	for _, player in pairs(game.Players:GetPlayers()) do
		if sender ~= player then
			local filteredMessage
			if game:GetService("RunService"):IsStudio() then
				-- FilterStringAsync does not work in Studio
				chatMessage:FireClient(player, sender, message)
			else
				local success, filteredMessage = pcall(function() return ChatService:FilterStringAsync(message, sender, player) end)
				if not success then
					filteredMessage = message --"<Failed to filter message>"
				end
				chatMessage:FireClient(player, sender, filteredMessage)
			end
		end
	end
end
 
-- Bind onChatReceived to the RemoteEvent's server event
chatMessage.OnServerEvent:connect(onChatReceived)