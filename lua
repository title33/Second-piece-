local StatusIncreaseAmount = 150

hookmetamethod(game, '__namecall', function(self, ...)
  local args = {...}
  local method = getnamecallmethod()

  if not checkcaller() and method == 'FireServer' and self.Name == "UpStats" and self.Parent == game:GetService("ReplicatedStorage").Remotes then
    if args[1] == "Melee" then
      args[2] = StatusIncreaseAmount
    end
  end

  return old(self, unpack(args))
end)
