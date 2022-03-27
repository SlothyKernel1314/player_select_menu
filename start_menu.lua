-- MODULES -------------------------------------------------------------------------------------------------------------

local my_game_settings = require("game_settings")
local my_scenes = require("scenes")


-- ATTRIBUTES ----------------------------------------------------------------------------------------------------------

local start_menu = {}

start_menu.background_color = {0/255, 0/255, 0/255}

start_menu.main_tileset = nil

start_menu.sf2_logo = {}
start_menu.sf2_logo.texture = nil
start_menu.sf2_logo.x = 0
start_menu.sf2_logo.y = 10

start_menu.hfighting_text = {}
start_menu.hfighting_text.texture = nil
start_menu.hfighting_text.x = 70
start_menu.hfighting_text.y = 133

start_menu.gstart_text = {}
start_menu.gstart_text.texture = nil
start_menu.gstart_text.x = 85
start_menu.gstart_text.y = 168
start_menu.gstart_text.isDisplay = true
start_menu.timer = love.timer.getTime()


-- FUNCTIONS -----------------------------------------------------------------------------------------------------------

function start_menu.main_tileset_load()
    start_menu.main_tileset = love.graphics.newImage("img/sf2_snes_start_menu_tileset.png")
end

function start_menu.sf2_logo_load()
    start_menu.sf2_logo.texture = love.graphics.newQuad(464, 282,
                                                        256, 117,
                                                        start_menu.main_tileset:getDimensions())
end

function start_menu.hfighting_text_load()
    start_menu.hfighting_text.texture = love.graphics.newQuad(12, 110,
                                                              121, 10,
                                                              start_menu.main_tileset:getDimensions())
end

function start_menu.gstart_text_load()
    start_menu.gstart_text.texture = love.graphics.newQuad(165, 349,
                                                           80, 8,
                                                           start_menu.main_tileset:getDimensions())
end

function start_menu.sf2_logo_draw()
    love.graphics.draw(start_menu.main_tileset, start_menu.sf2_logo.texture,
                       start_menu.sf2_logo.x * my_game_settings.scale_factor,
                       start_menu.sf2_logo.y * my_game_settings.scale_factor,
                       nil,
                       my_game_settings.scale_factor, my_game_settings.scale_factor)
end

function start_menu.hfighting_text_draw()
    love.graphics.draw(start_menu.main_tileset, start_menu.hfighting_text.texture,
                       start_menu.hfighting_text.x * my_game_settings.scale_factor,
                       start_menu.hfighting_text.y * my_game_settings.scale_factor,
                       nil,
                       my_game_settings.scale_factor, my_game_settings.scale_factor)
end

function start_menu.gstart_text_draw()
    local interval_time = love.timer.getTime() - start_menu.timer
    if interval_time > 0.7 and start_menu.gstart_text.isDisplay == true then
        interval_time = 0
        start_menu.timer = love.timer.getTime()
        start_menu.gstart_text.isDisplay = false
    end
    if interval_time > 0.7 and start_menu.gstart_text.isDisplay == false then
        interval_time = 0
        start_menu.timer = love.timer.getTime()
        start_menu.gstart_text.isDisplay = true
    end
    if start_menu.gstart_text.isDisplay == true then
        love.graphics.draw(start_menu.main_tileset, start_menu.gstart_text.texture,
                       start_menu.gstart_text.x * my_game_settings.scale_factor,
                       start_menu.gstart_text.y * my_game_settings.scale_factor,
                       nil,
                       my_game_settings.scale_factor, my_game_settings.scale_factor)
    end
end

function start_menu.start_game()
    if love.keyboard.isDown("return") then
        my_scenes.selected = 2
    end
end


-- CALLBACKS -----------------------------------------------------------------------------------------------------------

function start_menu.load()
    start_menu.main_tileset_load()
    start_menu.sf2_logo_load()
    start_menu.hfighting_text_load()
    start_menu.gstart_text_load()
end

function start_menu.draw()
    start_menu.sf2_logo_draw()
    start_menu.hfighting_text_draw()
    start_menu.gstart_text_draw()
end

return start_menu