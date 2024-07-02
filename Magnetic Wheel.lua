YForce = YForce or -12000
KeyToReleaseRailMagnet = KeyToReleaseRailMagnet or Enum.KeyCode.D

local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer

local HoldingKey = false

local function GetMyCart()
	for _, Cart in pairs(workspace.ActiveCarts:GetChildren()) do
		if Cart.Owner.Value == Player then
			return Cart
		end
	end
	return nil
end

UserInputService.InputBegan:Connect(function(Input, GameProcessed)
	if GameProcessed == false and Input.KeyCode == KeyToReleaseRailMagnet then
		HoldingKey = true
		local cart = GetMyCart()
		if cart ~= nil and cart:FindFirstChild("Base") ~= nil then
			if cart.Base:FindFirstChild("BodyThrust") ~= nil then
				cart.Base.BodyThrust:Destroy()
			end
		end
	end
end)

UserInputService.InputEnded:Connect(function(Input, GameProcessed)
	if GameProcessed == false and Input.KeyCode == KeyToReleaseRailMagnet then
		HoldingKey = false
		local cart = GetMyCart()
		if cart ~= nil and cart:FindFirstChild("Base") ~= nil then
			if cart.Base:FindFirstChild("BodyThrust") == nil then
				local bodyThrust = Instance.new("BodyThrust")
				bodyThrust.Force = Vector3.new(0, YForce, 0)
				bodyThrust.Parent = cart.Base
			end
		end
	end
end)

coroutine.resume(coroutine.create(function()
	while wait(1) do
		local cart = GetMyCart()
		if cart ~= nil and cart:FindFirstChild("Wheels") ~= nil then
			for _, Wheel in pairs(cart.Wheels:GetChildren()) do
				Wheel.Transparency = 1 -- Tekerlekleri tamamen görünmez yap
			end
			if HoldingKey == false and cart.Base:FindFirstChild("BodyThrust") == nil then
				local bodyThrust = Instance.new("BodyThrust")
				bodyThrust.Force = Vector3.new(0, YForce, 0)
				bodyThrust.Parent = cart.Base
			end
		end
		for _, Value in pairs(workspace.CartRideWorkspace.Objects:GetChildren()) do
			if Value.Name == "DamagePart" then
				Value.Transparency = 1 -- Hasar parçalarını tamamen görünmez yap
			end
		end
	end
end))
