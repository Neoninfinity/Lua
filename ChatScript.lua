
local ContextActionService = game:GetService("ContextActionService")
 
-- Static variables
local MAX_MESSAGES = 10
local MESSAGE_HEIGHT = 25
 
-- Local variables
local player = game.Players.LocalPlayer
local messages = {}
local chatMessageEvent = game.ReplicatedStorage.ChatMessage
 
-- Variables for GUI elements
local chatScreen = script.Parent
local chatFrame = chatScreen.ChatFrame
local chatInput = chatFrame.ChatInput
local messageFrame = chatFrame.MessageFrame
-- Make a copy of the message that will be used later
local messageTemplate = messageFrame.Message:Clone()
messageFrame.Message:Destroy()
 
 
local function addMessage(sender, message)
	-- Check if the number of messages has hit the maximum
	local x = message:gsub("%s+", "")
	if (string.len(x) >= 1) then
		script.Parent.ChatFrame.MessageFrame.Visible = true
		script.Parent.Counter.Value = 10
		if #messages >= MAX_MESSAGES then
			-- If so remove the oldest message from the table
			table.remove(messages, #messages):Destroy()
		end
	 
		-- Shift all of the messages up one slot
		for i = 1, #messages do
			local y = (MAX_MESSAGES - i - 1) * MESSAGE_HEIGHT
			messages[i].Position = UDim2.new(0, 0, 0, y)
		end	
	 
		-- Create new message GUI elements and add to the message table
		local newMessage = messageTemplate:Clone()
		newMessage.Content.Text = message
		newMessage.Parent = messageFrame
		newMessage.sender.Value = sender.Name
		newMessage.pN.Value = "["..sender.Name .. "]"
		newMessage.Content.TextTransparency = 1
		newMessage.Position = UDim2.new(0, 0, 0, (MAX_MESSAGES - 1) * MESSAGE_HEIGHT)
		table.insert(messages, 1, newMessage)
	end
end
 
-- Function when the input TextBox looses focus
local function onFocusLost(enterPressed, inputObject)
	-- Check if TextBox lost focus because the user pressed "Enter"
	if enterPressed then
		-- Add the message to the GUI (no need to filter messages from the local player)
		addMessage(player, chatInput.Text)
		-- Send message to the server to get filtered and sent to other players
		chatMessageEvent:FireServer(chatInput.Text)
		-- Reset TextBox text
		chatInput.Text = "Press / to chat:"
	end
end
 
-- Function when the player presses the slash key
local function onSlashPressed(actionName, inputState, inputObject)
	if inputState == Enum.UserInputState.End then
		script.Parent.ChatFrame.MessageFrame.Visible = true
		script.Parent.Counter.Value = 10
		-- If key up then capture focus in the TextBox so the user can start typing
		chatInput:CaptureFocus()
	end
end
 
-- Disable default chat
game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false)
 
-- Bind functions
chatMessageEvent.OnClientEvent:connect(addMessage)
chatInput.FocusLost:connect(onFocusLost)
ContextActionService:BindAction("Chatting", onSlashPressed, false, Enum.KeyCode.Slash)