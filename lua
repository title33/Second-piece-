if not _G.XYLONOPOINTLOSING then
  _G.XYLONOPOINTLOSING = true
  local StatusIncreaseAmount = 0
  local old = hookmetamethod(game, '__namecall', function(self, ...)
    local args = {...}
    local method = getnamecallmethod()

   
    if not checkcaller() and method == 'FireServer' and self.Name == "UpStats" and self.Parent == game:GetService("ReplicatedStorage").Remotes then
      -- Check for "Melee" stat
      if args[1] == "Melee" then
        if args[2] >= 1 and args[2] <= 150 then
          StatusIncreaseAmount = args[2]
        elseif args[2] >= 1 and args[2] > 150 then
          StatusIncreaseAmount = 150
        end
        args[2] = 0  -- Modify the second argument (points)
        for i = 1, StatusIncreaseAmount do
          old(self, args[1], 0.5)
        end
      end
    end

    return old(self, unpack(args))
  end)
end
