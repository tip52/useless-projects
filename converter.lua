function gui() -- creating gui function to avoid multiple guis spawning
    local isClosed = false -- setting isClosed to false for gui toggle

    local lib = loadstring(game:HttpGet"https://pastebin.com/raw/DKuakmyG")() -- setting lib

    local win = lib:Window("Conversion rate",Color3.fromRGB(173,216,230)) -- creating window, color is later overridden by gui color picker
    
    local tab = win:Tab("Main") -- creating window

    local settings = win:Tab("Settings") -- creating settings tab

    local creds = win:Tab("Credits") -- creating credits tab

    creds:Label("Scripting: tip#0145") -- giving my self credits LMAO

    tab:Dropdown("Conversion",{"CAD to USD", "USD to CAD", "Km to Miles", "Miles to Km", "Robux to CAD", "Robux to USD", "°C to °F", "°F to °C"}, function(t) -- creating dropdown for conversion
        option = t -- setting option to t so that we can use it outside of the dropdown
        lib:Notification(t, "Was chosen", "Okay") -- sending notification
        if option == "CAD to USD" then
          convertNum = 1.30258 -- current cad to usd conversion rate
        elseif option == "USD to CAD" then 
            convertNum =  0.767700 -- current usd to cad conversion rate
        elseif option == "Km to Miles" then
            convertNum = 0.621371 -- current km to miles conversion rate
        elseif option == "Miles to Km" then
            convertNum = 1.609344 -- current miles to km conversion rate
        elseif option == "Robux to CAD" then
            convertNum = 0.000145 -- current robux to cad conversion rate
        elseif option == "Robux to USD" then
            convertNum = 0.000112 -- current robux to usd conversion rate
        elseif option == "°C to °F" then
            convertNum = 1.8000 -- current °c to °f conversion rate
        elseif option == "°F to °C" then
            convertNum = 1.8000 -- current °f to °c conversion rate
        end
    end)

    tab:Textbox("amount to convert",true, function(t) -- making a textbox for the number to convert
      amt = t -- setting an ammount to t so that we can use it outside of the textbox
            end)

    tab:Button("Convert", function()
        if option == "CAD to USD" then
            result = amt * convertNum -- multiplying the ammount by the conversion rate
            lib:Notification(result, "Using " .. option, "Okay") -- sending notification (.. concatts things into one string)
        elseif option == "USD to CAD" then
            result = amt * convertNum-- multiplying the ammount by the conversion rate
            lib:Notification(result, "Using " .. option, "Okay")  -- sending notification
        elseif option == "Km to Miles" then
            result = amt * convertNum-- multiplying the ammount by the conversion rate
            lib:Notification(result .. " Miles", "Using " .. option, "Okay")  -- sending notification
        elseif option == "Miles to Km" then
            result = amt * convertNum-- multiplying the ammount by the conversion rate
            lib:Notification(result .. " Km", "Using " .. option, "Okay")  -- sending notification
        elseif option == "Robux to CAD" then
            result = amt * convertNum-- multiplying the ammount by the conversion rate
            lib:Notification(result .. " CAD", "Using " .. option, "Okay")  -- sending notification
        elseif option == "Robux to USD" then
            result = amt * convertNum-- multiplying the ammount by the conversion rate
            lib:Notification(result .. " USD", "Using " .. option, "Okay")  -- sending notification
        elseif option == "°C to °F" then
            result = amt * convertNum + 32 -- special formula for °c to °f conversion 
            lib:Notification(result, "Using " .. option, "Okay")  -- sending notification
        elseif option == "°F to °C" then
            result = amt - 32 -- special formula for °f to °c conversion 
            result2 = result / convertNum -- dividing the result by the conversion rate (1.8000)
            lib:Notification(result2, "Using " .. option, "Okay")  -- sending notification

        end
    end)
   
    settings:Bind("Menu Toggle",Enum.KeyCode.N, function(t) -- creating a bind for the menu toggle

    if isClosed == false then -- checking if the menu is closed / visible
        game:GetService("CoreGui"):FindFirstChild("ui").Main.Visible = false -- making the menu invisible
          isClosed = true -- saying that the gui is closed
        else -- just saying that if the gui is closed then do this instead of the above code
            game:GetService("CoreGui"):FindFirstChild("ui").Main.Visible = true -- making it visible again
            isClosed = false -- saying that the gui is open    
            end
    end)

    settings:Colorpicker("Change UI Color",Color3.fromRGB(173,216,230), function(t) -- creating a colorpicker for the UI color and setting a default color
    lib:ChangePresetColor(Color3.fromRGB(t.R * 255, t.G * 255, t.B * 255)) -- changing the color
    end)

settings:Button("Destroy Gui", function() -- creating a button on the settings page
    game:GetService("CoreGui"):FindFirstChild("ui"):Destroy() -- destroying the gui
    end)
end -- ending gui function

spawn(function() -- creating a separate function to check if there are multiple guis open
if game:GetService("CoreGui"):FindFirstChild("ui") then -- checking if there is a gui already open
    game:GetService("CoreGui"):FindFirstChild("ui"):Destroy() -- destroying the open gui
gui() -- executing the gui function (creating a new gui after destroying the old one)
else -- if there is no gui open it will run the code below
    gui() -- just creates new gui
end
end)
