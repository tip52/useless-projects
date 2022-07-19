function gui()
	local isClosed = false
	local lib = loadstring(game:HttpGet("https://pastebin.com/raw/DKuakmyG"))()
	local win = lib:Window("webhook utilities", Color3.fromRGB(173, 216, 230))
	local tab = win:Tab("Embed")
	local tab2 = win:Tab("Message")
	local settings = win:Tab("Settings")
	local creds = win:Tab("Credits")
	creds:Label("Scripting: tip#0145")
	tab:Textbox("Webhook", true, function(t)
		url = t
	end)
	tab:Textbox("Main message", true, function(t)
		content = t
	end)
	tab:Textbox("Embed Title", true, function(t)
		title = t
	end)
	tab:Textbox("Embed Description", true, function(t)
		desc = t
	end)
	tab:Textbox("Footer Text", true, function(t)
		footer = t
	end)
	tab:Textbox("Webhook Name", true, function(t)
		name = t
	end)
	tab:Button("Send message", function()
		function webhook(_, color)
			local data = {
				["content"] = content,
				["username"] = name,
				["embeds"] = {{
					["title"] = title,
					["description"] = desc,
					["type"] = "rich",
					["color"] = color,
					["footer"] = {
						["text"] = footer
					}
				}}
			}
			local newdata = game:GetService("HttpService"):JSONEncode(data)
			local headers = {
				["content-type"] = "application/json"
			}
			request = http_request or request or HttpPost or syn.request
			local a = {
				Url = url,
				Body = newdata,
				Method = "POST",
				Headers = headers
			}
			request(a)
		end
		webhook("", tonumber(0))
	end)
	tab:Toggle("Spam Webhook message", false, function(t)
		while t == true do
			task.wait(1)
			function webhook(_, color)
				local data = {
					["content"] = content,
					["username"] = name,
					["embeds"] = {{
						["title"] = title,
						["description"] = desc,
						["type"] = "rich",
						["color"] = color,
						["footer"] = {
							["text"] = footer
						}
					}}
				}
				local newdata = game:GetService("HttpService"):JSONEncode(data)
				local headers = {
					["content-type"] = "application/json"
				}
				request = http_request or request or HttpPost or syn.request
				local a = {
					Url = url,
					Body = newdata,
					Method = "POST",
					Headers = headers
				}
				request(a)
			end
			webhook("", tonumber(0))
		end
	end)
	tab2:Textbox("Webhook", true, function(t)
		url = t
	end)
	tab2:Textbox("Webhook Text", true, function(t)
		content2 = t
	end)
	tab2:Textbox("Webhook Name", true, function(t)
		name2 = t
	end)
	tab2:Button("Send message", function()
		function webhook(_, _)
			local data = {
				["content"] = content2,
				["username"] = name2
			}
			local newdata = game:GetService("HttpService"):JSONEncode(data)
			local headers = {
				["content-type"] = "application/json"
			}
			request = http_request or request or HttpPost or syn.request
			local a = {
				Url = url,
				Body = newdata,
				Method = "POST",
				Headers = headers
			}
			request(a)
		end
		webhook("", tonumber(0))
	end)
	tab2:Toggle("Spam Webhook message", false, function(t)
		while t == true do
			task.wait(1)
			function webhook(_, _)
				local data = {
					["content"] = content2,
					["username"] = name2
				}
				local newdata = game:GetService("HttpService"):JSONEncode(data)
				local headers = {
					["content-type"] = "application/json"
				}
				request = http_request or request or HttpPost or syn.request
				local a = {
					Url = url,
					Body = newdata,
					Method = "POST",
					Headers = headers
				}
				request(a)
			end
			webhook("", tonumber(0))
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
