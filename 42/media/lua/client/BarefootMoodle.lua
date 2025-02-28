require "MF_ISMoodle"
print("Barefoot Moodle Loaded.")

MF.createMoodle('Barefoot')
MF.createMoodle('TornShoe')

local function getPlayerShoeCondition(player)
    if not player then return nil end  -- Ensure player exists

    local shoes = player:getClothingItem_Feet()

    if shoes then
        return shoes:getCondition()  -- Return the condition of the shoes
    else
        return nil  -- Player is not wearing shoes
    end
end

local function OnClothingUpdated(player)
    --MF.getMoodle('Barefoot',player:getPlayerNum()):setValue(0.0)
    shoes = getPlayerShoeCondition()
    if shoes then
        print(shoes)
    end
end

Events.OnClothingUpdated.Add(OnClothingUpdated)