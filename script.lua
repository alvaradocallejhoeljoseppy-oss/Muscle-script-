# Muscle-script-script.lua                task.wait()
                if game:GetService("Players").LocalPlayer.Durability.Value >= 1000000 then
                    for i, v in pairs(game:GetService("Workspace").machinesFolder:GetDescendants()) do
                        if v.Name == "neededDurability" and v.Value == 1000000 and 
                           game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and 
                           game.Players.LocalPlayer.Character:FindFirstChild("RightHand") then
 
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 0)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 1)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 0)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 1)
                            gettool()
                        end
                    end
                end
            end
        end)
    end
end)
 
local muscleKingGymRockSwitch = farmTab:AddSwitch("Muscle King Gym Rock", function(bool)
    selectrock = "Muscle King Gym Rock"
    getgenv().autoFarm = bool
 
    if bool then
        spawn(function()
            while getgenv().autoFarm do
                task.wait()
                if game:GetService("Players").LocalPlayer.Durability.Value >= 5000000 then
                    for i, v in pairs(game:GetService("Workspace").machinesFolder:GetDescendants()) do
                        if v.Name == "neededDurability" and v.Value == 5000000 and 
                           game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and 
                           game.Players.LocalPlayer.Character:FindFirstChild("RightHand") then
 
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 0)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 1)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 0)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 1)
                            gettool()
                        end
                    end
                end
            end
        end)
    end
end)
 
local ancientJungleRockSwitch = farmTab:AddSwitch("Ancient Jungle Rock", function(bool)
    selectrock = "Ancient Jungle Rock"
    getgenv().autoFarm = bool
 
    if bool then
        spawn(function()
            while getgenv().autoFarm do
                task.wait()
                if game:GetService("Players").LocalPlayer.Durability.Value >= 10000000 then
                    for i, v in pairs(game:GetService("Workspace").machinesFolder:GetDescendants()) do
                        if v.Name == "neededDurability" and v.Value == 10000000 and 
                           game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and 
                           game.Players.LocalPlayer.Character:FindFirstChild("RightHand") then
 
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 0)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 1)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 0)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 1)
                            gettool()
                        end
                    end
                end
            end
        end)
    end
end)

local Gift = window:AddTab("Gift")
Gift:AddLabel("Egg Gifter:").TextSize = 22

local proteinEggLabel = Gift:AddLabel("Protein Eggs: 0")
proteinEggLabel.TextSize = 20

local selectedProteinPlayer = nil
local proteinEggCount = 0

local proteinDropdown = Gift:AddDropdown("Choose Player (Egg)", function(name)
    selectedProteinPlayer = Players:FindFirstChild(name)
end)
for _, player in ipairs(Players:GetPlayers()) do
    if player ~= Players.LocalPlayer then
        proteinDropdown:Add(player.Name)
    end
end

Players.PlayerAdded:Connect(function(player)
    if player ~= Players.LocalPlayer then
        proteinDropdown:Add(player.Name)
    end
end)

Players.PlayerRemoving:Connect(function(player)
    proteinDropdown:Remove(player.Name)
end)

Gift:AddTextBox("Egg Amount", function(Text)
    proteinEggCount = tonumber(Text)
end)

-- BotÃ³n de gifting seguro
Gift:AddButton("Start Egg Gifting", function()
    if selectedProteinPlayer and proteinEggCount and proteinEggCount > 0 then
        task.spawn(function()
            local folder = Players.LocalPlayer:FindFirstChild("consumablesFolder")
            if not folder then return end

            for i = 1, proteinEggCount do
                local eggItem = folder:FindFirstChild("Protein Egg")
                if eggItem then
                    local args = { "giftRequest", selectedProteinPlayer, eggItem }
                    ReplicatedStorage.rEvents.giftRemote:InvokeServer(unpack(args))
                    task.wait(0.1)
                else
                    break
                end
            end
        end)
    end
end)

Gift:AddLabel("Shake Gifter:").TextSize = 22

