-- MODULES -------------------------------------------------------------------------------------------------------------

local my_game_settings = require("game_settings")
local my_characters = require("characters")
local my_player_select_menu = require("player_select_menu")


-- CHARACTERS ATTRIBUTES -----------------------------------------------------------------------------------------------

local flags = {}

flags.data = {
    -- @param1 : id (rank), @param2 : country
    -- @param3 : x flag coordinate tileset, @param4 : y flag coordinate tileset
    {1, "Japan", 477, 499},
    {2, "U.S.A.", 513, 499},
    {3, "U.S.S.R.", 549, 499},
    {4, "Spain", 585, 499},
    {5, "Brazil", 477, 530},
    {6, "China", 513, 530},
    {7, "India", 549, 530},
    {8, "Thailand", 585, 530}
}

flags.screen_position = {
    -- @param1 : id (rank)
    -- @param2 : x flag screen position, @param3 : y flag screen position
    {1, "Spain", 100, 100},
    {2, "U.S.S.R.", 10, 10},
    {3, "India", 10, 10},
    {4, "Thailand", 10, 10},
    {5, "China", 10, 10},
    {6, "Japan", 10, 10},
    {7, "Japan bis", 10, 10},
    {8, "U.S.A.", 10, 10},
    {9, "Brazil", 10, 10},
    {10, "U.S.A. bis", 10, 10},
    {11, "U.S.A. ter", 10, 10}
}

flags.graphics = {}
flags.graphics.width = 21
flags.graphics.height = 22
flags.graphics.textures = {}


-- FUNCTIONS -----------------------------------------------------------------------------------------------------------

function flags.graphics_load()
    for i = 1, 8, 1 do
        flags.graphics.textures[i] = love.graphics.newQuad(flags.data[i][3], flags.data[i][4],
                                                           flags.graphics.width, flags.graphics.height,
                                                           my_player_select_menu.main_tileset:getDimensions())
    end
end

function flags.graphics_draw()
    local current_flag_id = my_characters.roster[my_characters.selected][11]
    local current_screen_position_flag_id = my_characters.roster[my_characters.selected][12]
    love.graphics.draw(my_player_select_menu.main_tileset, flags.graphics.textures[current_flag_id],
                       flags.screen_position[current_screen_position_flag_id][3] * my_game_settings.scale_factor,
                       flags.screen_position[current_screen_position_flag_id][4] * my_game_settings.scale_factor,
                       nil,
                       my_game_settings.scale_factor, my_game_settings.scale_factor)
end


-- CALLBACKS -----------------------------------------------------------------------------------------------------------

function flags.load()
    flags.graphics_load()
end

function flags.draw()
    flags.graphics_draw()
end

return flags