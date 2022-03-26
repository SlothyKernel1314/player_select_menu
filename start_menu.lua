-- MODULES -------------------------------------------------------------------------------------------------------------

local my_game_settings = require("game_settings")


-- PLAYER SELECT MENU ATTRIBUTES ---------------------------------------------------------------------------------------

local start_menu = {}


-- FUNCTIONS -----------------------------------------------------------------------------------------------------------

function start_menu.test_draw()
    love.graphics.print("toto", 0, 0)
end


-- CALLBACKS -----------------------------------------------------------------------------------------------------------

function start_menu.load()
end

function start_menu.draw()
    start_menu.test_draw()
end

return start_menu