function notif(icon,title,desc,time)


local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local UICorner = Instance.new("UICorner")
local UICorner_2 = Instance.new("UICorner")
local ImageLabel = Instance.new("ImageLabel")
local UICorner_3 = Instance.new("UICorner")
local TextLabel_2 = Instance.new("TextLabel")
local UICorner_4 = Instance.new("UICorner")
local TweenService = Game:GetService("TweenService")
--Properties:


if game.CoreGui:FindFirstChild("Notif") then
if syn.protect_gui then 
	syn.protect_gui(ScreenGui)
end
ScreenGui.Parent = game.CoreGui
ScreenGui.Name = "Notif2"
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
tweento = UDim2.new(0.787, 0, 0.76, 0)
else
tweento = UDim2.new(0.787, 0, 0.85, 0)
if syn.protect_gui then 
syn.protect_gui(ScreenGui)
end
ScreenGui.Parent = game.CoreGui
ScreenGui.Name = "Notif"
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
end

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
Frame.Position = UDim2.new(1, 0, 1, 0)
Frame.Size = UDim2.new(0, 407, 0, 81)

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
TextLabel.Position = UDim2.new(0.0859950855, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 372, 0, 24)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.TextColor3 = Color3.fromRGB(225, 225, 225)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true
TextLabel.Text = title

UICorner.Parent = TextLabel

UICorner_2.Parent = Frame

ImageLabel.Parent = Frame
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.Position = UDim2.new(0.0277420152, 0, 0.123000003, 0)
ImageLabel.Size = UDim2.new(0, 60, 0, 60)
ImageLabel.Image = "http://www.roblox.com/asset/?id=" .. tostring(icon)

UICorner_3.Parent = ImageLabel

TextLabel_2.Parent = Frame
TextLabel_2.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
TextLabel_2.Position = UDim2.new(0.211600944, 0, 0.296296299, 0)
TextLabel_2.Size = UDim2.new(0, 305, 0, 50)
TextLabel_2.Font = Enum.Font.SourceSans
TextLabel_2.Text = desc
TextLabel_2.TextColor3 = Color3.fromRGB(226, 226, 226)
TextLabel_2.TextSize = 15.000
TextLabel_2.TextWrapped = true

UICorner_4.Parent = TextLabel_2

TweenService:Create(Frame, TweenInfo.new(0.45, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position = tweento}):Play()
task.wait(time)
TweenService:Create(Frame, TweenInfo.new(0.45, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position = UDim2.new(1, 0, 1, 0)}):Play()
task.wait(0.1)
ScreenGui:Destroy()
end
return notif
