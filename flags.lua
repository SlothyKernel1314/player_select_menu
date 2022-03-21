-- MODULES -------------------------------------------------------------------------------------------------------------

local my_game_settings = require("game_settings")


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



-- CALLBACKS -----------------------------------------------------------------------------------------------------------

function flags.load()
end

function flags.draw()
end

return flags