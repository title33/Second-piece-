_G.AutoFarm = true

while _G.AutoFarm do
  wait()

  pcall(function()
    for i, v in pairs(game:GetService("Workspace").Lives:GetDescendants()) do
      if v.Name:match("Bandit%d+") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
        local name, number = v.Name:match("Bandit%d+")
        number = tonumber(number)

        
        local cleanedName = string.gsub(v.Name, "%d+$", "")
        v.Name = cleanedName

        repeat
          wait()
          game:GetService'VirtualUser':CaptureController()
          game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
          game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
        until not _G.AutoFarm or v.Humanoid.Health <= 0
      end
    end
  end)
end

game:GetService("Workspace").Lives.ChildAdded:Connect(function(model)
  wait()
  if not game:GetService("Players"):GetPlayerFromCharacter(model) then -- if not player then
    local cleanedName = string.gsub(model.Name, "%d+$", "")
    model.Name = cleanedName
  end
end)
