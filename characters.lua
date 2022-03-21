-- MODULES -------------------------------------------------------------------------------------------------------------

local my_game_settings = require("game_settings")
local my_sfx = require("sfx")
local my_player_select_menu = require("player_select_menu")


-- CHARACTERS ATTRIBUTES -----------------------------------------------------------------------------------------------

local characters = {}

characters.roster = {
    -- @param1 : rank, @param2 : character name, @param3 : country
    -- @param4 : x sticker coordinate tileset, @param5 : y sticker coordinate tileset
    -- @param6 : x alernate sticker coordinate tileset, @param7 : y alternate sticker coordinate tileset
    -- @param8 : x country name coordinate tileset, @param9 : y country name coordinate tileset, @param10 : width of the country name quad
    -- TODO: alternate stickers
    {1, "Ryu", "Japan", 15, 0, nil, nil, 86, 94, 30},
    {2, "E.Honda", "Japan", 284, 0, nil, nil, 354, 95, 56},
    {3, "Blanka", "Brazil", 562, 0, nil, nil, 630, 95, 56},
    {4, "Guile", "U.S.A.", 830, 0, nil, nil, 904, 95, 43},
    {5, "Balrog", "U.S.A.", 1097, 0, nil, nil, 1167, 95, 56},
    {6, "Vega", "Spain", 1373, 0, nil, nil, 1452, 95, 39},
    {7, "Ken", "U.S.A.", 13, 226, nil, nil, 95, 316, 30, 13},
    {8, "Chun Li", "China", 279, 226, nil, nil, 351, 316, 56},
    {9, "Zangief", "U.S.S.R.", 565, 226, nil, nil, 628, 314, 56},
    {10, "Dhalsim", "India", 832, 226, nil, nil, 896, 314, 62},
    {11, "Sagat", "Thailand"; 1099, 226, nil, nil, 1170, 315, 46},
    {12, "M.Bison", "Thailand", 1371, 226, nil, nil, 1442, 314, 56}
}

characters.selected = 1

characters.stickers = {}
characters.stickers.width = 56
characters.stickers.height = 86
characters.stickers.x = 8
characters.stickers.y = 129
characters.stickers.textures = {}


-- FUNCTIONS -----------------------------------------------------------------------------------------------------------

function characters.stickers_load()
    for i = 1, 12, 1 do
        characters.stickers.textures[i] = love.graphics.newQuad(characters.roster[i][4], characters.roster[i][5],
                                                                characters.stickers.width, characters.stickers.height,
                                                                my_player_select_menu.main_tileset:getDimensions())
    end
end

function characters.stickers_draw(current_character_selected_id)
    love.graphics.draw(my_player_select_menu.main_tileset, characters.stickers.textures[current_character_selected_id],
                       characters.stickers.x * my_game_settings.scale_factor,
                       characters.stickers.y * my_game_settings.scale_factor,
                       nil,
                       my_game_settings.scale_factor, my_game_settings.scale_factor)
end

function characters.change()
    if characters.selected <= 6 then
        if love.keyboard.isDown("left") or love.keyboard.isDown("q") then
            characters.selected = characters.selected - 1
            my_player_select_menu.selector.x = my_player_select_menu.selector.x - 20
            my_sfx.menu_selector_play()
        end
        if love.keyboard.isDown("right") or love.keyboard.isDown("d") then
            characters.selected = characters.selected + 1
            my_player_select_menu.selector.x = my_player_select_menu.selector.x + 20
            my_sfx.menu_selector_play()
        end
        if love.keyboard.isDown("down") or love.keyboard.isDown("s")then
            characters.selected = characters.selected + 6
            my_player_select_menu.selector.y = my_player_select_menu.selector.y + 32
            my_sfx.menu_selector_play()
        end
        if characters.selected > 6 and (love.keyboard.isDown("right") or love.keyboard.isDown("d")) then
            characters.selected = 1
            my_player_select_menu.selector.x = 80
            my_sfx.menu_selector_play()
        end
        if characters.selected < 1 then
            characters.selected = 6
            my_player_select_menu.selector.x = 180
            my_sfx.menu_selector_play()
        end
    end
    if characters.selected > 6 then
        if love.keyboard.isDown("left") or love.keyboard.isDown("q") then
            characters.selected = characters.selected - 1
            my_player_select_menu.selector.x = my_player_select_menu.selector.x - 20
            my_sfx.menu_selector_play()
        end
        if love.keyboard.isDown("right") or love.keyboard.isDown("d") then
            characters.selected = characters.selected + 1
            my_player_select_menu.selector.x = my_player_select_menu.selector.x + 20
            my_sfx.menu_selector_play()
        end
        if love.keyboard.isDown("up") or love.keyboard.isDown("z")then
            characters.selected = characters.selected - 6
            my_player_select_menu.selector.y = my_player_select_menu.selector.y - 32
            my_sfx.menu_selector_play()
        end
        if characters.selected > 12 and (love.keyboard.isDown("right") or love.keyboard.isDown("d")) then
            characters.selected = 7
            my_player_select_menu.selector.x = 80
            my_sfx.menu_selector_play()
        end
        if characters.selected < 7 and (love.keyboard.isDown("left") or love.keyboard.isDown("q")) then
            characters.selected = 12
            my_player_select_menu.selector.x = 180
            my_sfx.menu_selector_play()
        end
    end
    print("character selected : "..characters.selected.." ("..characters.roster[characters.selected][2]..", "..characters.roster[characters.selected][3]..")")
end


-- CALLBACKS -----------------------------------------------------------------------------------------------------------

function characters.load()
    characters.stickers_load()
end

function characters.draw()
    characters.stickers_draw(characters.selected)
end

return characters