if not _G.XYLONOPOINTLOSING then
  _G.XYLONOPOINTLOSING = true
  local old = hookmetamethod(game, '__namecall', function(self, ...)
    local args = {...}
    local method = getnamecallmethod()

    if not checkcaller() and method == 'FireServer' and self.Name == "SayMessageRequest" and self.Parent.Parent.Name == "DefaultChatSystemChatEvents" then
      if args[1] == "hi" and args[2] == "All" then
        args[1] = "GG"
      end
    end

    return old(self, unpack(args))
  end)
end
