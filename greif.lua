repeat
    task.wait()
until
    game.Players.LocalPlayer


getgenv().Speed = 16
_G.KeyCode = "X"
if not isfolder("Greif Config") then
    makefolder("Greif Config")
    if not isfile("Greif Config/WalkSpeed.txt") then
        writefile("Greif Config/WalkSpeed.txt",16)
    end
    if not isfile("Greif Config/Fling.txt") then
        writefile("Greif Config/Fling.txt","false")
    end

end

getgenv().Speed = tonumber(readfile("Greif Config/WalkSpeed.txt"))
fling = readfile("Greif Config/Fling.txt")
if fling == "true" then
    loadstring(game:HttpGet("https://shattered-gang.lol/scripts/fe/touch_fling.lua"))()
end



_G.flyKey = "q"
function Walkspeed()
    game.Players.LocalPlayer.Character.Humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = getgenv().Speed
    end)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = getgenv().Speed
end

function serverHop()
    local data = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Desc&excludeFullGames=true&limit=100"))
    local bestfps = 0
    local bestping = 1000
    local bestserver
    for i,v in pairs(data.data) do
        if (tonumber(v.fps) > bestfps) and (tonumber(v.ping) < bestping) and tonumber(v.maxPlayers) > tonumber(v.playing) then
            bestfps = v.fps
            bestping = v.ping
            bestserver = v.id
        end
    end
    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, bestserver, game.Players.LocalPlayer)
end

local FlyingEnabled = false
local maxspeed = 150
function BetterFly()
    repeat wait() until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Head") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid")
    local mouse = game.Players.LocalPlayer:GetMouse()
    repeat wait() until mouse
    local plr = game.Players.LocalPlayer
    local torso = plr.Character.Head
    local flying = false
    local deb = true
    local ctrl = {f = 0, b = 0, l = 0, r = 0}
    local lastctrl = {f = 0, b = 0, l = 0, r = 0}
    local speed = 5000

    function Fly()
        local bg = Instance.new("BodyGyro", torso)
        bg.P = 9e4
        bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
        bg.cframe = torso.CFrame
        local bv = Instance.new("BodyVelocity", torso)
        bv.velocity = Vector3.new(0,0.1,0)
        bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
        repeat wait()
            plr.Character.Humanoid.PlatformStand = true
            if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
                speed = maxspeed
            elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
                speed = 0
            end
            if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
                bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
                lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
            elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
                bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*0.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
            else
                bv.velocity = Vector3.new(0,0,0)
            end
            bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*speed/maxspeed),0,0)
        until not flying
        ctrl = {f = 0, b = 0, l = 0, r = 0}
        lastctrl = {f = 0, b = 0, l = 0, r = 0}
        speed = 0
        bg:Destroy()
        bv:Destroy()
        plr.Character.Humanoid.PlatformStand = false
    end
    mouse.KeyDown:connect(function(key)
        if key:lower() == _G.flyKey and FlyingEnabled == true then
            if flying then flying = false
            else
                flying = true
                Fly()
            end
        elseif key:lower() == "w" then
            ctrl.f = 1
        elseif key:lower() == "s" then
            ctrl.b = -1
        elseif key:lower() == "a" then
            ctrl.l = -1
        elseif key:lower() == "d" then
            ctrl.r = 1
        end
    end)
    mouse.KeyUp:connect(function(key)
        if key:lower() == "w" then
            ctrl.f = 0
        elseif key:lower() == "s" then
            ctrl.b = 0
        elseif key:lower() == "a" then
            ctrl.l = 0
        elseif key:lower() == "d" then
            ctrl.r = 0
        end
    end)
    Fly()
end
game.Players.LocalPlayer.CharacterAdded:Connect(BetterFly)
BetterFly()

local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/thombomb2009/butter-hub/main/lib.txt"))()

local GUI = Mercury:Create{
    Name = "Greif Gui",
    Size = UDim2.fromOffset(600, 400),
    Theme = Mercury.Themes.a,
    Link = "https://Butter.com/Base_Fucker"
}

local Main = GUI:Tab{
    Name = "Player",
    Icon = "rbxassetid://6023426915"
}

Main:Slider{
    Name = "Walk Speed",
    Default = 16,
    Min = 16,
    Max = 250,
    Callback = function(v)
        getgenv().Speed = v
        Walkspeed()
        writefile("Greif Config/WalkSpeed.txt",v)
    end
}



task.spawn(function()
    task.wait()
    if game.Players.LocalPlayer.Character.Humanoid.WalkSpeed ~= getgenv().Speed then
        Walkspeed()
    end
end)

Main:Textbox{
    Name = "Fly Toggle (Default Q)",
    Callback = function(v)
        _G.flyKey = v
    end
}

Main:Toggle{
    Name = "Fly",
    StartingState = false,
    Description = nil,
    Callback = function(state)
        FlyingEnabled = state
        BetterFly()
    end
}

if readfile("Greif Config/Fling.txt") == true then
    startingstate2 = true
else
    startingstate2 = false
end
Main:Toggle{
    Name = "Auto load Fling Script (x to toggle fling)",
    StartingState = startingstate2,
    Description = nil,
    Callback = function(v)
        writefile("Greif Config/Fling.txt",tostring(v))
    end
}

Main:Button{
    Name = "Execute Fling Script (x to toggle fling)",
    Description = nil,
    Callback = function()
        loadstring(game:HttpGet("https://shattered-gang.lol/scripts/fe/touch_fling.lua"))()
    end
}


Main:Button{
    Name = "Destroy Blacklist Walls",
    Description = nil,
    Callback = function()
        if workspace:FindFirstChild("Effects") then
            workspace.Effects:Destroy()
        end
    end
}

Main:Button{
    Name = "Server Hop",
    Description = nil,
    Callback = function()

        serverHop()

    end
}


local queueteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)
local Players = game.Players
shid = true

Players.LocalPlayer.OnTeleport:Connect(function(State)
    if State == Enum.TeleportState.Started then
        if shid and queueteleport then
            queueteleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/tip52/useless-projects/main/greif.lua'))()")
        end
    end
end)
