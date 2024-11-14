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

local Button = BloxFruitTab:CreateButton({
   Name = "Neva Hub",
   Callback = function()
   -- The function that takes place when the button is pressed
   end,
})
