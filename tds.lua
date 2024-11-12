-- Intro GUI with Image
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "TDSHub"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local IntroFrame = Instance.new("Frame")
IntroFrame.Size = UDim2.new(1, 0, 1, 0)
IntroFrame.BackgroundTransparency = 1
IntroFrame.Parent = ScreenGui

local TDSImage = Instance.new("ImageLabel")
TDSImage.Size = UDim2.new(0.3, 0, 0.3, 0)
TDSImage.Position = UDim2.new(0.5, 0, 0.5, 0)
TDSImage.AnchorPoint = Vector2.new(0.5, 0.5)
TDSImage.BackgroundTransparency = 1
TDSImage.Image = "https://raw.githubusercontent.com/CrazyManIsPro/TDS-image/main/intro_image.png" -- Using the GitHub raw link for intro_image.png
TDSImage.Parent = IntroFrame

-- Zoom in and fade out effect for TDSImage
local TweenService = game:GetService("TweenService")
local zoomTween = TweenService:Create(
    TDSImage,
    TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
    {ImageTransparency = 0, Size = UDim2.new(0.5, 0, 0.5, 0)}
)
local fadeOutTween = TweenService:Create(
    TDSImage,
    TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
    {ImageTransparency = 1}
)

zoomTween:Play()
zoomTween.Completed:Wait()
wait(0.5)
fadeOutTween:Play()
fadeOutTween.Completed:Wait()
IntroFrame:Destroy() -- Remove intro GUI after effect

-- Main Frame with Animation
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0.6, 0, 0.7, 0)
MainFrame.Position = UDim2.new(0.2, 0, 0.15, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(250, 250, 250)
MainFrame.BorderSizePixel = 0
MainFrame.Visible = true
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 20)
UICorner.Parent = MainFrame

-- Toggle Button on the left side of the screen
local ToggleButton = Instance.new("TextButton")
ToggleButton.Text = "Toggle GUI"
ToggleButton.Size = UDim2.new(0.1, 0, 0.05, 0)
ToggleButton.Position = UDim2.new(0, 10, 0.45, 0)
ToggleButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.TextScaled = true
ToggleButton.Parent = ScreenGui

ToggleButton.Active = true
ToggleButton.Draggable = true

ToggleButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

-- Dark Mode Toggle
local isDarkMode = false
local function toggleDarkMode()
    isDarkMode = not isDarkMode
    local color = isDarkMode and Color3.fromRGB(45, 45, 45) or Color3.fromRGB(250, 250, 250)
    MainFrame.BackgroundColor3 = color
    ToggleButton.BackgroundColor3 = isDarkMode and Color3.fromRGB(80, 80, 80) or Color3.fromRGB(100, 100, 100)
end

-- Tab Container
local TabContainer = Instance.new("Frame")
TabContainer.Size = UDim2.new(0.15, 0, 1, 0)
TabContainer.Position = UDim2.new(0, 0, 0, 0)
TabContainer.BackgroundColor3 = Color3.fromRGB(210, 210, 210)
TabContainer.Parent = MainFrame

local function createTab(name, position, contentFrame)
    local tabButton = Instance.new("TextButton")
    tabButton.Size = UDim2.new(0.9, 0, 0.12, 0)
    tabButton.Position = UDim2.new(0.05, 0, position, 0)
    tabButton.BackgroundColor3 = Color3.fromRGB(180, 180, 180)
    tabButton.Text = name
    tabButton.Font = Enum.Font.GothamBold
    tabButton.TextScaled = true
    tabButton.Parent = TabContainer

    local UICornerTab = Instance.new("UICorner")
    UICornerTab.CornerRadius = UDim.new(0, 10)
    UICornerTab.Parent = tabButton

    tabButton.MouseButton1Click:Connect(function()
        for _, tabContent in pairs(MainFrame:GetChildren()) do
            if tabContent:IsA("Frame") and tabContent ~= TabContainer then
                tabContent.Visible = false
            end
        end
        contentFrame.Visible = true
    end)
end

-- Home Tab
local HomeTab = Instance.new("Frame")
HomeTab.Size = UDim2.new(0.85, 0, 0.9, 0)
HomeTab.Position = UDim2.new(0.15, 0, 0.1, 0)
HomeTab.BackgroundColor3 = Color3.fromRGB(245, 245, 245)
HomeTab.Visible = true
HomeTab.Parent = MainFrame
createTab("Home", 0.05, HomeTab)

-- Scripts Tab with Search Bar and List
local ScriptsTab = Instance.new("Frame")
ScriptsTab.Size = UDim2.new(0.85, 0, 0.9, 0)
ScriptsTab.Position = UDim2.new(0.15, 0, 0.1, 0)
ScriptsTab.BackgroundColor3 = Color3.fromRGB(245, 245, 245)
ScriptsTab.Visible = false
ScriptsTab.Parent = MainFrame
createTab("Scripts", 0.2, ScriptsTab)

