local Rayfield, Window, ScriptsTab, notifDuration = loadstring(game:HttpGet("https://raw.githubusercontent.com/TristyMP4/bloxxer/refs/heads/main/universal.lua"))()
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local GameTab = Window:CreateTab("Game", "gamepad-2")
local blockCheats = GameTab:CreateSection("Lucky Blocks")

print(game.PlaceId)

Rayfield:Notify({
   Title = "Loaded!",
   Content = "Supported game detected: " .. game.PlaceId .. " - Loaded Script!",
   Duration = 3,
   Image = "check",
})

local scriptButton = GameTab:CreateButton({
   Name = "Aimbot No Recoil Silent Aim Script",
   Callback = function()
       loadstring(game:HttpGet("https://pastebin.com/raw/tvYF4qGf"))()
   end,
})
