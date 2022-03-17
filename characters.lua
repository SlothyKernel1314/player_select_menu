local characters = {}

local my_player_select_menu = require("player_select_menu")

characters.roster = {
    -- @param1 : rank, @param2 : character name, @param3 : country
    {1, "Ryu", "Japan"},
    {2, "E.Honda", "Japan"},
    {3, "Blanka", "Brazil"},
    {4, "Guile", "U.S.A."},
    {5, "Balrog", "U.S.A."},
    {6, "Vega", "Spain"},
    {7, "Ken", "U.S.A."},
    {8, "Chun Li", "China"},
    {9, "Zangief", "U.S.S.R."},
    {10, "Dhalsim", "India"},
    {11, "Sagat", "Thailand"},
    {12, "M.Bison", "Thailand"}
}

characters.selected = 1

function characters.change()
    if characters.selected <= 6 then
        if love.keyboard.isDown("left") or love.keyboard.isDown("q") then
            characters.selected = characters.selected - 1
            my_player_select_menu.selector.x = my_player_select_menu.selector.x - 20
        end
        if love.keyboard.isDown("right") or love.keyboard.isDown("d") then
            characters.selected = characters.selected + 1
            my_player_select_menu.selector.x = my_player_select_menu.selector.x + 20
        end
        if love.keyboard.isDown("down") or love.keyboard.isDown("s")then
            characters.selected = characters.selected + 6
            my_player_select_menu.selector.y = my_player_select_menu.selector.y + 32
        end
        if characters.selected > 6 and (love.keyboard.isDown("right") or love.keyboard.isDown("d")) then
            characters.selected = 1
            my_player_select_menu.selector.x = 80
        end
        if characters.selected < 1 then
            characters.selected = 6
            my_player_select_menu.selector.x = 180
        end
    end
    if characters.selected > 6 then
        if love.keyboard.isDown("left") or love.keyboard.isDown("q") then
            characters.selected = characters.selected - 1
            my_player_select_menu.selector.x = my_player_select_menu.selector.x - 20
        end
        if love.keyboard.isDown("right") or love.keyboard.isDown("d") then
            characters.selected = characters.selected + 1
            my_player_select_menu.selector.x = my_player_select_menu.selector.x + 20
        end
        if love.keyboard.isDown("up") or love.keyboard.isDown("z")then
            characters.selected = characters.selected - 6
            my_player_select_menu.selector.y = my_player_select_menu.selector.y - 32
        end
        if characters.selected > 12 and (love.keyboard.isDown("right") or love.keyboard.isDown("d")) then
            characters.selected = 7
            my_player_select_menu.selector.x = 80
        end
        if characters.selected < 7 and (love.keyboard.isDown("left") or love.keyboard.isDown("q")) then
            characters.selected = 12
            my_player_select_menu.selector.x = 180
        end
    end
    print("character selected : "..characters.selected.." ("..characters.roster[characters.selected][2]..", "..characters.roster[characters.selected][3]..")")
end

return characters