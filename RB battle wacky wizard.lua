local CoreGui = game:GetService("StarterGui")
CoreGui:SetCore("SendNotification", {
    Title = "Wacky Wizards Autocomplete",
    Text = "By tip#0145",
    Duration = math.huge,
})

task.spawn(function()
while task.wait() do
for i,v in pairs(workspace.ObbyFolder:GetDescendants()) do
    if v.Name == "EndZone" and v:FindFirstChild("TouchInterest") then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
    end
end
end
end)
