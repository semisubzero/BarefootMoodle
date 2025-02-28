require "MF_ISMoodle"
print("Barefoot Moodle Loaded.")

MF.createMoodle('Barefoot')
MF.createMoodle('TornShoe')


local function OnClothingUpdated(character)
    --MF.getMoodle('Barefoot',player:getPlayerNum()):setValue(0.0)
    print(player:getClothingItemFeet())
end

Events.OnClothingUpdated.Add(OnClothingUpdated)