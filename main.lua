--Author :
--+-+-+-+-+-+-+-+-+-+
--|I|A|m|T|e|r|r|o|r|
--+-+-+-+-+-+-+-+-+-+


-- CONFIG --------------------------------------------------------------------------------------------------------------

-- pixel art effect
love.graphics.setDefaultFilter("nearest")

-- MODULES -------------------------------------------------------------------------------------------------------------

local my_character_selection_menu = require("character_selection_menu")

-- LÖVE ----------------------------------------------------------------------------------------------------------------

function love.load()
    love.window.setTitle("Street Fighter character selection menu by IAmTerror")
end

function love.update(dt)
end

function love.draw()
end

  -- CONTROLS ------------------------------------------------------------------------------------------------------------
function love.keypressed(key)
    if key=="escape" then love.event.quit() end
    print(key)
end