local snd = {}

snd.character_select = love.audio.newSource("snd/03 Character Select.mp3", "stream")

function snd.menu_selector_play()
    snd.character_select:stop()
    snd.character_select:play()
end

return snd