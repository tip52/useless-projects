--skidding is a fedral crime
--you are a skid stop looking at my source code
--skid
--stop skidding

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wave"))()
local Main = library:Main()
local w1 = Main:Tab("Green Bit Hack")
local Section = w1:Section("by tip#0145")
local l = 0
local glass
getgenv().redGlass = false


Section:Item(
    "button",
    "admin commands",
    function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end)

Section:Item(
    "button",
    "Put in Book Code",
    function()
        if game:GetService("Workspace").BoatStages.NormalStages.ForestStage:FindFirstChild("TheWizardRoom") and game:GetService("Workspace").BoatStages.NormalStages.ForestStage.TheWizardRoom:FindFirstChild("Books") then
            for i,v in pairs(game:GetService("Workspace").BoatStages.NormalStages.ForestStage.TheWizardRoom.Books:GetDescendants()) do
                if v:IsA("BasePart") then
                    if v.BrickColor == BrickColor.new("Neon green") and l < 1 then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                        task.wait(0.3)
                        fireclickdetector(v.Parent.ClickDetector)
                        l = l + 1
                    end
                end
            end
            task.wait(0.4)
            l = 0
            for i,v in pairs(game:GetService("Workspace").BoatStages.NormalStages.ForestStage.TheWizardRoom.Books:GetDescendants()) do
                if v:IsA("BasePart") then
                    if v.BrickColor == BrickColor.new("Really red") and l < 1 then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                        task.wait(0.3)
                        fireclickdetector(v.Parent.ClickDetector)
                        l = l + 1
                    end
                end
            end
            task.wait(0.4)
            l = 0
            for i,v in pairs(game:GetService("Workspace").BoatStages.NormalStages.ForestStage.TheWizardRoom.Books:GetDescendants()) do
                if v:IsA("BasePart") then
                    if v.BrickColor == BrickColor.new("Hot pink") and l < 1 then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                        task.wait(0.3)
                        fireclickdetector(v.Parent.ClickDetector)
                        l = l + 1
                    end
                end
            end
            task.wait(0.4)
            l = 0
            for i,v in pairs(game:GetService("Workspace").BoatStages.NormalStages.ForestStage.TheWizardRoom.Books:GetDescendants()) do
                if v:IsA("BasePart") then
                    if v.BrickColor == BrickColor.new("Cyan") and l < 1 then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                        task.wait(0.3)
                        fireclickdetector(v.Parent.ClickDetector)
                        l = l + 1
                    end

                end
            end
            l = 0
            task.wait(0.4)
            for i,v in pairs(game:GetService("Workspace").BoatStages.NormalStages.ForestStage.TheWizardRoom.Books:GetDescendants()) do
                if v:IsA("BasePart") then
                    if v.BrickColor == BrickColor.new("Lime green") and l == 0 then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                        task.wait(0.3)
                        fireclickdetector(v.Parent.ClickDetector)
                        l = l + 1
                    end

                end
            end
            l = 0
        end
    end)

Section:Item(
    "button",
    "Use Key",
    function()
        if game.Players.LocalPlayer.Character:FindFirstChild("Key") then
            game.Players.LocalPlayer.Character:FindFirstChild("Key").Parent = game.Players.LocalPlayer.Backpack
        end
        if game.Players.LocalPlayer.Backpack:FindFirstChild("Key") then
            game.Players.LocalPlayer.Backpack:FindFirstChild("Key").Parent = game.Players.LocalPlayer.Character

            local args = {
                [1] = workspace.BoatStages.NormalStages.ForestStage.TheWizardRoom.Plushie1.TreasureChestYellow.Part
            }

            game:GetService("Players").LocalPlayer.Character.Key.Handle.RemoteFunction:InvokeServer(unpack(args))
        end
    end)



Section:Item(
    "toggle",
    "Bring red glass",
    function(v)
        getgenv().redGlass = v

        if not workspace:FindFirstChild("RedGlass") then
            glass = Instance.new("Part")
            glass.Size = Vector3.new(0,1.6,2)
            glass.CFrame = game.Players.LocalPlayer.Character.Head.CFrame * CFrame.new(0,4,-3)
            glass.CFrame = glass.CFrame * CFrame.fromEulerAnglesXYZ(0, math.rad(90), 0)
            glass.Color = Color3.fromRGB(220,40,27)
            glass.Transparency = 1
            glass.Anchored = true
            glass.Name = "RedGlass"
            glass.Material = Enum.Material.Glass
            glass.Parent = workspace
        else
            workspace:FindFirstChild("RedGlass"):Destroy()
        end


        task.spawn(function()
            while task.wait() do

                if getgenv().redGlass and glass ~= nil then
                    glass.Transparency = 0.5
                    glass.CFrame = game.Players.LocalPlayer.Character.Head.CFrame * CFrame.new(0,4,-3)
                    glass.CFrame = glass.CFrame * CFrame.fromEulerAnglesXYZ(0, math.rad(90), 0)
                end
                if getgenv().redGlass == false then
                    glass:Destroy()
                    break
                end
            end
        end)
    end)

Section:Item(
    "button",
    "Teleport to safe spot",
    function()
        if not workspace:FindFirstChild("safePart") then
            local part = Instance.new("Part")
            part.Anchored = true
            part.CFrame = CFrame.new(-2.2056942, 163.100677, 21.1380997, 0.151307687, 8.91890028e-09, 0.988486707, 2.88994584e-09, 1, -9.465146e-09, -0.988486707, 4.28882263e-09, 0.151307687)
            part.Size = Vector3.new(15,1,15)
            part.Name = "safePart"
            part.Parent = workspace
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = part.CFrame
        else
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2.2056942, 163.100677, 21.1380997, 0.151307687, 8.91890028e-09, 0.988486707, 2.88994584e-09, 1, -9.465146e-09, -0.988486707, 4.28882263e-09, 0.151307687)
        end
    end)
