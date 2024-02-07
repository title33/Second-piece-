if not _G.XYLONOPOINTLOSING then
  _G.XYLONOPOINTLOSING = true
  local StatusIncreaseAmount = 0
  local old = hookmetamethod(game, '__namecall', function(self, ...)
    local args = {...}
    local method = getnamecallmethod()

    if not checkcaller() and method == 'FireServer' and self.Name == "UpStats" and self.Parent == game:GetService("ReplicatedStorage").Remotes then
      if args[1] == "Melee" then
        StatusIncreaseAmount = args[2]  -- Store original amount
        args[2] = 0
        for i = 1, StatusIncreaseAmount do
          old(self, args[1], 0.5)  -- Send multiple calls with 0.5
        end
      end
    end

    return old(self, unpack(args))
  end)
end
