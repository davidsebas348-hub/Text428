local Players = game:GetService("Players")
local plr = Players.LocalPlayer

if getgenv().DESYNC == nil then
    getgenv().DESYNC = false
end

local function createBox(pos)
    local box = Instance.new("Part")
    box.Name = "desync_box"
    box.Parent = workspace
    box.Anchored = true
    box.CanCollide = false
    box.Size = Vector3.new(2, 5, 1)
    box.CFrame = CFrame.new(pos)
    box.Material = Enum.Material.Neon
    box.Transparency = 0.3
    return box
end

local function toggleDesync()
    local char = plr.Character
    if not char then return end

    getgenv().DESYNC = not getgenv().DESYNC

    if getgenv().DESYNC then
        local savedPos = char.HumanoidRootPart.Position

        local Seat = Instance.new("Seat")
        Seat.Parent = workspace
        Seat.Name = "invischair"
        Seat.Anchored = false
        Seat.CanCollide = false
        Seat.Transparency = 1
        Seat.Position = savedPos

        local torso = char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso")
        if torso then
            local Weld = Instance.new("Weld")
            Weld.Part0 = Seat
            Weld.Part1 = torso
            Weld.Parent = Seat
        end

        createBox(savedPos)
    else
        if workspace:FindFirstChild("invischair") then
            workspace.invischair:Destroy()
        end

        if workspace:FindFirstChild("desync_box") then
            workspace.desync_box:Destroy()
        end
    end
end

toggleDesync()
