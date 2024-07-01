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
		local Kick
		Kick = hookmetamethod(game.Players.LocalPlayer, "__namecall", function(Self, ...)
		if getnamecallmethod() == "Kick" then
		return
		end
		return Kick(Self, ...)
		end)
		if game:IsLoaded() then
			local New_CFrame = workspace.CartRideWorkspace.Objects.CartGiver.Hitbox.CFrame
			local ts = game:GetService("TweenService")
			local char = game.Players.LocalPlayer.Character
			local part = char.HumanoidRootPart
			local ti = TweenInfo.new(1, Enum.EasingStyle.Linear)
			local tp = {CFrame = New_CFrame}
			ts:Create(part, ti, tp):Play()
		end
		OrionLib:MakeNotification({
			Name = "Title!",
			Content = "Nice, you got it right?",
			Image = "rbxassetid://4483345998",
			Time = 5
		})
	end
})

-- Oyun yüklendiğinde çalışacak scriptler
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
