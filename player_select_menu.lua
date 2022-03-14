local my_game_settings = require("game_settings")

local player_select_menu = {}

-- player_select_menu.background_color = {38, 0, 95} --"26005f"

player_select_menu.main_tileset = love.graphics.newImage("img/sf2_snes_player_select_tileset.png")

player_select_menu.overlay = love.graphics.newQuad(0, 0,
                                                   my_game_settings.screen_width,
                                                   my_game_settings.screen_height,
                                                   player_select_menu.main_tileset:getDimensions())

player_select_menu.characters_box_selection = love.graphics.newQuad(30, 387,
                                                   96, 64,
                                                   player_select_menu.main_tileset:getDimensions())

-- player_select_menu.selector = love.graphics.newQuad(77, 485,
--                                                     24, 36,
--                                                     player_select_menu.main_tileset:getDimensions())

function player_select_menu.overlay_draw()
    love.graphics.draw(player_select_menu.main_tileset, player_select_menu.overlay,
                        0, 0,
                        nil,
                        my_game_settings.scale_factor, my_game_settings.scale_factor)
end

function player_select_menu.characters_box_selection_draw()
    love.graphics.draw(player_select_menu.main_tileset, player_select_menu.characters_box_selection,
                       80 * my_game_settings.scale_factor, 144 * my_game_settings.scale_factor,
                       nil,
                       my_game_settings.scale_factor, my_game_settings.scale_factor)
end

return player_select_menu