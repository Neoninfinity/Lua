function onKeyPress(actionName, userInputState, inputObject)
	if userInputState == Enum.UserInputState.Begin then
	   local rs = game:GetService("ReplicatedStorage")
	   rs.epress:FireServer()
	end
end
 
game.ContextActionService:BindAction("keyPress", onKeyPress, false, Enum.KeyCode.E)