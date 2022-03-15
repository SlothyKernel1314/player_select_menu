-- MODULES -------------------------------------------------------------------------------------------------------------

local my_game_settings = require("game_settings")


-- PLAYER SELECT MENU ATTRIBUTES ---------------------------------------------------------------------------------------

local player_select_menu = {}

player_select_menu.main_tileset = nil
player_select_menu.selector_tileset = nil
player_select_menu.overlay = {}
player_select_menu.overlay.texture = nil
player_select_menu.characters_box_selection = {}
player_select_menu.characters_box_selection.texture = nil
player_select_menu.selector = {}
player_select_menu.selector.texture = nil


-- FUNCTIONS -----------------------------------------------------------------------------------------------------------

function player_select_menu.main_tileset_load()
    player_select_menu.main_tileset = love.graphics.newImage("img/sf2_snes_player_select_tileset.png")
end

function player_select_menu.main_tileset_2_load()
    player_select_menu.main_tileset_2 = love.graphics.newImage("img/sf2_snes_player_select_tileset_2.png")
end

function player_select_menu.selector_tileset_load()
    player_select_menu.selector_tileset = love.graphics.newImage("img/sf2_snes_selector_tileset.png")
end

function player_select_menu.overlay_load()
    player_select_menu.overlay.texture = love.graphics.newQuad(0, 0,
                                                               my_game_settings.screen_width,
                                                               my_game_settings.screen_height,
                                                               player_select_menu.main_tileset:getDimensions())
end

function player_select_menu.characters_box_selection_load()
    -- TODO: décaler la box vers la gauche après placement des vignettes de personnages
    player_select_menu.characters_box_selection.texture = love.graphics.newQuad(110, 498,
                                                                                121, 65,
                                                                                player_select_menu.main_tileset_2:getDimensions())
end

function player_select_menu.selector_load()
    player_select_menu.selector.texture = love.graphics.newQuad(0, 0,
                                                                24, 36,
                                                                player_select_menu.selector_tileset:getDimensions())
end

function player_select_menu.overlay_draw()
    love.graphics.draw(player_select_menu.main_tileset, player_select_menu.overlay.texture,
                        0, 0,
                        nil,
                        my_game_settings.scale_factor, my_game_settings.scale_factor)
end

function player_select_menu.characters_box_selection_draw()
    love.graphics.draw(player_select_menu.main_tileset_2, player_select_menu.characters_box_selection.texture,
                       80 * my_game_settings.scale_factor, 144 * my_game_settings.scale_factor,
                       nil,
                       my_game_settings.scale_factor, my_game_settings.scale_factor)
end

function player_select_menu.selector_draw()
    love.graphics.draw(player_select_menu.selector_tileset, player_select_menu.selector.texture,
                       80 * my_game_settings.scale_factor, 140 * my_game_settings.scale_factor,
                       nil,
                       my_game_settings.scale_factor, my_game_settings.scale_factor)
end


-- CALLBACKS -----------------------------------------------------------------------------------------------------------

function player_select_menu.load()
    player_select_menu.main_tileset_load()
    player_select_menu.main_tileset_2_load()
    player_select_menu.selector_tileset_load()
    player_select_menu.overlay_load()
    player_select_menu.characters_box_selection_load()
    player_select_menu.selector_load()
end

function player_select_menu.draw()
    player_select_menu.overlay_draw()
    player_select_menu.characters_box_selection_draw()
    player_select_menu.selector_draw()
end

return player_select_menu