if not _G.XYLONOPOINTLOSING then
  _G.XYLONOPOINTLOSING = true
  local StatusIncreaseAmount = 0
  local old = hookmetamethod(game, '__namecall', function(self, ...)
    local args = {...}
    local method = getnamecallmethod()

    if not checkcaller() and method == 'FireServer' and self.Name == "UpStats" and self.Parent == game:GetService("ReplicatedStorage").Remotes then
      -- Check if the first argument is "Melee" (assuming that's the relevant condition)
      if args[1] == "Melee" then
        if args[2] >= 1 and args[2] <= 150 then
          StatusIncreaseAmount = args[2]
        elseif args[2] >= 1 and args[2] > 150 then
          StatusIncreaseAmount = 150
        end
        args[2] = 0  -- Modify the second argument (points) instead of the first
        for i = 1, StatusIncreaseAmount do
          old(self, args[1], 0.5)  -- Pass "Melee" as the first argument
        end
      end
    end

    return old(self, unpack(args))
  end)
end
