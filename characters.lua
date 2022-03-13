local my_game_settings = require("game_settings")

local characters = {}

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
    -- TODO: selection bas et haut
    --[[ if love.keyboard.isDown("up") or love.keyboard.isDown("z") then
    end
    if love.keyboard.isDown("down") or love.keyboard.isDown("s") then
    end ]]
    if love.keyboard.isDown("left") or love.keyboard.isDown("q") then
        characters.selected = characters.selected - 1
    end
    if love.keyboard.isDown("right") or love.keyboard.isDown("d") then
        characters.selected = characters.selected + 1
    end
    if characters.selected > my_game_settings.max_characters then
        characters.selected = 1
    end
    if characters.selected < 1 then
        characters.selected = my_game_settings.max_characters
    end
    print("character selected : "..characters.selected.." ("..characters.roster[characters.selected][2]..", "..characters.roster[characters.selected][3]..")")
end

return characters