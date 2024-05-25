--made by sova jokei_64545
--lockerware on top
--da hood anticheat is ass 
--hyperion sucks fuck byfron
--solara>>>incognito
--lilan owes me 2 dollars
--mrs fishers bitch ass can bite the curb for all i care
--gayson or thot daughter?

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/VisualRoblox/Roblox/main/UI-Libraries/Visual%20UI%20Library/Source.lua'))()

local Window = Library:CreateWindow('LockerWare', 'V1.0', 'Locker Ware On Top!', 'rbxassetid://10618928818', false, 'VisualUIConfigs', 'Default')

local Tab = Window:CreateTab('Admin', true, 'rbxassetid://15996635406', Vector2.new(0, 0), Vector2.new(512, 512))

local Section = Tab:CreateSection('Admin')

local EspEnabled = false
local AntiAFKEnabled = false
local InfiniteJumpEnabled = false
local LastInput = tick()

-- Reset character button
local Button = Section:CreateButton('Reset Humanoid', function()
    if LocalPlayer and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.Health = 0
        print("Player health reset to 0")
    else
        print("Humanoid not found")
    end
end)

local Slider = Section:CreateSlider('Speed', 1, 100, 50, Color3.fromRGB(191, 64, 191), function(Value)
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = Value
    end
end)

local Toggle = Section:CreateToggle('Toggle', true, Color3.fromRGB(191, 64, 191), 0.25, function(Value)
    print(Value)
end)

local EspToggle = Section:CreateToggle('Esp', false, Color3.fromRGB(191, 64, 191), 0.25, function(Value)
    EspEnabled = Value
    if EspEnabled then
        updateEsp()
        print("ESP enabled")
    else
        clearEsp()
        print("ESP disabled")
    end
end)

local AntiAFKToggle = Section:CreateToggle('Anti AFK', false, Color3.fromRGB(191, 64, 191), 0.25, function(Value)
    AntiAFKEnabled = Value
end)

local InfiniteJumpToggle = Section:CreateToggle('Infinite Jump', false, Color3.fromRGB(191, 64, 191), 0.25, function(Value)
    InfiniteJumpEnabled = Value
end)

local function createHighlightForCharacter(character)
    local highlight = Instance.new("Highlight")
    highlight.Name = "Highlight"
    highlight.FillColor = Color3.fromRGB(255, 0, 255)
    highlight.OutlineColor = Color3.new(1, 1, 1)
    highlight.Parent = character
end

local function updateEsp()
    for _, player in pairs(Players:GetPlayers()) do
        if player.Character and not player.Character:FindFirstChild("Highlight") then
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

-- Optimize ESP update using RunService
RunService.RenderStepped:Connect(function()
    if EspEnabled then
        updateEsp()
    end
    if AntiAFKEnabled then
        if tick() - LastInput >= 60 then -- If no input for 60 seconds
            LocalPlayer:Move(Vector3.new()) -- Reset movement
            LastInput = tick() -- Update last input time
        end
    end
end)

-- Monitor user input
UserInputService.InputBegan:Connect(function(input)
    if AntiAFKEnabled or InfiniteJumpEnabled then
        LastInput = tick() -- Update last input time
    end
end)

-- Infinite Jump
UserInputService.JumpRequest:Connect(function()
    if InfiniteJumpEnabled then
        LocalPlayer.Character:FindFirstChildOfClass('Humanoid'):ChangeState("Jumping")
    end
end)
