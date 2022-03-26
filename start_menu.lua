-- MODULES -------------------------------------------------------------------------------------------------------------

local my_game_settings = require("game_settings")


-- PLAYER SELECT MENU ATTRIBUTES ---------------------------------------------------------------------------------------

local start_menu = {}

start_menu.background_color = {0/255, 0/255, 0/255}

start_menu.main_tileset = nil

start_menu.sf2_logo = {}
start_menu.sf2_logo.texture = nil
start_menu.sf2_logo.x = 0
start_menu.sf2_logo.y = 10


-- FUNCTIONS -----------------------------------------------------------------------------------------------------------

function start_menu.main_tileset_load()
    start_menu.main_tileset = love.graphics.newImage("img/sf2_snes_start_menu_tileset.png")
end

function start_menu.sf2_logo_load()
    start_menu.sf2_logo.texture = love.graphics.newQuad(464, 282,
                                                        256, 117,
                                                        start_menu.main_tileset:getDimensions())
end

function start_menu.sf2_logo_draw()
    love.graphics.draw(start_menu.main_tileset, start_menu.sf2_logo.texture,
                       start_menu.sf2_logo.x * my_game_settings.scale_factor,
                       start_menu.sf2_logo.y * my_game_settings.scale_factor,
                       nil,
                       my_game_settings.scale_factor, my_game_settings.scale_factor)
end


-- CALLBACKS -----------------------------------------------------------------------------------------------------------

function start_menu.load()
    start_menu.main_tileset_load()
    start_menu.sf2_logo_load()
end

function start_menu.draw()
    start_menu.sf2_logo_draw()
end

return start_menu