local spook = {}
local sinister = {}


local function gui()

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local TextLabel = Instance.new("TextLabel")
local UICorner_2 = Instance.new("UICorner")
local Frame_2 = Instance.new("Frame")
local TextLabel_2 = Instance.new("TextLabel")
local TextLabel_3 = Instance.new("TextLabel")
local TextLabel_4 = Instance.new("TextLabel")
local TextButton = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local TextLabel_5 = Instance.new("TextLabel")
local SpookTP = Instance.new("TextButton")
local UICorner_4 = Instance.new("UICorner")
local SinisterTP = Instance.new("TextButton")
local UICorner_5 = Instance.new("UICorner")


--Properties:

ScreenGui.Name = "Tip's Spook Finder"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
Frame.BorderColor3 = Color3.fromRGB(86, 86, 86)
Frame.Position = UDim2.new(0.378184199, 0, 0.340398997, 0)
Frame.Size = UDim2.new(0, 373, 0, 256)

UICorner.Parent = Frame

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
TextLabel.Size = UDim2.new(0, 373, 0, 33)
TextLabel.Font = Enum.Font.Gotham
TextLabel.Text = "Tip's Spook Finder"
TextLabel.TextColor3 = Color3.fromRGB(190, 190, 190)
TextLabel.TextSize = 30.000
TextLabel.TextWrapped = true

UICorner_2.Parent = TextLabel

Frame_2.Parent = Frame
Frame_2.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
Frame_2.BorderColor3 = Color3.fromRGB(255, 255, 255)
Frame_2.Position = UDim2.new(0.0589812323, 0, 0.203125, 0)
Frame_2.Size = UDim2.new(0, 116, 0, 188)

TextLabel_2.Parent = Frame_2
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.BackgroundTransparency = 1.000
TextLabel_2.Size = UDim2.new(0, 116, 0, 80)
TextLabel_2.Font = Enum.Font.Gotham
TextLabel_2.Text = "Spook in your server: 0"
task.spawn(function()
while task.wait(.3) do
for i, v in pairs(workspace:GetChildren()) do
    if v.Name == "TreeRegion" then
        for k, l in pairs(v:GetChildren()) do
            if l:FindFirstChild("TreeClass") and l:FindFirstChild("WoodSection") and l:FindFirstChild("Owner") then
                if l.TreeClass.Value == "Spooky" and l.Owner.Value == nil and not table.find(spook,l) then
                    table.insert(spook,l)
                    oldSpook = l.WoodSection.CFrame
                    TextLabel_2.Text = "Spook in your server: " .. #spook
                end
            end
        end
    end
end
end
end)
TextLabel_2.TextColor3 = Color3.fromRGB(193, 193, 193)
TextLabel_2.TextScaled = true
TextLabel_2.TextSize = 30.000
TextLabel_2.TextWrapped = true

TextLabel_3.Parent = Frame_2
TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_3.BackgroundTransparency = 1.000
TextLabel_3.Position = UDim2.new(0, 0, 0.521276593, 0)
TextLabel_3.Size = UDim2.new(0, 116, 0, 90)
TextLabel_3.Font = Enum.Font.Gotham
TextLabel_3.Text = "Sinister in your server: 0"
task.spawn(function()
while task.wait(.3) do
for i, v in pairs(workspace:GetChildren()) do
    if v.Name == "TreeRegion" then
        for k, l in pairs(v:GetChildren()) do
            if l:FindFirstChild("TreeClass") and l:FindFirstChild("WoodSection") and l:FindFirstChild("Owner") then
                if l.TreeClass.Value == "SpookyNeon" and l.Owner.Value == nil and not table.find(sinister,l) then
                    table.insert(sinister,l)
                    oldSin = l.WoodSection.CFrame
                    TextLabel_3.Text = "Sinister in your server: " .. #sinister
                    
                end
            end
        end
    end
end
end
end)
TextLabel_3.TextColor3 = Color3.fromRGB(193, 193, 193)
TextLabel_3.TextScaled = true
TextLabel_3.TextSize = 14.000
TextLabel_3.TextWrapped = true

TextLabel_4.Parent = Frame_2
TextLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_4.BackgroundTransparency = 1.000
TextLabel_4.Position = UDim2.new(0, 0, 0.356382996, 0)
TextLabel_4.Size = UDim2.new(0, 116, 0, 31)
TextLabel_4.Font = Enum.Font.SourceSans
TextLabel_4.Text = "--------------"
TextLabel_4.TextColor3 = Color3.fromRGB(193, 193, 193)
TextLabel_4.TextScaled = true
TextLabel_4.TextSize = 14.000
TextLabel_4.TextWrapped = true

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
TextButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
TextButton.Position = UDim2.new(0.426273435, 0, 0.2265625, 0)
TextButton.Size = UDim2.new(0, 200, 0, 50)
TextButton.Font = Enum.Font.Gotham
TextButton.Text = "Server hop"
TextButton.TextColor3 = Color3.fromRGB(193, 193, 193)
TextButton.TextSize = 30.000
TextButton.TextWrapped = true