local tropicalShakeLabel = Gift:AddLabel("Tropical Shakes: 0")
tropicalShakeLabel.TextSize = 18

local selectedShakePlayer = nil
local shakeCount = 0

local shakeDropdown = Gift:AddDropdown("Choose Player (Shake)", function(name)
    selectedShakePlayer = Players:FindFirstChild(name)
end)

for _, player in ipairs(Players:GetPlayers()) do
    if player ~= Players.LocalPlayer then
        shakeDropdown:Add(player.Name)
    end
end

Players.PlayerAdded:Connect(function(player)
    if player ~= Players.LocalPlayer then
        shakeDropdown:Add(player.Name)
    end
end)

Players.PlayerRemoving:Connect(function(player)
    shakeDropdown:Remove(player.Name)
end)

Gift:AddTextBox("Shake Amount", function(Text)
    shakeCount = tonumber(Text)
end)

Gift:AddButton("Start Shake Gifting", function()
    if selectedShakePlayer and shakeCount and shakeCount > 0 then
        task.spawn(function()
            local folder = Players.LocalPlayer:FindFirstChild("consumablesFolder")
            if not folder then return end

            for i = 1, shakeCount do
                local shakeItem = folder:FindFirstChild("Tropical Shake")
                if shakeItem then
                    local args = { "giftRequest", selectedShakePlayer, shakeItem }
                    ReplicatedStorage.rEvents.giftRemote:InvokeServer(unpack(args))
                    task.wait(0.1)
                else
                    break
                end
            end
        end)
    end
end)

local function updateItemCount()
    local proteinEggCount = 0
    local tropicalShakeCount = 0
    local folder = Players.LocalPlayer:FindFirstChild("consumablesFolder")
    if folder then
        for _, item in ipairs(folder:GetChildren()) do
            if item.Name == "Protein Egg" then
                proteinEggCount += 1
            elseif item.Name == "Tropical Shake" then
                tropicalShakeCount += 1
            end
        end
    end
    proteinEggLabel.Text = "Protein Eggs: " .. proteinEggCount
    tropicalShakeLabel.Text = "Tropical Shakes: " .. tropicalShakeCount
end

task.spawn(function()
    while true do
        updateItemCount()
        task.wait()
    end
end)


local player = game:GetService("Players").LocalPlayer
local muscleEvent = player:WaitForChild("muscleEvent")

local itemList = {
    "Tropical Shake",
    "Energy Shake",
    "Protein Bar",
    "TOUGH Bar",
    "Protein Shake",
    "ULTRA Shake",
    "Energy Bar"
}

local function formatEventName(itemName)
    local parts = {}
    for word in itemName:gmatch("%S+") do
        table.insert(parts, word:lower())
    end
    for i = 2, #parts do
        parts[i] = parts[i]:sub(1, 1):upper() .. parts[i]:sub(2)
    end
    return table.concat(parts)
end

local function activateAllFood()
    for _, item in ipairs(itemList) do
        local tool = player.Character:FindFirstChild(item) or player.Backpack:FindFirstChild(item)
        if tool then
            local eventName = formatEventName(item)
            muscleEvent:FireServer(eventName, tool)
        end
    end
end

local autoEat = false
local eatConnection = nil

Gift:AddSwitch(" Auto Eat Everything", function(state)
    autoEat = state
    if state then
        -- Activar loop
        eatConnection = task.spawn(function()
            while autoEat do
                activateAllFood()
                task.wait(0.005)
            end
        end)
    else
        autoEat = false
        eatConnection = nil
    end
end)
local Credits = window:AddTab("Credits")

Credits:AddLabel("paid version")
Credits:AddLabel("Script Made by username:")
Credits:AddLabel("Johanx7_12")
Credits:AddLabel("I hope you like the script, for bugs or suggestions on my discord server")
Credits:AddLabel("Discord Server:")
Credits:AddButton("Copy Link", function()
setclipboard("https://discord.gg/72AHFJkc")
        end)
