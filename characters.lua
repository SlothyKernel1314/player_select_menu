local my_game_settings = require("game_settings")

local characters = {}

characters.roster = {}
characters.roster.ryu = {1, "Ryu", "Japan"}
characters.roster.ken = {2, "Ken Masters", "U.S.A."}
characters.roster.honda = {3, "E. Honda", "Japan"}
characters.roster.chunli = {4, "Chun Li", "China"}
characters.roster.blanka = {5, "Blanka", "Brazil"}
characters.roster.zangief = {6, "Zangief", "U.S.S.R."}
characters.roster.guile = {7, "Guile", "U.S.A."}
characters.roster.dhaslim = {8, "Dhaslim", "India"}
characters.roster.hawk = {9, "T. Hawk", "Mexico"}
characters.roster.cammy = {10, "Cammy", "England"}
characters.roster.feilong = {11, "Fei Long", "Hong Kong"}
characters.roster.deejay = {12, "Dee Jay", "Jamaica"}
characters.roster.balrog = {13, "Balrog", "U.S.A."}
characters.roster.vega = {14, "Vega", "Spain"}
characters.roster.sagat = {15, "Sagat", "Thailand"}
characters.roster.bison = {16, "M. Bison", "Thailand"}
characters.roster.akuma = {17, "Akuma", "Japan"}

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