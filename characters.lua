local my_game_settings = require("game_settings")

local characters = {}

characters.roster = {}
-- @param1 : rank
-- @param2 : formatted menu name
-- @param3 : country
characters.roster.ryu = {1, "Ryu", "Japan"}
characters.roster.honda = {2, "E.Honda", "Japan"}
characters.roster.blanka = {3, "Blanka", "Brazil"}
characters.roster.guile = {4, "Guile", "U.S.A."}
characters.roster.balrog = {5, "Balrog", "U.S.A."}
characters.roster.vega = {6, "Vega", "Spain"}
characters.roster.ken = {7, "Ken", "U.S.A."}
characters.roster.chunli = {8, "Chun Li", "China"}
characters.roster.zangief = {9, "Zangief", "U.S.S.R."}
characters.roster.dhalsim = {10, "Dhalsim", "India"}
characters.roster.sagat = {11, "Sagat", "Thailand"}
characters.roster.bison = {12, "M.Bison", "Thailand"}

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
    print("character selected : "..characters.selected)
end

return characters