-- Define sound types
local soundType = {
    SOUND = 1,
    GAME_MUSIC = 2,
    CUSTOM = 3
}

-- Define the sounds with their properties
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
    },
    ["popipo"] = {
        ["sound"] = "Interface\\AddOns\\MusicPlayer\\Sounds\\popipo.mp3",
        ["description"] = "Eat your veggies juiced!",
        ["type"] = soundType.CUSTOM
    }
}

-- Define slash commands
SLASH_SOUND1 = "/playsound"
SLASH_STOPSOUND1 = "/stopsound"

-- Function to display the list of available sounds
local function displaySoundList()
    print("--------------------")
    for command, details in pairs(sounds) do
        print("Command: /playsound " .. command .. " - Description: " .. details.description)
    end
    print("--------------------")
end

local customSoundId

-- Function to play a track based on its type
local function playTrack(track)
    print(track.description)

    if track.type == soundType.GAME_MUSIC then
        PlayMusic(track.sound)
        print("To stop the music type /stopsound")
    elseif track.type == soundType.SOUND then
        PlaySound(track.sound)
    elseif track.type == soundType.CUSTOM then
        stopSoundHandler()
        customSoundId = select(2, PlaySoundFile(track.sound))
    end
end

-- Function to handle the /playsound command
local function playSoundHandler(trackId)
    if string.len(trackId) > 0 then
        local track = sounds[trackId]
        if track then
            playTrack(track)
        else
            displaySoundList()
            print(trackId .. " - Doesn't match a known track.")
        end
    else
        displaySoundList()
    end
end

-- Function to stop currently playing sounds
local function stopSoundHandler()
    StopMusic()
    if customSoundId then
        StopSound(customSoundId)
        customSoundId = nil
    end
end

-- Register the slash command handlers
SlashCmdList["SOUND"] = playSoundHandler
SlashCmdList["STOPSOUND"] = stopSoundHandler
