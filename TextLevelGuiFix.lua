Level = script.Parent.Parent.EXP
Creds = script.Parent.Parent.CREDITS
Neon = script.Parent.Parent.neonites

Creds.Changed:connect(function()
	script.Parent.LevelSys.CValue.Text = Creds.Value.." ".."Credits"
end)

Level.Changed:connect(function()
	local LevelN = math.floor(Level.Value/1000)
	script.Parent.LevelSys.Lnum.Text = "Level".." "..LevelN
end)

Neon.Changed:connect(function()
	script.Parent.neonnites.Frame.ImageLabel.TextLabel.Text = Neon.Value
end)


