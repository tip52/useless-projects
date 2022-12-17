--getgenv().chams = true
local items = {}
local items2 = {}
local function Chams(inst)
    local Cham = Instance.new("Highlight")
    Cham.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    Cham.FillColor = Color3.new(255,0,0)
    Cham.FillTransparency = 0.5
    Cham.OutlineColor = Color3.new(255,255,255)
    Cham.Parent = game:GetService("CoreGui")
    Cham.Enabled = true
    Cham.Adornee = inst
    Cham.RobloxLocked = true
    return Cham
end
task.spawn(function()
    while task.wait() do
        if chams == true then
            for i,v in pairs(game:GetService("Workspace")["RB Battles Obby"].Objects.SecuritySwitches:GetDescendants()) do
                if v:IsA("Part") then
                    for k,l in pairs(items) do
                        table.insert(items2,l.Adornee)
                    end
                    if v.Material ~= Enum.Material.Neon then
                    if not table.find(items2,v) then
                        table.insert(items,Chams(v))
                    end
                    else
                        for b,pee in pairs(items) do
                        if pee.Adornee == v then
                            pee:Destroy()
                        end
                        end
 
                end
            end
            end
    else
        for cock,balls in pairs(items) do
        balls:Destroy()
        end
        items = {}
        items2 = {}
        return
            end
 
end
end)
