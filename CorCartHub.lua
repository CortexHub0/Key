local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Title of the library", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "nil",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "Magnetic wheels (For free)"
})

Tab:AddToggle({
	Name = "Magnetic wheels",
	Default = false,
	Callback = function(Value)
		if Value then
			YForce = -12000
			KeyToReleaseRailMagnet = Enum.KeyCode.D
			loadstring(game:HttpGet("https://raw.githubusercontent.com/Rylvns/EnvisionExploits/master/game-scripts/Create%20a%20Cart%20Ride!/source.lua"))()
			OrionLib:MakeNotification({
				Name = "Title!",
				Content = "Magnetic wheels activated!",
				Image = "rbxassetid://4483345998",
				Time = 5
			})
		else
			-- Toggle kapatıldığında yapılacak işlemler
			OrionLib:MakeNotification({
				Name = "Title!",
				Content = "Magnetic wheels deactivated!",
				Image = "rbxassetid://4483345998",
				Time = 5
			})
		end
	end
})

local Section = Tab:AddSection({
	Name = "Get cart (instantly)"
})

Tab:AddButton({
	Name = "Button!",
	Callback = function()
		if game:IsLoaded() then
			local plr = game.Players.LocalPlayer
			local hrp = plr.Character:WaitForChild("HumanoidRootPart")
			for _, level in ipairs(game.Workspace.CartRideWorkspace.Objects:GetChildren()) do
				if level:FindFirstChild("LevelSpawn") then
					firetouchinterest(hrp, level.LevelSpawn, 0)
					wait()
					firetouchinterest(hrp, level.LevelSpawn, 1)
				end
			end
			plr.Character:FindFirstChildOfClass("Humanoid").Health = 0
		end
		OrionLib:MakeNotification({
			Name = "Title!",
			Content = "Nice, you got it right?",
			Image = "rbxassetid://4483345998",
			Time = 5
		})
	end
})

if not game:IsLoaded() then
    game.Loaded:Wait()
end

local Kick
Kick = hookmetamethod(game.Players.LocalPlayer, "__namecall", function(Self, ...)
if getnamecallmethod() == "Kick" then
return
end
return Kick(Self, ...)
end)
loadstring(game:HttpGet("https://raw.githubusercontent.com/GalacticHypernova/Guardian/main/MainProd"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/GalacticHypernova/Guardian/main/CodexTest"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/GalacticHypernova/Guardian/main/Main"))()
