local sfx = {}

sfx.menu_selector = love.audio.newSource("sfx/SFII_02 - Move Cursor.wav", "static")

function sfx.menu_selector_play()
    sfx.menu_selector:stop()
    sfx.menu_selector:play()
end

return sfx