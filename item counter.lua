items23 = {}
table42 = {}


for i,v in pairs(game:GetService("Workspace").PlayerModels:GetDescendants()) do
            if v.Name == "ItemName" then
                    if not table.find(items23,v.Value) then
                    table.insert(items23,v.Value)

            end
                else
                    if v.Name == "PurchasedBoxItemName" then
                        if not table.find(items23,v.Value) then
                        table.insert(items23,v.Value)
                    end
                    end
                end
end

local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/thombomb2009/butter-hub/main/lib.txt"))()

local GUI = Mercury:Create{
    Name = "Butter",
    Size = UDim2.fromOffset(600, 400),
    Theme = Mercury.Themes.a,
    Link = "https://github.com/Butter"
}

local main = GUI:Tab{
	Name = "Main",
	Icon = "rbxassetid://6023426915"
}

local function notif(txt)

    GUI:Notification{
        Title = "Item Counter",
        Text = txt,
        Duration = 4,
        Callback = function() 
        end
    }

end

local ItemsDrop = main:Dropdown{
	Name = "Select Item",
	StartingText = "Select Item...",
	Items = items23,
		
	Callback = function(v) 
    
        getgenv().item = v
    end
}

main:Button{
    Name = "Refresh Dropdown",
    Description = nil,
    Callback = function() 

        MyDropdown:RemoveItems({items23})
        
        for i,v in pairs(game:GetService("Workspace").PlayerModels:GetDescendants()) do
            if v.Name == "ItemName" then
                    if not table.find(items23,v.Value) then
                    table.insert(items23,v.Value)

            end
                else
                    if v.Name == "PurchasedBoxItemName" then
                        if not table.find(items23,v.Value) then
                        table.insert(items23,v.Value)
                    end
                    end
                end
end


ItemsDrop:AddItems({items23})

    end
}



    main:Button{
        Name = "Count Items",
        Description = nil,
        Callback = function() 
            for i,v in pairs(game:GetService("Workspace").PlayerModels:GetDescendants()) do
                if v:FindFirstChild("Owner") then
                    if v.Owner.Value == game.Players.LocalPlayer then
                        if v:FindFirstChild("ItemName") then
                            if v.ItemName.Value == getgenv().item and not table.find(table42,v) then
                                table.insert(table42,v)
            
                            end
                            else
                                if v:FindFirstChild("PurchasedBoxItemName") then
                                    if v.PurchasedBoxItemName.Value == getgenv().item and not table.find(table42,v) then
            
            
                                        table.insert(table42,v)
            
                                    end
            
                                end
                            end
                        end
                    end
                end
        
        
                if #table42 < 2 then
                    notif("you have " .. tostring(#table42) .. " " .. getgenv().item .. " item")
                    table42 = {}
                    else
                    notif("you have " .. tostring(#table42) .. " " .. getgenv().item .. " items")
                    table42 = {}
                    end
        
        end
    }

