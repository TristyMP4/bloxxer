local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Players = game:GetService("Players")
local hum = Players.LocalPlayer.Character:FindFirstChild("Humanoid")

local notifDuration = 3.5
local loadedKeys = loadstring(game:HttpGet("https://raw.githubusercontent.com/TristyMP4/bloxxer/refs/heads/main/keys.lua"))()

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
         FolderName = "bloxxerhub", -- Create a custom folder for your hub/game
         FileName = "hub"
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

local CharTab = Window:CreateTab("Character", "user") -- Title, Image
local ScriptsTab = Window:CreateTab("Scripts", "scroll") -- Title, Image
local MiscTab = Window:CreateTab("Misc", "settings") -- Title, Image
local movementCheats = CharTab:CreateSection("Movement")

if not hum then
      local noHum = CharTab:CreateLabel("Humanoid modifications such as: Walkspeed, or JumpPower are unavailable as you have no humanoid.", "ban", Color3.fromRGB(255, 255, 255), false) -- Title, Icon, Color, IgnoreTheme
else
   local jumpMeasurement = nil
   if game.StarterPlayer.CharacterUseJumpPower then
         jumpMeasurement = "JumpPower"
   else
         jumpMeasurement = "JumpHeight"
   end

   local walkspeedSlider = CharTab:CreateSlider({
      Name = "WalkSpeed",
      Range = {10, 500},
      Increment = 1,
      Suffix = "WalkSpeed",
      CurrentValue = hum.WalkSpeed,
      Flag = "", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
      Callback = function(Value)
            hum.WalkSpeed = Value
      end,
   })
   local jumpPowerSlider = CharTab:CreateSlider({
      Name = "JumpPower",
      Range = {10, 500},
      Increment = 1,
      Suffix = jumpMeasurement,
      CurrentValue = hum[jumpMeasurement],
      Flag = "", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
      Callback = function(Value)
         hum[jumpMeasurement] = Value
      end,
   })
end
   
local tptoPlayer = CharTab:CreateInput({
      Name = "Teleport to Player",
      CurrentValue = "",
      PlaceholderText = "DisplayName or Username",
      RemoveTextAfterFocusLost = false,
      Flag = "Input1",
      Callback = function(Text)
         for i, player in Players:GetChildren() do
            if string.lower(player.Name) == string.lower(Text) or string.lower(player.DisplayName) == string.lower(Text) then
               Players.LocalPlayer.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame
            end
         end
      end,
})
   
local unloadButton = MiscTab:CreateButton({
      Name = "Unload Hub",
      Callback = function()
         Rayfield:Destroy()
      end,
})
   
local reloadButton = MiscTab:CreateButton({
      Name = "Reload Hub",
      Callback = function()
         loadstring(game:HttpGet("https://raw.githubusercontent.com/TristyMP4/bloxxer/refs/heads/main/loader.lua"))()
         Rayfield:Destroy()
      end,
})

local autoYield = MiscTab:CreateToggle({
      Name = "AutoExec InfYield",
      CurrentValue = false,
      Flag = "autoYield", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
      Callback = function(Value)
            loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()   
      end,
})

local FunScripts = ScriptsTab:CreateSection("Fun")
   
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

local MiscScripts = ScriptsTab:CreateSection("Miscellaneous")

local hydroxideButton = ScriptsTab:CreateButton({
      Name = "Hydroxide",
      Callback = function()
         local owner = "Upbolt"
         local branch = "revision"

         local function webImport(file)
            return loadstring(game:HttpGetAsync(("https://raw.githubusercontent.com/%s/Hydroxide/%s/%s.lua"):format(owner, branch, file)), file .. '.lua')()
         end
         webImport("init")
         webImport("ui/main")

         Rayfield:Notify({
            Title = "Script Executed",
            Content = "Hydroxide GUI executed successfully.",
            Duration = notifDuration,
            Image = "check",
         })
      end,
})
  
Rayfield:LoadConfiguration()
print("hub loaded")

return Rayfield, Window, ScriptsTab, notifDuration
