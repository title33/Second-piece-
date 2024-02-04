_G.AutoFarm = true

local currentNumber = 0

while _G.AutoFarm do
  wait()

  pcall(function()
    for i, v in pairs(game:GetService("Workspace").Lives:GetDescendants()) do
      if v.Name:match("Bandit%d+") then
        local name, number = v.Name:match("Bandit%d+")
        if number > currentNumber then
          currentNumber = number
          repeat
            wait()
            game:GetService'VirtualUser':CaptureController()
            game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
          until not _G.AutoFarm or v.Humanoid.Health <= 0
        end
      end
    end
  end)
end
