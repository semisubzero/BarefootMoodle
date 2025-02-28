require "MF_ISMoodle"
print("Barefoot Moodle Loaded.")

MF.createMoodle('Barefoot')

local function OnNewGame(player)
    MF.getMoodle('Barefoot',playerNum):setValue(0.0)
end

Events.OnNewGame.Add(OnNewGame)