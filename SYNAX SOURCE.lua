-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "StylishGUI"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Create Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 500, 0, 400)
mainFrame.Position = UDim2.new(0.5, -250, 0.5, -200)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

-- Create Tab Frame
local tabFrame = Instance.new("Frame")
tabFrame.Size = UDim2.new(0, 150, 1, 0)
tabFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
tabFrame.BorderSizePixel = 0
tabFrame.Parent = mainFrame

-- Create Content Frame
local contentFrame = Instance.new("Frame")
contentFrame.Size = UDim2.new(1, -150, 1, 0)
contentFrame.Position = UDim2.new(0, 150, 0, 0)
contentFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
contentFrame.BorderSizePixel = 0
contentFrame.Parent = mainFrame

-- Create Logo
local logo = Instance.new("TextLabel")
logo.Size = UDim2.new(1, 0, 0, 50)
logo.Position = UDim2.new(0, 0, 0, 0)
logo.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
logo.TextColor3 = Color3.fromRGB(255, 255, 255)
logo.Text = "Sova Hub"
logo.Font = Enum.Font.GothamBold
logo.TextSize = 24
logo.BorderSizePixel = 0
logo.Parent = tabFrame

-- Create UI Corner for rounded edges
local function applyUICorner(instance, radius)
    local uiCorner = Instance.new("UICorner")
    uiCorner.CornerRadius = UDim.new(0, radius)
    uiCorner.Parent = instance
end

applyUICorner(mainFrame, 10)
applyUICorner(tabFrame, 10)
applyUICorner(contentFrame, 10)
applyUICorner(logo, 10)

-- Tabs and Button Creation
local tabs = {"Tab1", "Tab2", "Tab3"}

local function createTabButton(name, position)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, 0, 0, 50)
    button.Position = UDim2.new(0, 0, 0, position)
    button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Text = name
    button.BorderSizePixel = 0
    applyUICorner(button, 10)
    button.Parent = tabFrame
    return button
end

-- Create Content for Tabs
local function createContentForTab(tabName)
    -- Clear previous content
    contentFrame:ClearAllChildren()
    
    -- Example Label
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 0, 50)
    label.Position = UDim2.new(0, 0, 0, 10)
    label.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.Text = "Content for " .. tabName
    label.BorderSizePixel = 0
    applyUICorner(label, 10)
    label.Parent = contentFrame
end

-- Create Tab Buttons and Connect Click Events
for i, tabName in ipairs(tabs) do
    local button = createTabButton(tabName, (i-1) * 60 + 60)
    button.MouseButton1Click:Connect(function()
        createContentForTab(tabName)
    end)
end

-- Initialize with first tab content
createContentForTab(tabs[1])
