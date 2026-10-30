
-- CAMERA TOWER DEFENSE MACRO
-- GUI Prototype v1.0

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local Player = Players.LocalPlayer

local Config = {
    Loop = false,
    Recording = false,
    Playing = false,
    AutoUpgrade = false,
    LoopDelay = 5,
    UpgradeDelay = 2
}

local Macro = {}

local GUI = Instance.new("ScreenGui")
GUI.Name = "CameraMacro"
GUI.ResetOnSpawn = false

local Main = Instance.new("Frame")
Main.Size = UDim2.fromOffset(300, 420)
Main.Position = UDim2.new(0.5, -150, 0.5, -210)
Main.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Main.Parent = GUI

local function Button(text, y, callback)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(1, -20, 0, 38)
    b.Position = UDim2.fromOffset(10, y)
    b.BackgroundColor3 = Color3.fromRGB(50, 65, 95)
    b.TextColor3 = Color3.new(1,1,1)
    b.Text = text
    b.TextSize = 14
    b.Parent = Main
    b.MouseButton1Click:Connect(callback)
    return b
end

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundTransparency = 1
Title.Text = "CAMERA TOWER MACRO"
Title.TextColor3 = Color3.new(1,1,1)
Title.TextSize = 18
Title.Parent = Main

Button("RECORD", 50, function()
    Macro = {}
    Config.Recording = true
    print("Recording started")
end)

Button("STOP RECORD", 95, function()
    Config.Recording = false
    print("Recording stopped")
end)

Button("PLAY MACRO", 140, function()
    if #Macro == 0 then
        warn("No macro recorded")
        return
    end
    print("Playback requires an authorized action adapter")
end)

local LoopButton = Button("LOOP: OFF", 185, function()
    Config.Loop = not Config.Loop
    LoopButton.Text = "LOOP: " ..
        (Config.Loop and "ON" or "OFF")
end)

local UpgradeButton = Button("AUTO UPGRADE: OFF", 230, function()
    Config.AutoUpgrade = not Config.AutoUpgrade
    UpgradeButton.Text = "AUTO UPGRADE: " ..
        (Config.AutoUpgrade and "ON" or "OFF")
end)

Button("STOP ALL", 275, function()
    Config.Recording = false
    Config.Playing = false
    Config.Loop = false
    Config.AutoUpgrade = false
    print("All stopped")
end)

Button("MOUSE FREE", 320, function()
    UIS.MouseBehavior = Enum.MouseBehavior.Default
end)

Button("CLOSE GUI", 365, function()
    Config.Playing = false
    Config.Recording = false
    GUI:Destroy()
end)

GUI.Parent = Player:WaitForChild("PlayerGui")
