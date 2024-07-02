local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local function findCartGiver()
    local workspace = game:GetService("Workspace")
    local CartRideWorkspace = workspace:FindFirstChild("CartRideWorkspace")
    if not CartRideWorkspace then
        return nil
    end
    local Objects = CartRideWorkspace:FindFirstChild("Objects")
    if not Objects then
        return nil
    end
    local CartGiver = Objects:FindFirstChild("CartGiver")
    if not CartGiver then
        return nil
    end
    local Hitbox = CartGiver:FindFirstChild("Hitbox")
    if not Hitbox then
        return nil
    end
    return Hitbox
end

local function findHumanoidRootPart()
    local player = Players.LocalPlayer
    if not player then
        return nil
    end
    local character = player.Character
    if not character then
        return nil
    end
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart then
        return nil
    end
    return humanoidRootPart
end

-- CartGiver nesnesine ışınlanma işlemi
local function teleportToCartGiver()
    local Hitbox = findCartGiver()
    local humanoidRootPart = findHumanoidRootPart()
    
    if not Hitbox then
        warn("CartGiver veya Hitbox bulunamadı!")
        return
    end
    
    if not humanoidRootPart then
        warn("HumanoidRootPart bulunamadı!")
        return
    end
    
    -- Yeni CFrame'i belirleme
    local New_CFrame = Hitbox.CFrame
    
    -- Karakterin pozisyonunu hızlıca değiştirme
    humanoidRootPart.CFrame = New_CFrame
end

teleportToCartGiver()
