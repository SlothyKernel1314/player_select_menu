-- MODULES -------------------------------------------------------------------------------------------------------------

local my_game_settings = require("game_settings")


-- PLAYER SELECT MENU ATTRIBUTES ---------------------------------------------------------------------------------------

local player_select_menu = {}

player_select_menu.background_color = {0, 0, 96} --"000060"

player_select_menu.main_tileset = nil
player_select_menu.selector_tileset = nil

player_select_menu.upper_black_strip = {}
player_select_menu.upper_black_strip.image = nil
player_select_menu.upper_black_strip.x = 0
player_select_menu.upper_black_strip.y = 0
player_select_menu.lower_black_strip = {}
player_select_menu.lower_black_strip.image = nil
player_select_menu.lower_black_strip.x = 0
player_select_menu.lower_black_strip.y = 215

player_select_menu.characters_box_selection = {}
player_select_menu.characters_box_selection.texture = nil
player_select_menu.characters_box_selection.x = 80
player_select_menu.characters_box_selection.y = 143
player_select_menu.selector = {}
player_select_menu.selector.texture = nil
player_select_menu.selector.x = 80
player_select_menu.selector.y = 140
player_select_menu.world_map = {}
player_select_menu.world_map.texture = nil
player_select_menu.world_map.x = 39
player_select_menu.world_map.y = 39


-- FUNCTIONS -----------------------------------------------------------------------------------------------------------

function player_select_menu.main_tileset_load()
    player_select_menu.main_tileset = love.graphics.newImage("img/sf2_snes_player_select_tileset.png")
end

function player_select_menu.selector_tileset_load()
    player_select_menu.selector_tileset = love.graphics.newImage("img/sf2_snes_selector_tileset.png")
end

function player_select_menu.upper_black_strip_load()
    player_select_menu.upper_black_strip.image = love.graphics.newImage("img/upper_black_strip.png")
end

function player_select_menu.lower_black_strip_load()
    player_select_menu.lower_black_strip.image = love.graphics.newImage("img/lower_black_strip.png")
end

function player_select_menu.characters_box_selection_load()
    -- TODO: décaler la box vers la gauche après placement des vignettes de personnages
    player_select_menu.characters_box_selection.texture = love.graphics.newQuad(110, 498,
                                                                                121, 65,
                                                                                player_select_menu.main_tileset:getDimensions())
end

function player_select_menu.selector_load()
    player_select_menu.selector.texture = love.graphics.newQuad(0, 0,
                                                                24, 36,
                                                                player_select_menu.selector_tileset:getDimensions())
end

function player_select_menu.world_map_load()
    player_select_menu.world_map.texture = love.graphics.newQuad(279, 492,
                                                                169, 92,
                                                                player_select_menu.main_tileset:getDimensions())
end

function player_select_menu.characters_box_selection_draw()
    love.graphics.draw(player_select_menu.main_tileset, player_select_menu.characters_box_selection.texture,
                       player_select_menu.characters_box_selection.x * my_game_settings.scale_factor,
                       player_select_menu.characters_box_selection.y * my_game_settings.scale_factor,
                       nil,
                       my_game_settings.scale_factor, my_game_settings.scale_factor)
end

function player_select_menu.selector_draw()
    love.graphics.draw(player_select_menu.selector_tileset, player_select_menu.selector.texture,
                       player_select_menu.selector.x * my_game_settings.scale_factor,
                       player_select_menu.selector.y * my_game_settings.scale_factor,
                       nil,
                       my_game_settings.scale_factor, my_game_settings.scale_factor)
end

function player_select_menu.world_map_draw()
    love.graphics.draw(player_select_menu.main_tileset, player_select_menu.world_map.texture,
                       player_select_menu.world_map.x * my_game_settings.scale_factor,
                       player_select_menu.world_map.y * my_game_settings.scale_factor,
                       nil,
                       my_game_settings.scale_factor, my_game_settings.scale_factor)
end

function player_select_menu.upper_black_strip_draw()
    love.graphics.draw(player_select_menu.upper_black_strip.image,
                       player_select_menu.upper_black_strip.x * my_game_settings.scale_factor,
                       player_select_menu.upper_black_strip.y * my_game_settings.scale_factor,
                       nil,
                       my_game_settings.scale_factor, my_game_settings.scale_factor)
end

function player_select_menu.lower_black_strip_draw()
    love.graphics.draw(player_select_menu.lower_black_strip.image,
                       player_select_menu.lower_black_strip.x * my_game_settings.scale_factor,
                       player_select_menu.lower_black_strip.y * my_game_settings.scale_factor,
                       nil,
                       my_game_settings.scale_factor, my_game_settings.scale_factor)
end


-- CALLBACKS -----------------------------------------------------------------------------------------------------------

function player_select_menu.load()
    player_select_menu.main_tileset_load()
    player_select_menu.selector_tileset_load()
    player_select_menu.upper_black_strip_load()
    player_select_menu.lower_black_strip_load()
    player_select_menu.characters_box_selection_load()
    player_select_menu.selector_load()
    player_select_menu.world_map_load()
end

function player_select_menu.draw()
    player_select_menu.upper_black_strip_draw()
    player_select_menu.lower_black_strip_draw()
    player_select_menu.characters_box_selection_draw()
    player_select_menu.selector_draw()
    player_select_menu.world_map_draw()
end

return player_select_menu