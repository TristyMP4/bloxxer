local Rayfield, Window, ScriptsTab, notifDuration = loadstring(game:HttpGet("https://raw.githubusercontent.com/TristyMP4/bloxxer/refs/heads/main/universal.lua"))()
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local GameTab = Window:CreateTab("Game", "gamepad-2")

print(game.PlaceId)

Rayfield:Notify({
   Title = "Loaded!",
   Content = "Supported game detected: " .. game.PlaceId .. " - Loaded Script!",
   Duration = 3,
   Image = "check",
})

local scriptButton = GameTab:CreateButton({
   Name = "8BIT OP Script",
   Callback = function()
        loadstring(game:HttpGet("https://x8-bit.web.app/scripts/rival_c1.lua"))()
   end,
})

local scriptButton2 = GameTab:CreateButton({
    Name = "Backup Aimbot ESP",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/dementiaenjoyer/homohack/main/homohack.lua"))()
    end,
 })