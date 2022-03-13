--Author :
--+-+-+-+-+-+-+-+-+-+
--|I|A|m|T|e|r|r|o|r|
--+-+-+-+-+-+-+-+-+-+

-- Street Fighter Wiki - Character Select : https://streetfighter.fandom.com/wiki/Character_Select
-- Street Fighter Wiki - Street Fighter 2 The World Warrior : https://streetfighter.fandom.com/wiki/Street_Fighter_II:_The_World_Warrior
-- Street Fighter 2 Turbo Hyper Fighting (SNES) - World of Longplays : https://www.youtube.com/watch?v=8Usyp6OBAa8
-- The Spriter Ressources - SF2 (SNES) Player Select Sprites : https://www.spriters-resource.com/snes/streetfighteriistreetfighteriiturbo/sheet/80834/

-- CONFIG --------------------------------------------------------------------------------------------------------------

-- pixel art effect
love.graphics.setDefaultFilter("nearest")

-- MODULES -------------------------------------------------------------------------------------------------------------

local my_game_settings = require("game_settings")
local my_characters = require("characters")
local my_character_selection_menu = require("character_selection_menu")

-- LÖVE ----------------------------------------------------------------------------------------------------------------

function love.load()
    love.window.setTitle("Street Fighter character selection menu by IAmTerror")

    love.window.setMode(my_game_settings.screen_width * my_game_settings.scale_factor, my_game_settings.screen_height * my_game_settings.scale_factor)

    WIDTH = love.graphics.getWidth()
    HEIGHT = love.graphics.getHeight()
end

function love.update(dt)
end

function love.draw()
end

-- CONTROLS ------------------------------------------------------------------------------------------------------------
function love.keypressed(key)
    my_characters.change()
    if key=="escape" then love.event.quit() end
    print("key pressed : "..key)
end