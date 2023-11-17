
SLASH_HELLO1 = "/helloworld"
SLASH_HELLO2 = "/hellow"


-- /helloworld Paul
local function HelloWorldHandler(name)

    -- name === paul
    -- Hello, Jasdavi!
    message("Hello, " .. name .. "!")
end

SlashCmdList["HELLO"] = HelloWorldHandler

-- local name = UnitName("player")
