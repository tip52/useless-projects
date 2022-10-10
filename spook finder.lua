getgenv().webhook = "webhook here"

local Tree

function serverhop()

    game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)

end

for i, v in pairs(workspace:GetChildren()) do
    if v.Name == "TreeRegion" then
        for k, l in pairs(v:GetChildren()) do
            if l:FindFirstChild("TreeClass") and l:FindFirstChild("WoodSection") and l:FindFirstChild("Owner") then
                if (l.TreeClass.Value == "Spooky" or l.TreeClass.Value == "SpookyNeon") and l.Owner.Value == nil then
                    Tree = l
                end
            end
        end
    end
end

if Tree == nil then
    serverhop()

else


    local spookCFrame = Tree["WoodSection"].CFrame
    local time = os.date("%c", os.time())
    local teleport = "```lua\n".. 'game:GetService("TeleportService")'..":TeleportToPlaceInstance".."("..game.PlaceId..",".. "'" .. game.JobId.. "'".. ",".."game.Players.LocalPlayer"..")```"
    local tpScript = "game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(" .. tostring(spookCFrame) .. ")"
    local gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name

    function webhook(NAME)
        url = getgenv().webhook
        local data = {
            ["content"] = "",
            ["username"] = NAME,
            ["embeds"] = {
                {
                    ["title"] = 'Script Execution Logs',
                    ["description"] = "Will Send A Webhook When Spook Wood Is Found.",
                    ["type"] = "rich",
                    ["footer"] = {
                        ["text"] = time
                    },
                    fields = {

                        {
                            name = "**Join script**",
                            value = teleport,
                            inline = true
                        },

                        {
                            name = "**Auto Claimer**",
                            value = '```lua\nloadstring(game:HttpGet("https://pastebin.com/raw/uaK9gH1s"))()```',
                            inline = false
                        },
                        {
                            name = "**Teleport Script**",
                            value = "```lua\n" .. tpScript .. "```",
                            inline = false

                        }




                    }
                }
            }
        }
        local newdata = game:GetService("HttpService"):JSONEncode(data)

        local headers = {
            ["content-type"] = "application/json"
        }

        request = http_request or request or HttpPost or syn.request
        local a = {Url = url, Body = newdata, Method = "POST", Headers = headers}

        request(a)
    end

    webhook("Spook Finder")


    serverhop()
end
