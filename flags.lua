-- MODULES -------------------------------------------------------------------------------------------------------------

local my_game_settings = require("game_settings")
local my_characters = require("characters")
local my_player_select_menu = require("player_select_menu")



-- CHARACTERS ATTRIBUTES -----------------------------------------------------------------------------------------------

local flags = {}

flags.data = {
    -- @param1 : id (rank)), @param2 : country
    -- @param3 : x flag coordinate tileset, @param4 : y flag coordinate tileset
    -- @param5 : x flag screen position, @param6 : y flag screen position (TODO: à placer manuellement)
    {1, "Japan", 477, 499, 10, 10},
    {2, "U.S.A.", 513, 499, 10, 10},
    {3, "U.S.S.R.", 549, 499, 10, 10},
    {4, "Spain", 585, 499, 10, 10},
    {5, "Brazil", 477, 530, 10, 10},
    {6, "China", 513, 530, 10, 10},
    {7, "India", 549, 530, 10, 10},
    {8, "Thailand", 585, 530, 10, 10}
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

function flags.graphics_draw(flag_id)
    love.graphics.draw(my_player_select_menu.main_tileset, flags.graphics.textures[flag_id],
                       10 * my_game_settings.scale_factor,
                       10 * my_game_settings.scale_factor,
                       nil,
                       my_game_settings.scale_factor, my_game_settings.scale_factor)
end

-- CALLBACKS -----------------------------------------------------------------------------------------------------------

function flags.load()
    flags.graphics_load()
end

function flags.draw()
    flags.graphics_draw(my_characters.roster[my_characters.selected][11])
end

return flags