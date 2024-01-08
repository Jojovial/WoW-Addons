local soundType = {
    SOUND = 1,
    GAME_MUSIC = 2,
    CUSTOM = 3
}

local sounds = {
    ["murloc"] = {
        ["sound"] = 416,
        ["description"] = "Mglrlrlrlrlrl!",
        ["type"] = soundType.SOUND
    },
    ["ding"] = {
        ["sound"] = 888,
        ["description"] = "Grats!",
        ["type"] = soundType.SOUND
    },
    ["main theme"] = {
        ["sound"] = "Sound\\Music\\GlueScreenMusic\\wow_main_theme.mp3",
        ["description"] = "DUN DUNNN... DUNNNNNNNNNN",
        ["type"] = soundType.GAME_MUSIC
    },
    ["custom"] = {
        ["sound"] = "Interface\\AddOns\\MusicPlayer\\Sounds\\custom.mp3",
        ["description"] = "Custom sound!",
        ["type"] = soundType.CUSTOM
    }
}



SLASH_SOUND1 = "/playsound"
SLASH_STOPSOUND1 = "/stopsound"

local function displaySoundList()
    print("--------------------")
    for command in pairs(sounds) do
        local description = sounds[command].description
        print("Command: /playsound " .. command .. " - Description: " .. description)
    end
    print("--------------------")
end

local function playSoundHandler()
    displaySoundList()
end

local function stopSoundHandler()
    print("Stop sound!")
end

SlashCmdList["SOUND"] = playSoundHandler
SlashCmdList["STOPSOUND"] = stopSoundHandler
