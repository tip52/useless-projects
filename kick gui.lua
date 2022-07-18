function gui()
	local isClosed = false
	local lib = loadstring(game:HttpGet("https://pastebin.com/raw/DKuakmyG"))()
	local win = lib:Window("Kick gui", Color3.fromRGB(173, 216, 230))
	local tab = win:Tab("Main")
	local settings = win:Tab("Settings")
	local creds = win:Tab("Credits")
	creds:Label("Scripting: tip#0145")
	tab:Textbox("Kick message", true, function(t)
		message = t
	end)
	tab:Button("Kick", function()
		game.Players.LocalPlayer:Kick(message)
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
	tab:Button("Shut down game", function()
		game:Shutdown()
	end)
	tab:Slider("fps cap (enable unlock fps for synapse)", 1, 1e3, 60, function(t)
		setfpscap(t)
	end)
	tab:Button("Rejoin", function()
		Players = game.Players
		TeleportService = game:GetService("TeleportService")
		if #Players:GetPlayers() <= 1 then
			Players.LocalPlayer:Kick("\nRejoining Server...")
			wait()
			TeleportService:Teleport(game.PlaceId, Players.LocalPlayer)
		else
			TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, Players.LocalPlayer)
		end
	end)
	tab:Button("Server Hop", function()
		TeleportService = game:GetService("TeleportService")
		Players = game.Players
		HttpService = game:GetService("HttpService")
		httprequest = (syn and syn.request) or http and http.request or http_request or (fluxus and fluxus.request) or request
		if httprequest then
			local servers = {}
			local cursor = ""
			local req = httprequest({
				Url = string.format("https://games.roblox.com/v1/games/%s/servers/Public?sortOrder=Asc&limit=100&cursor=%s", game.PlaceId, cursor)
			})
			local body = HttpService:JSONDecode(req.Body)
			if body and body.data then
				task.spawn(function()
					for _, v in next, body.data do
						if type(v) == "table" and tonumber(v.playing) and tonumber(v.maxPlayers) and v.playing < v.maxPlayers then
							table.insert(servers, 1, v.id)
						end
					end
				end)
				if body.nextPageCursor then
					cursor = body.nextPageCursor
				end
			end
			if #servers > 0 then
				TeleportService:TeleportToPlaceInstance(game.PlaceId, servers[math.random(1, #servers)], Players.LocalPlayer)
			else
				local CoreGui = game:GetService("StarterGui")
				CoreGui:SetCore("SendNotification", {
					Title = "Server Hop",
					Text = "server hop errored",
					Duration = 10
				})
				return
			end
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
