SLASH_HELLO1 = "/helloworld"
SLASH_HELLO2 = "/hello"

-- Function to display a greeting message
local function showGreeting(name)
    local greeting = "Hello, " .. name .. "!"
    message(greeting)
end

-- Handler function for the slash commands
local function HelloWorldHandler(name)
    -- Check if a name was provided
    if string.len(name) > 0 then
        showGreeting(name)
    else
        -- If no name is provided, use the player's name
        local playerName = UnitName("player")
        showGreeting(playerName)
    end
end

-- Register the handler for the slash commands
SlashCmdList["HELLO"] = HelloWorldHandler
