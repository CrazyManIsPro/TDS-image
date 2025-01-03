local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "TDS HUB ✔",
   LoadingTitle = "TDS Keyless Scripts",
   LoadingSubtitle = "Loading best hub....",
   Theme = "Amethyst", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No key needed :)", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"deviousISMad"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local MainTab = Window:CreateTab("🌍 Home", nill) -- Title, Image
local MainSection = MainTab:CreateSection("TDS HUB SCRIPTS")

Rayfield:Notify({
   Title = "Welcome to TDS HUB",
   Content = "Make sure to join the server :) | https://discord.gg/WRcD8udv32",
   Duration = 6.5,
   Image = 4483362458,
   Actions = { -- Notification Buttons

      Ignore = { -- Duplicate this table (or remove it) to add and remove buttons to the notification.
         Name = "Alright",
         Callback = function()
            print("Enjoy only keyless scripts!")
         end
      },

},
})

local Button = MainTab:CreateButton({
   Name = "Mobile Fly",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
   end,
})


local BloxFruitTab = Window:CreateTab("Blox Fruit", null)
local Section = BloxFruitTab:CreateSection("Blox Fruit Scripts")


local Button = BloxFruitTab:CreateButton({
   Name = "Redz Hub",
   Callback = function()
   loadstring(game:HttpGet("https://pastebin.com/raw/2BzdbZk8"))()
   end,
})

local Button = MainTab:CreateButton({
   Name = "Universal ESP",
   Callback = function()
   loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Universal-ESP-Script-(Open-Sourced)-3278"))()
   end,
})

local Button = MainTab:CreateButton({
   Name = "Big Head",
   Callback = function()
   loadstring(game:HttpGet("https://rawscripts.net/raw/AIMBLOX-Big-Hitbox-21219"))()
   end,
})


local TSBTab = Window:CreateTab("Strongest Battlegrounds", null)
local Section = TSBTab:CreateSection("The Strongest Battlegrounds")

local Button = TSBTab:CreateButton({
   Name = "Kade Hub",
   Callback = function()
   loadstring(game:HttpGet(('https://gist.githubusercontent.com/skibiditoiletfan2007/9c8acec1b350bb2a27f4101e2eec803e/raw/bd6fe461cb8fe7b11c53f71999759b1fc5b5e649/TheCaptainsGoDownWithTheirShip.lua'),true))()
   end,
})

local WarMachinesTab = Window:CreateTab("War Machines", null)
local Section = WarMachinesTab:CreateSection("Misc and Scripts")

local Toggle = WarMachinesTab:CreateToggle({
   Name = "Auto Farm Money| Wear suit for it to work",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   loadstring(game:HttpGet("https://rawscripts.net/raw/War-Machines-ProBaconHub-15461"))()
   end,
