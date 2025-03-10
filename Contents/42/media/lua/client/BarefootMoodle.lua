require "MF_ISMoodle"
print("[BarefootMoodle] Loaded!")

MF.createMoodle("Barefoot")
MF.createMoodle("TornShoe")

local function getPlayerShoeCondition(player)
    local shoes = player:getClothingItem_Feet()

    if shoes then
        return shoes:getCurrentCondition()  -- Return the condition of the shoes
    else
        return nil  -- Player is not wearing shoes
    end
end

local function UpdateMoodles(player)

    local shoes = getPlayerShoeCondition(player)
    if shoes then
        -- Hide the barefoot moodle
        MF.getMoodle('Barefoot',player:getPlayerNum()):setValue(0.5)

        -- If shoes are 0-20%
        if 15 < shoes and shoes <= 20 then
            MF.getMoodle('TornShoe',player:getPlayerNum()):setValue(0.4)
        elseif 10 < shoes and shoes <= 15 then
            MF.getMoodle('TornShoe',player:getPlayerNum()):setValue(0.3)
        elseif 5 < shoes and shoes <= 10 then
            MF.getMoodle('TornShoe',player:getPlayerNum()):setValue(0.2)
        elseif 0 < shoes and shoes <= 5 then
            MF.getMoodle('TornShoe',player:getPlayerNum()):setValue(0.1)
        -- If shoes are broken
        elseif shoes <= 0 then
            MF.getMoodle('TornShoe',player:getPlayerNum()):setValue(0.5)
            MF.getMoodle('Barefoot',player:getPlayerNum()):setValue(0.0)
        -- If shoes are above 20%
        else
            MF.getMoodle('TornShoe',player:getPlayerNum()):setValue(0.5)
        end
    else
        -- Chose to go barefoot
        MF.getMoodle('TornShoe',player:getPlayerNum()):setValue(0.5)
        MF.getMoodle('Barefoot',player:getPlayerNum()):setValue(0.0)
    end
end

Events.OnPlayerUpdate.Add(UpdateMoodles)