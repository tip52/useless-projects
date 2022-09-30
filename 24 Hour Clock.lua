getgenv().loop = true -- settings loop to true
num1 = 0 -- creating number variables and setting them to 0
num2 = 0
num3 = 0
num4 = 0
num5 = 0
task.spawn(function() -- creating a function to run separately from script
    while task.wait() do -- creating loop
        if getgenv().loop then -- adding task.wait() (faster than wait()) to not crash game
            if num1 == 60 then -- checking if num1 equals 60
                num2 = num2 + 1 -- adding 1 to num2
                num1 = 0 -- resetting num1
        elseif num2 == 10 then -- checking if num2 equals 10
            num3 = num3 + 1 -- adding 1 to num3
            num2 = 0 -- resetting num2
        elseif num3 == 6 then -- checking if num3 equals 6
            num4 = num4 + 1 -- adding 1 to num4
            num3 = 0 -- resetting num3
        elseif num4 == 10 then -- checking if num4 equals 10
            num5 = num5 + 1 -- adding 1 to num5
            num4 = 0 -- resetting num4
        end -- ending if statement
    end -- ending while do loop
end
end) -- ending the spawned function
task.spawn(function()  -- creating a function to run separately from script
    while task.wait(1) do -- creating loop
        if getgenv().loop then
            num1 = num1 + 1 -- adding 1 to num1 every second
            timer = num5 .. num4 .. ":" .. num3 .. num2 ..  ":" .. num1 -- concatting all of the numbers into one value
            print(timer) -- printing all the values
    end -- ending loop
end
end) -- ending spawned function