UICorner_3.Parent = TextButton

TextLabel_5.Parent = Frame
TextLabel_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_5.BackgroundTransparency = 1.000
TextLabel_5.Position = UDim2.new(0.426273465, 0, 0.6953125, 0)
TextLabel_5.Size = UDim2.new(0, 200, 0, 50)
TextLabel_5.Font = Enum.Font.SourceSans
TextLabel_5.Text = "N To Toggle Gui"
TextLabel_5.TextColor3 = Color3.fromRGB(193, 193, 193)
TextLabel_5.TextSize = 30.000

SpookTP.Name = "SpookTP"
SpookTP.Parent = Frame
SpookTP.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
SpookTP.BorderColor3 = Color3.fromRGB(255, 255, 255)
SpookTP.Position = UDim2.new(0.426273465, 0, 0.46875, 0)
SpookTP.Size = UDim2.new(0, 94, 0, 29)
SpookTP.Font = Enum.Font.Gotham
SpookTP.Text = "Tp To Spook"
SpookTP.TextColor3 = Color3.fromRGB(193, 193, 193)
SpookTP.TextScaled = true
SpookTP.TextSize = 30.000
SpookTP.TextWrapped = true

UICorner_4.Parent = SpookTP

SinisterTP.Name = "SinisterTP"
SinisterTP.Parent = Frame
SinisterTP.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
SinisterTP.BorderColor3 = Color3.fromRGB(255, 255, 255)
SinisterTP.Position = UDim2.new(0.710455775, 0, 0.47265625, 0)
SinisterTP.Size = UDim2.new(0, 94, 0, 29)
SinisterTP.Font = Enum.Font.Gotham
SinisterTP.Text = "Tp To Sinister"
SinisterTP.TextColor3 = Color3.fromRGB(193, 193, 193)
SinisterTP.TextScaled = true
SinisterTP.TextSize = 30.000
SinisterTP.TextWrapped = true

UICorner_5.Parent = SinisterTP

-- Scripts:

local function GBWQPO_fake_script() -- TextButton.LocalScript 
	local script = Instance.new('LocalScript', TextButton)

	script.Parent.MouseButton1Up:Connect(function()
		script.Parent.Text = "Server Hopping"
		
		local data = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Desc&excludeFullGames=true&limit=100"))
		local bestfps = 0
		local bestping = 1000
		local bestserver
		for i,v in pairs(data.data) do
			if (v.fps > bestfps) and (v.ping < bestping) then
				bestfps = v.fps
				bestping = v.ping
				bestserver = tostring(v.id)
			end
		end
		game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, bestserver, game.Players.LocalPlayer)
		
		task.wait(4)
		script.Parent.Text = "Server Hop Failed"
		
	end)
end
coroutine.wrap(GBWQPO_fake_script)()
local function UXLACX_fake_script() -- Frame.LocalScript 
	local script = Instance.new('LocalScript', Frame)

	local UserInputService = game:GetService("UserInputService")
	
	local gui = script.Parent
	
	local dragging
	local dragInput
	local dragStart
	local startPos
	
	local function update(input)
		local delta = input.Position - dragStart
		gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
	
	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position
	
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	
	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
	
	
	function onKeyPress(inputObject, gameProcessedEvent)
		if inputObject.KeyCode == Enum.KeyCode.N then
			if script.Parent.Visible == false then
				script.Parent.Visible = true
			else
				script.Parent.Visible = false
			end
		end
	end
	
	game:GetService("UserInputService").InputBegan:connect(onKeyPress)
end
coroutine.wrap(UXLACX_fake_script)()
local function OFVWO_fake_script() -- SpookTP.LocalScript 
	local script = Instance.new('LocalScript', SpookTP)

	script.Parent.MouseButton1Up:Connect(function()
		if oldSpook ~= nil then
			
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldSpook
			
			end
	end)
end
coroutine.wrap(OFVWO_fake_script)()
local function YYAZAE_fake_script() -- SinisterTP.LocalScript 
	local script = Instance.new('LocalScript', SinisterTP)

	script.Parent.MouseButton1Up:Connect(function()
		if oldSin ~= nil then
	
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldSin
	
		end
	end)
end
coroutine.wrap(YYAZAE_fake_script)()
end


if game.Players.LocalPlayer.PlayerGui:FindFirstChild("Tip's Spook Finder") then
    game.Players.LocalPlayer.PlayerGui:FindFirstChild("Tip's Spook Finder"):Destroy()
gui()
else
    gui()
end

local queueteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)

game.Players.LocalPlayer.OnTeleport:Connect(function(State)
    if State == Enum.TeleportState.Started then
        if queueteleport then
            queueteleport("https://raw.githubusercontent.com/tip52/useless-projects/main/spook%20finder%20gui.lua")
        end
    end
end)
