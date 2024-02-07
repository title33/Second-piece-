if not _G.XYLONOPOINTLOSING then
  _G.XYLONOPOINTLOSING = true
  local StatusIncreaseAmount = 150
  local old = hookmetamethod(game, '__namecall', function(self, ...)
    local args = {...}
    local method = getnamecallmethod()

    if not checkcaller() and method == 'FireServer' and self.Name == "RemoteEvent" and self.Parent.Parent.Parent.Parent.Name == "Status" then
      if args[1] == "Add Stats" and args[2] == "Strength" then
        args[3] = StatusIncreaseAmount
      end
    end

    return old(self, unpack(args))
  end)
end

