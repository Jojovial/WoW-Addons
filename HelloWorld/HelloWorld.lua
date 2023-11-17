
SLASH_HELLO1 = "/helloworld"
SLASH_HELLO2 = "/hello"


local function showGreeting(name)
    local greeting = "Hello, " .. name .. "!"

    message(greeting)
end


-- /helloworld Paul
local function HelloWorldHandler(name)
    local userAddedName = string.len(name) > 0

    -- name === paul

    if(userAddedName) then
        showGreeting(name)
    else
        local playerName = UnitName("player")

        showGreeting(playerName)
    end
end

SlashCmdList["HELLO"] = HelloWorldHandler

-- local name = UnitName("player")
