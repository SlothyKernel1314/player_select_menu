-- MODULES -------------------------------------------------------------------------------------------------------------

local my_game_settings = require("game_settings")
local my_sfx = require("sfx")
local my_player_select_menu = require("player_select_menu")


-- CHARACTERS ATTRIBUTES -----------------------------------------------------------------------------------------------

local characters = {}

characters.roster = {
    -- @var1 : id (rank), @var2 : character name, @var3 : country
    -- @var4 : x sticker coordinate tileset, @var5 : y sticker coordinate tileset
    -- @var6 : x alernate sticker coordinate tileset, @var7 : y alternate sticker coordinate tileset
    -- @var8 : x country name coordinate tileset, @var9 : y country name coordinate tileset, @var10 : width of the country name quad
    -- @var11 : flag id, @var12 : current screen position flag id
    -- TODO: alternate stickers
    {1, "Ryu", "Japan", 15, 0, nil, nil, 86, 94, 30, 1, 6},
    {2, "E.Honda", "Japan", 284, 0, nil, nil, 354, 95, 56, 1, 7},
    {3, "Blanka", "Brazil", 562, 0, nil, nil, 630, 95, 56, 5, 9},
    {4, "Guile", "U.S.A.", 830, 0, nil, nil, 904, 95, 43, 2, 11},
    {5, "Balrog", "U.S.A.", 1097, 0, nil, nil, 1167, 95, 56, 2, 8},
    {6, "Vega", "Spain", 1373, 0, nil, nil, 1452, 95, 39, 4, 1},
    {7, "Ken", "U.S.A.", 13, 226, nil, nil, 95, 316, 30, 2, 10},
    {8, "Chun Li", "China", 279, 226, nil, nil, 351, 316, 56, 6, 5},
    {9, "Zangief", "U.S.S.R.", 565, 226, nil, nil, 628, 314, 56, 3, 2},
    {10, "Dhalsim", "India", 832, 226, nil, nil, 896, 314, 62, 7, 3},
    {11, "Sagat", "Thailand"; 1099, 226, nil, nil, 1170, 315, 46, 8, 4},
    {12, "M.Bison", "Thailand", 1371, 226, nil, nil, 1442, 314, 56, 8, 12}
}

characters.selected = 1

characters.stickers = {}
characters.stickers.width = 56
characters.stickers.height = 86
characters.stickers.x = 8
characters.stickers.y = 129
characters.stickers.textures = {}

characters.country_name = {}
characters.country_name.height = 13
-- offsetting country name texture the origin to the width center, relative to the width center of character sticker
characters.country_name.x = 8 + (characters.stickers.width / 2)
characters.country_name.y = 118
characters.country_name.textures = {}


-- FUNCTIONS -----------------------------------------------------------------------------------------------------------

function characters.stickers_load()
    for i = 1, 12, 1 do
        characters.stickers.textures[i] = love.graphics.newQuad(characters.roster[i][4], characters.roster[i][5],
                                                                characters.stickers.width, characters.stickers.height,
                                                                my_player_select_menu.main_tileset:getDimensions())
    end
end

function characters.country_name_load()
    for i = 1, 12, 1 do
        characters.country_name.textures[i] = love.graphics.newQuad(characters.roster[i][8], characters.roster[i][9],
                                                                characters.roster[i][10], characters.country_name.height,
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

function characters.country_name_draw(current_character_selected_id)
    love.graphics.draw(my_player_select_menu.main_tileset, characters.country_name.textures[current_character_selected_id],
                       characters.country_name.x * my_game_settings.scale_factor,
                       characters.country_name.y * my_game_settings.scale_factor,
                       nil,
                       my_game_settings.scale_factor, my_game_settings.scale_factor,
                       -- offsetting country name texture the origin to the width center, relative to the width center of character sticker
                       characters.roster[current_character_selected_id][10] / 2, 0)
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
            my_player_select_menu.selector.x = 70
            my_sfx.menu_selector_play()
        end
        if characters.selected < 1 then
            characters.selected = 6
            my_player_select_menu.selector.x = 170
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
            my_player_select_menu.selector.x = 70
            my_sfx.menu_selector_play()
        end
        if characters.selected < 7 and (love.keyboard.isDown("left") or love.keyboard.isDown("q")) then
            characters.selected = 12
            my_player_select_menu.selector.x = 170
            my_sfx.menu_selector_play()
        end
    end
    print("character selected : "..characters.selected.." ("..characters.roster[characters.selected][2]..", "..characters.roster[characters.selected][3]..")")
end


-- CALLBACKS -----------------------------------------------------------------------------------------------------------

function characters.load()
    characters.stickers_load()
    characters.country_name_load()
end

function characters.draw()
    characters.stickers_draw(characters.selected)
    characters.country_name_draw(characters.selected)
end

return characters