local SearchBar = Instance.new("TextBox")
SearchBar.Size = UDim2.new(0.9, 0, 0.1, 0)
SearchBar.Position = UDim2.new(0.05, 0, 0.05, 0)
SearchBar.PlaceholderText = "Search scripts..."
SearchBar.Text = ""
SearchBar.Font = Enum.Font.Gotham
SearchBar.TextScaled = true
SearchBar.Parent = ScriptsTab

local ScriptList = Instance.new("ScrollingFrame")
ScriptList.Size = UDim2.new(0.9, 0, 0.75, 0)
ScriptList.Position = UDim2.new(0.05, 0, 0.2, 0)
ScriptList.CanvasSize = UDim2.new(0, 0, 2, 0)
ScriptList.Parent = ScriptsTab

-- Add UIListLayout to automatically position buttons
local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = ScriptList
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 5)

-- Script data with loadstrings
local scripts = {
    {name = "Tower of Hell", script = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/scowscripts/scowsscripts/main/TowerOfHacks/Script", true))()'},
    {name = "Mobile Fly", script = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()'},
    {name = "Redz Hub", script = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxScriptsExploit/Blox-Fruits/refs/heads/main/redz9999.lua"))()'},
    {name = "Neva Hub", script = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/VEZ2/NEVAHUB/main/2"))()'}
}

local function displayScripts(filterText)
    -- Clear existing buttons
    for _, child in ipairs(ScriptList:GetChildren()) do
        if child:IsA("TextButton") then
            child:Destroy()
        end
    end
    
    -- Track total height for canvas size
    local totalHeight = 0
    local buttonHeight = 40  -- Fixed height for each button
    local buttonPadding = 5  -- Padding between buttons
    
    for i, item in ipairs(scripts) do
        if not filterText or string.find(item.name:lower(), filterText:lower()) then
            local ScriptButton = Instance.new("TextButton")
            ScriptButton.Size = UDim2.new(0.95, 0, 0, buttonHeight)
            ScriptButton.Text = item.name .. " - Run"
            ScriptButton.Font = Enum.Font.Gotham
            ScriptButton.TextScaled = true
            ScriptButton.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
            ScriptButton.Parent = ScriptList
            
            -- Add UICorner to the button
            local UICorner = Instance.new("UICorner")
            UICorner.CornerRadius = UDim.new(0, 8)
            UICorner.Parent = ScriptButton
            
            ScriptButton.MouseButton1Click:Connect(function()
                loadstring(item.script)()
            end)
            
            totalHeight = totalHeight + buttonHeight + buttonPadding
        end
    end
    
    -- Update ScrollingFrame canvas size
    ScriptList.CanvasSize = UDim2.new(0, 0, 0, totalHeight)
end

-- Initial display of scripts
displayScripts("")

-- Update display when searching
SearchBar:GetPropertyChangedSignal("Text"):Connect(function()
    displayScripts(SearchBar.Text)
end)
-- Settings Tab with Dark Mode Toggle
local SettingsTab = Instance.new("Frame")
SettingsTab.Size = UDim2.new(0.85, 0, 0.9, 0)
SettingsTab.Position = UDim2.new(0.15, 0, 0.1, 0)
SettingsTab.BackgroundColor3 = Color3.fromRGB(245, 245, 245)
SettingsTab.Visible = false
SettingsTab.Parent = MainFrame
createTab("Settings", 0.35, SettingsTab)

local DarkModeButton = Instance.new("TextButton")
DarkModeButton.Text = "Dark Mode"
DarkModeButton.Size = UDim2.new(0.4, 0, 0.1, 0)
DarkModeButton.Position = UDim2.new(0.3, 0, 0.1, 0)
DarkModeButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
DarkModeButton.Font = Enum.Font.GothamBold
DarkModeButton.TextScaled = true
DarkModeButton.Parent = SettingsTab
DarkModeButton.MouseButton1Click:Connect(toggleDarkMode)

-- Credits Tab
local CreditsTab = Instance.new("Frame")
CreditsTab.Size = UDim2.new(0.85, 0, 0.9, 0)
CreditsTab.Position = UDim2.new(0.15, 0, 0.1, 0)
CreditsTab.BackgroundColor3 = Color3.fromRGB(245, 245, 245)
CreditsTab.Visible = false
CreditsTab.Parent = MainFrame
createTab("Credits", 0.5, CreditsTab)

local JoinDiscordButton = Instance.new("TextButton")
JoinDiscordButton.Size = UDim2.new(0.3, 0, 0.1, 0)
JoinDiscordButton.Position = UDim2.new(0.35, 0, 0.7, 0)
JoinDiscordButton.Text = "Join Discord"
JoinDiscordButton.TextColor3 = Color3.fromRGB(255, 255, 255)
JoinDiscordButton.BackgroundColor3 = Color3.fromRGB(114, 137, 218)
JoinDiscordButton.Font = Enum.Font.GothamBold
JoinDiscordButton.TextScaled = true
JoinDiscordButton.Parent = CreditsTab
JoinDiscordButton.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/WRcD8udv32")
end)
