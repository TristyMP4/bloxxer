local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local notifDuration = 2
local loadedKeys = loadstring(game:HttpGet("https://raw.githubusercontent.com/TristyMP4/bloxxer/refs/heads/main/keys.txt"))()

print(loadedKeys)

local Window = Rayfield:CreateWindow({
    Name = "BloxxerHub",
    Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
    LoadingTitle = "Initialising..",
    LoadingSubtitle = "BloxxerHub - by traz",
    Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes
 
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface
 
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil, -- Create a custom folder for your hub/game
       FileName = "bloxxerhub"
    },
 
    Discord = {
       Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
       Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
       RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    },
 
    KeySystem = true, -- Set this to true to use our key system
    KeySettings = {
       Title = "BloxxerHub",
       Subtitle = "Key System",
       Note = "Use the key you were provided with.", -- Use this to tell the user how to get a key
       FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
       SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
       GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = loadedKeys -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
 })

 local GameTab = Window:CreateTab("Game", "gamepad-2") -- Title, Image
 local ScriptsTab = Window:CreateTab("Scripts", "scroll") -- Title, Image
 local MiscTab = Window:CreateTab("Misc", "settings") -- Title, Image
 local UniversalScripts = ScriptsTab:CreateSection("Universal")

local superBlock = GameTab:CreateButton({
   Name = "Give Super Block",
   Callback = function()
        ReplicatedStorage.SpawnSuperBlock:FireServer()
        Rayfield:Notify({
            Title = "Script Executed",
            Content = "Spawned Super Block successfully.",
            Duration = notifDuration,
            Image = "check",
         })
   end,
})

local killAll = GameTab:CreateButton({
    Name = "Kill All (HexSpitter)",
    Callback = function()
        local HexSpitter = Players.LocalPlayer.Character.HexSpitter
		local ServerControl = HexSpitter.Remotes.ServerControl
		for _ = 1,20 do
			for _, Child in next, game.Players:GetPlayers() do
				if Child ~= game.Players.LocalPlayer then
					ServerControl:InvokeServer('RayHit', {['Position'] = Vector3.new(0, 0, 0), ["Hit"] = Child.Character.Head})
				end
			end
		end
        Rayfield:Notify({
            Title = "Script Executed",
            Content = "Killed Everyone successfully.",
            Duration = notifDuration,
            Image = "check",
         })
    end,
 })

local centerTeleport = GameTab:CreateButton({
    Name = "Teleport to Center",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.CenterBlocks.Givers.VoidGiver.Pipe.CFrame
        Rayfield:Notify({
            Title = "Teleported!",
            Content = "Teleported to Center successfully.",
            Duration = notifDuration,
            Image = "check",
         })
    end,
 })

local unloadButton = MiscTab:CreateButton({
   Name = "Unload Hub",
   Callback = function()
      Rayfield:Destroy()
   end,
})

local premEclipse = MiscTab:CreateInput({
   Name = "Eclipse Prem Key",
   CurrentValue = "",
   PlaceholderText = "Enter Key",
   RemoveTextAfterFocusLost = false,
   Flag = "Input1",
   Callback = function(Text)
      getgenv().mainKey = Text
      loadstring(game:HttpGet("https://pastebin.com/raw/avs78BWz"))()
      Rayfield:Notify({
        Title = "Script Executed",
        Content = "Eclipse Hub with premium executed successfully.",
        Duration = notifDuration,
        Image = "check",
     })
   end,
})

local infiniteButton = ScriptsTab:CreateButton({
   Name = "Infinite Yield",
   Callback = function()
      loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
      Rayfield:Notify({
         Title = "Script Executed",
         Content = "Infinite Yield executed successfully.",
         Duration = notifDuration,
         Image = "check",
      })
   end,
})

local eclipseButton = ScriptsTab:CreateButton({
   Name = "Eclipse Hub",
   Callback = function()
      loadstring(game:HttpGet("https://pastebin.com/raw/TA6rDXnU"))()
      Rayfield:Notify({
         Title = "Script Executed",
         Content = "Eclipse Hub executed successfully.",
         Duration = notifDuration,
         Image = "check",
      })
   end,
})

local flingButton = ScriptsTab:CreateButton({
   Name = "Fling GUI",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/hellohellohell012321/KAWAII-FREAKY-FLING/main/kawaii_freaky_fling.lua",true))()
      Rayfield:Notify({
         Title = "Script Executed",
         Content = "Fling GUI executed successfully.",
         Duration = notifDuration,
         Image = "check",
      })
   end,
})

local lunarButton = ScriptsTab:CreateButton({
   Name = "Lunar Bot",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/probablYnicKxD/ProjectLunar/main/LunarBot/Source.lua"))()
      Rayfield:Notify({
         Title = "Script Executed",
         Content = "Lunar Bot executed successfully.",
         Duration = notifDuration,
         Image = "check",
      })
   end,
})

print("hub loaded")
