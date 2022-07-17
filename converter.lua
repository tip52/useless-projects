function gui()
	local isClosed = false
	local lib = loadstring(game:HttpGet("https://pastebin.com/raw/DKuakmyG"))()
	local win = lib:Window("Conversion rate", Color3.fromRGB(173, 216, 230))
	local tab = win:Tab("Main")
	local settings = win:Tab("Settings")
	local creds = win:Tab("Credits")
	creds:Label("Scripting: tip#0145")
	tab:Dropdown("Conversion", {"CAD to USD", "USD to CAD", "Km to Miles", "Miles to Km", "Robux to CAD", "Robux to USD", "°C to °F", "°F to °C"}, function(t)
		option = t
		lib:Notification(t, "Was chosen", "Okay")
		if option == "CAD to USD" then
			convertNum = 1.30258
		elseif option == "USD to CAD" then
			convertNum = .7677
		elseif option == "Km to Miles" then
			convertNum = .621371
		elseif option == "Miles to Km" then
			convertNum = 1.609344
		elseif option == "Robux to CAD" then
			convertNum = .000145
		elseif option == "Robux to USD" then
			convertNum = .000112
		elseif option == "°C to °F" then
			convertNum = 1.8
		elseif option == "°F to °C" then
			convertNum = 1.8
		end
	end)
	tab:Textbox("amount to convert", true, function(t)
		amt = t
	end)
	tab:Button("Convert", function()
		if option == "CAD to USD" then
			result = amt * convertNum
			lib:Notification(result, "Using " .. option, "Okay")
		elseif option == "USD to CAD" then
			result = amt * convertNum
			lib:Notification(result, "Using " .. option, "Okay")
		elseif option == "Km to Miles" then
			result = amt * convertNum
			lib:Notification(result .. " Miles", "Using " .. option, "Okay")
		elseif option == "Miles to Km" then
			result = amt * convertNum
			lib:Notification(result .. " Km", "Using " .. option, "Okay")
		elseif option == "Robux to CAD" then
			result = amt * convertNum
			lib:Notification(result .. " CAD", "Using " .. option, "Okay")
		elseif option == "Robux to USD" then
			result = amt * convertNum
			lib:Notification(result .. " USD", "Using " .. option, "Okay")
		elseif option == "°C to °F" then
			result = amt * convertNum + 32
			lib:Notification(result, "Using " .. option, "Okay")
		elseif option == "°F to °C" then
			result = amt - 32
			result2 = result / convertNum
			lib:Notification(result2, "Using " .. option, "Okay")
		end
	end)
	settings:Bind("Menu Toggle", Enum.KeyCode.N, function()
		if isClosed == false then
			game:GetService("CoreGui"):FindFirstChild("ui").Main.Visible = false
			isClosed = true
		else
			game:GetService("CoreGui"):FindFirstChild("ui").Main.Visible = true
			isClosed = false
		end
	end)
	settings:Colorpicker("Change UI Color", Color3.fromRGB(173, 216, 230), function(t)
		lib:ChangePresetColor(Color3.fromRGB(t.R * 255, t.G * 255, t.B * 255))
	end)
	settings:Button("Destroy Gui", function()
		game:GetService("CoreGui"):FindFirstChild("ui"):Destroy()
	end)
end
spawn(function()
	if game:GetService("CoreGui"):FindFirstChild("ui") then
		game:GetService("CoreGui"):FindFirstChild("ui"):Destroy()
		gui()
	else
		gui()
	end
end)
