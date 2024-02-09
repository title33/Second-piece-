local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remotes = ReplicatedStorage.Remotes

-- Store the original FireServer function
local originalFireServer = Remotes.UpStats.FireServer

-- Hook the FireServer function
Remotes.UpStats.FireServer = newcclosure(function(self, ...)
    local arguments = {...}

    -- Check if it's the correct RemoteEvent
    if arguments[1] == "Melee" and arguments[2] and type(arguments[2]) == "number" then
        -- Modify the arguments to prevent point loss
        arguments[2] = 0
    end

    -- Call the original function with the modified arguments
    return originalFireServer(self, unpack(arguments))
end)

-- Function to repeatedly fire the modified FireServer function
local function repeatedlyFireServer()
    while wait(1) do
        Remotes.UpStats.FireServer("Melee", 1)
    end
end

-- Start the function in a new thread
spawn(repeatedlyFireServer)
