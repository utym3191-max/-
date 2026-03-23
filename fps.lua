-- Extreme FPS Booster Script
local Lighting = game:GetService("Lighting")
local Terrain = workspace:FindFirstChildOfClass("Terrain")

-- 1. Lighting Optimization
Lighting.GlobalShadows = false
Lighting.FogEnd = 9e9
Lighting.Brightness = 1

-- 2. Terrain Optimization
if Terrain then
    Terrain.WaterWaveSize = 0
    Terrain.WaterWaveSpeed = 0
    Terrain.WaterReflectance = 0
    Terrain.WaterTransparency = 0
    Terrain.Decoration = false
end

-- 3. Object Optimization (Removing Textures and Shadows)
for _, v in pairs(game:GetDescendants()) do
    if v:IsA("Part") or v:IsA("MeshPart") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
        v.Material = Enum.Material.Plastic
        v.Reflectance = 0
        v.CastShadow = false
    elseif v:IsA("Decal") or v:IsA("Texture") then
        v:Destroy()
    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
        v.Enabled = false
    elseif v:IsA("Explosion") then
        v.Visible = false
    end
end

-- 4. Disable High-Quality Effects
for _, effect in pairs(Lighting:GetChildren()) do
    if effect:IsA("PostEffect") or effect:IsA("BloomEffect") or effect:IsA("BlurEffect") or effect:IsA("SunRaysEffect") then
        effect.Enabled = false
    end
end

print("FPS Booster Loaded: Graphics minimized.")

