_G.ea = true

function A()
    game:GetService('VirtualUser'):CaptureController()
    game:GetService('VirtualUser'):Button1Down(Vector2.new(1280, 672))
end

function MonsSpawned(Mons)
    for _, v in pairs(game:GetService('Workspace').Lives:GetDescendants()) do
        if v.Name == Mons and v:FindFirstChild('HumanoidRootPart') and v.Humanoid.Health >= 1 then
            return true
        end
    end
    return false
end

spawn(function()
    while wait() do
        pcall(function()
            if _G.ea then
                local MonNames = {
                    'Shadow',
                    'Gojo',
                    'Kashimo',
                    'Sukuna',
                    'Snow Bandit Leader',
                    'Shank',
                    'Monkey King',
                    'Sand Man',
                    'Bomb Man',
                    'Bandit Leader'
                }

                local teleportToSafeZone = true

                for _, v in pairs(game:GetService('Workspace').Lives:GetDescendants()) do
                    if table.find(MonNames, v.Name) and v:FindFirstChild('HumanoidRootPart') and v.Humanoid.Health >= 1 then
                        teleportToSafeZone = false
                        repeat
                            wait()
                            A()
                            v.HumanoidRootPart.Size = Vector3.new(10, 10, 10)
                            v.HumanoidRootPart.Transparency = 0.9
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                                v.HumanoidRootPart.CFrame * CFrame.new(0, 0, 7)
                        until _G.ea == false or v.Humanoid.Health <= 0
                    end
                }

                if teleportToSafeZone then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = SafeZone.CFrame
                end
            end
        end)
    end
end)

local SafeZone = Instance.new('Part')
SafeZone.Size = Vector3.new(100, 3, 100)
SafeZone.Position =
    Vector3.new(math.random(10000, 100000), math.random(10000, 50000), math.random(10000, 100000))
SafeZone.Transparency = 0.35
SafeZone.Material = Enum.Material.SmoothPlastic
SafeZone.Anchored = true
SafeZone.Parent = game:GetService('Workspace')
SafeZone.Name = 'SafeZone'
