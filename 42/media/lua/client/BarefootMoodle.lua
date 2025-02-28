require "MF_ISMoodle"
print("Barefoot Moodle Loaded.")

MF.createMoodle('Barefoot')

local function OnNewGame(player)
    MF.getMoodle('Barefoot',player:getPlayerNum()):setValue(0.0)
end

Events.OnNewGame.Add(OnNewGame)