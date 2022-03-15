--Author :
--+-+-+-+-+-+-+-+-+-+
--|I|A|m|T|e|r|r|o|r|
--+-+-+-+-+-+-+-+-+-+

-- Street Fighter Wiki - Character Select : https://streetfighter.fandom.com/wiki/Character_Select
-- Street Fighter Wiki - Street Fighter 2 The World Warrior : https://streetfighter.fandom.com/wiki/Street_Fighter_II:_The_World_Warrior
-- Street Fighter 2 Turbo Hyper Fighting (SNES) - World of Longplays : https://www.youtube.com/watch?v=8Usyp6OBAa8
-- The Spriter Ressources - SF2 (SNES) Player Select tileset : https://www.spriters-resource.com/snes/streetfighteriistreetfighteriiturbo/sheet/5573/


-- CONFIG --------------------------------------------------------------------------------------------------------------

-- pixel art effect
love.graphics.setDefaultFilter("nearest")


-- MODULES -------------------------------------------------------------------------------------------------------------

local my_game_settings = require("game_settings")
local my_characters = require("characters")
local my_player_select_menu = require("player_select_menu")


-- LÖVE ----------------------------------------------------------------------------------------------------------------

function love.load()
    love.window.setTitle("Street Fighter player select menu by IAmTerror")

    love.window.setMode(my_game_settings.screen_width * my_game_settings.scale_factor, my_game_settings.screen_height * my_game_settings.scale_factor)

    WIDTH = love.graphics.getWidth()
    HEIGHT = love.graphics.getHeight()

    my_player_select_menu.load()
end

function love.update(dt)
end

function love.draw()
    -- love.graphics.setBackgroundColor(my_player_select_menu.background_color[1] / 255,
    --                                  my_player_select_menu.background_color[2] / 255,
    --                                  my_player_select_menu.background_color[3] / 255)

    my_player_select_menu.overlay_draw()
    my_player_select_menu.characters_box_selection_draw()
    my_player_select_menu.selector_draw()
end


-- CONTROLS ------------------------------------------------------------------------------------------------------------

function love.keypressed(key)
    my_characters.change()
    if key=="escape" then love.event.quit() end
    print("key pressed : "..key)
end