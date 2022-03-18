-- MODULES -------------------------------------------------------------------------------------------------------------

local my_player_select_menu = require("player_select_menu")
local my_sfx = require("sfx")


-- CHARACTERS ATTRIBUTES -----------------------------------------------------------------------------------------------

local characters = {}

characters.roster = {
    -- @param1 : rank, @param2 : character name, @param3 : country
    -- @param4 : x coordinate tileset, @param5 : y coordinate tileset
    -- TODO: alternate stickers
    {1, "Ryu", "Japan", 15, 0},
    {2, "E.Honda", "Japan", 284, 0},
    {3, "Blanka", "Brazil", 562, 0},
    {4, "Guile", "U.S.A.", 830, 0},
    {5, "Balrog", "U.S.A.", 1097, 0},
    {6, "Vega", "Spain", 1373, 0},
    {7, "Ken", "U.S.A.", 13, 226},
    {8, "Chun Li", "China", 279, 226},
    {9, "Zangief", "U.S.S.R.", 565, 226},
    {10, "Dhalsim", "India", 832, 226},
    {11, "Sagat", "Thailand"; 1099, 226},
    {12, "M.Bison", "Thailand", 1371, 226}
}

characters.selected = 1

characters.stickers = {}
characters.stickers.width = 56
characters.stickers.height = 86
characters.stickers.textures = {}


-- FUNCTIONS -----------------------------------------------------------------------------------------------------------

function characters.stickers_load()
    for i = 1, 12, 1 do
        characters.stickers.textures[i] = love.graphics.newQuad(characters.roster[i][4], characters.roster[i][5],
                                                                characters.stickers.width, characters.stickers.height,
                                                                my_player_select_menu.main_tileset:getDimensions())
    end
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

return characters