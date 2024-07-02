local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "CortexHub(Create a Cart Ride)", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

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
			loadstring(game:HttpGet("https://raw.githubusercontent.com/anilenzo/Key/main/Magnetic%20Wheel.lua"))()
			OrionLib:MakeNotification({
				Name = "MW",
				Content = "Magnetic wheels activated!",
				Image = "rbxassetid://4483345998",
				Time = 5
			})
		else
			-- Toggle kapatıldığında yapılacak işlemler
			OrionLib:MakeNotification({
				Name = "Magnetic Wheels",
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
	Name = "Tp to Cart Giver!",
	Callback = function()
		local Kick
		Kick = hookmetamethod(game.Players.LocalPlayer, "__namecall", function(Self, ...)
			if getnamecallmethod() == "Kick" then
				return
			end
			return Kick(Self, ...)
		end)
		loadstring(game:HttpGet("https://raw.githubusercontent.com/anilenzo/Key/main/TpToCartGiver.lua"))()
		OrionLib:MakeNotification({
			Name = "Cart Giver!",
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

OrionLib:Init()
