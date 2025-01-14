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

local multiSuperBlock = GameTab:CreateInput({
   Name = "Give Multiple Super Block",
   CurrentValue = "5",
   PlaceholderText = "5",
   RemoveTextAfterFocusLost = false,
   Flag = "multipleSuperBlock",
   Callback = function(Text)
      for _ = 1,tonumber(Text) do
         ReplicatedStorage.SpawnSuperBlock:FireServer()
      end
   end,
})

local mainCheats = GameTab:CreateSection("Main")

local killAll = GameTab:CreateButton({
    Name = "Kill All (HexSpitter)",
    Callback = function()
      Rayfield:Notify({
         Title = "Executing Script",
         Content = "Killing everyone, this might take a bit!",
         Duration = notifDuration,
         Image = "check",
      })

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
         Content = "Killed everyone successfully.",
         Duration = notifDuration,
         Image = "check",
      })
    end,
 })

local teleportCheats = GameTab:CreateSection("Teleports")
local base = nil

function getBase()
   for i, item in game.Workspace:GetDescendants() do
      if item:IsA("StringValue") then
         if item.Name == "Owner" then
            if item.Value == Players.LocalPlayer.Name then
               base = item.Parent
               print(item.Parent.Name)
            end
         end
      end
   end
end

local baseTeleport = GameTab:CreateButton({
   Name = "Teleport to Base",
   Callback = function()
      local function teleportBase()
         Players.LocalPlayer.Character.HumanoidRootPart.CFrame = base.SpawnLocation.CFrame
         Rayfield:Notify({
            Title = "Teleported!",
            Content = "Teleported to Base successfully.",
            Duration = notifDuration,
            Image = "check",
         })
      end
      if base then
         teleportBase()
      else
         getBase()
         teleportBase()
      end
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
