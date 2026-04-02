-- Muscle Legends Simple Script

local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- CONFIG
getgenv().autoFarm = true
getgenv().autoEat = true

-- AUTO FARM ROCK (1M)
task.spawn(function()
    while getgenv().autoFarm do
        task.wait()

        local char = player.Character
        if not char then continue end

        local durability = player:FindFirstChild("Durability")
        if durability and durability.Value >= 1000000 then

            for _, v in pairs(workspace.machinesFolder:GetDescendants()) do
                if v.Name == "neededDurability" and v.Value == 1000000 then
                    
                    if char:FindFirstChild("RightHand") and char:FindFirstChild("LeftHand") then
                        
                        firetouchinterest(v.Parent.Rock, char.RightHand, 0)
                        firetouchinterest(v.Parent.Rock, char.RightHand, 1)
                        firetouchinterest(v.Parent.Rock, char.LeftHand, 0)
                        firetouchinterest(v.Parent.Rock, char.LeftHand, 1)

                    end
                end
            end
        end
    end
end)

-- AUTO EAT
local muscleEvent = player:WaitForChild("muscleEvent")

local foods = {
    "Tropical Shake",
    "Energy Shake",
    "Protein Bar",
    "TOUGH Bar",
    "Protein Shake",
    "ULTRA Shake",
    "Energy Bar"
}

local function format(name)
    local parts = {}
    for word in name:gmatch("%S+") do
        table.insert(parts, word:lower())
    end
    for i = 2, #parts do
        parts[i] = parts[i]:sub(1,1):upper() .. parts[i]:sub(2)
    end
    return table.concat(parts)
end

task.spawn(function()
    while getgenv().autoEat do
        task.wait(0.1)

        for _, item in ipairs(foods) do
            local tool = player.Backpack:FindFirstChild(item) or player.Character:FindFirstChild(item)
            if tool then
                muscleEvent:FireServer(format(item), tool)
            end
        end
    end
end)
