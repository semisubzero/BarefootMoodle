require "MF_ISMoodle"
print("Barefoot Moodle Loaded.")

local function OnNewGame(player)
    MF.createMoodle(Barefoot);
    MF.getMoodle(Barefoot,playerNum):setValue(1.0)

Events.OnNewGame.Add(OnNewGame)