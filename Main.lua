local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/VisualRoblox/Roblox/main/UI-Libraries/Visual%20UI%20Library/Source.lua'))()

local Window = Library:CreateWindow('LockerWare', 'V1.0', 'Locker Ware On Top!', 'rbxassetid://10618928818', false, 'VisualUIConfigs', 'Default')

local Tab = Window:CreateTab('Admin', true, 'rbxassetid://3926305904', Vector2.new(524, 44), Vector2.new(36, 36))

local Section = Tab:CreateSection('Admin')

local EspEnabled = false -- Variable to track ESP state

-- Reset char button
local Button = Section:CreateButton('Reset Humanoid', function()
    if LocalPlayer and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.Health = 0
        print("Player health reset to 0")
    else
        print("Humanoid not found")
    end
end)

local Slider = Section:CreateSlider('Speed', 1, 100, 50, Color3.fromRGB(191, 64, 191), function(Value)
    -- Add your slider functionality here
end)

local Toggle = Section:CreateToggle('Toggle', true, Color3.fromRGB(191, 64, 191), 0.25, function(Value)
    print(Value)
end)

local EspToggle = Section:CreateToggle('Esp', false, Color3.fromRGB(191, 64, 191), 0.25, function(Value)
    EspEnabled = Value -- Update ESP state
    if EspEnabled then
        -- Enable ESP
        print("ESP enabled")
    else
        -- Disable ESP
        print("ESP disabled")
    end
end)

local function createHighlightForCharacter(character)
    local highlight = Instance.new("Highlight")
    highlight.Name = "Highlight"
    highlight.FillColor = Color3.fromRGB(255, 0, 255) -- Bright neon purple color
    highlight.OutlineColor = Color3.new(1, 1, 1) -- White color for outline
    highlight.Parent = character
end

local function updateEsp()
    for _, player in pairs(Players:GetPlayers()) do
        if player.Character then
            createHighlightForCharacter(player.Character)
        end
    end
end

local function clearEsp()
    for _, player in pairs(Players:GetPlayers()) do
        if player.Character then
            for _, child in ipairs(player.Character:GetChildren()) do
                if child:IsA("Highlight") then
                    child:Destroy()
                end
            end
        end
    end
end

while true do
    if EspEnabled then
        updateEsp()
    else
        clearEsp()
    end
    wait(0.00000001) -- Add input delay so game doesnt detect it
end
