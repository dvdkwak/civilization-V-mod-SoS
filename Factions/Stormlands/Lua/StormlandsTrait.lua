-- Lua Script1
-- Author: dvdkwak
-- DateCreated: 5/7/2021 11:06:36 PM
--------------------------------------------------------------

-- Trait of the Stormland increases the combat bonus of all units by 10% per DoF (Decleration of Friendship)

function StormLandsTrait( playerID )

    local player = Players[playerID];
    local civType = player:GetCivilizationType();
    local stormPromotionI = GameInfoTypes["PROMOTION_FURY_I"];
    local stormPromotionII = GameInfoTypes["PROMOTION_FURY_II"];
    local stormPromotionIII = GameInfoTypes["PROMOTION_FURY_III"];
    local stormPromotionIV = GameInfoTypes["PROMOTION_FURY_IV"];
    local stormPromotionV = GameInfoTypes["PROMOTION_FURY_V"];

    -- when the civ is stormlands, initiate bonus on all units
    if ( player:IsAlive() and civType == GameInfoTypes["CIVILIZATION_STORMLANDS"] ) then
        
        -- memory for the number of DoF's
        local numDoF = 0;

        -- for every player in game check if there is a DoF with that player
        for id, checkPlayer in pairs(Players) do
            if( checkPlayer:IsEverAlive() and checkPlayer:GetCivilizationShortDescription() ~= "The Stormlands" and checkPlayer:IsPlayable()) then
                if( player:IsDoF(id) ) then
                    print("You have a DoF with " .. checkPlayer:GetCivilizationShortDescription() .. "! (id: " .. id .. ")");
                    -- count number of DoF
                    numDoF = numDoF + 1;
                end
            end
        end

        -- give each unit the promotion by the number of DoF's
        for unit in player:Units() do

            -- On 0 DoF's strip all promotions
            if( numDoF < 1 ) then
                unit:SetHasPromotion(stormPromotionI, false);
                unit:SetHasPromotion(stormPromotionII, false);
                unit:SetHasPromotion(stormPromotionIII, false);
                unit:SetHasPromotion(stormPromotionIV, false);
                unit:SetHasPromotion(stormPromotionV, false);

            -- On 1 DoF get promotion I and strip the rest
            elseif( numDoF == 1 ) then
                unit:SetHasPromotion(stormPromotionI, true);
                unit:SetHasPromotion(stormPromotionII, false);
                unit:SetHasPromotion(stormPromotionIII, false);
                unit:SetHasPromotion(stormPromotionIV, false);
                unit:SetHasPromotion(stormPromotionV, false);

            -- On 2 DoF get promotion I and strip the rest
            elseif( numDoF == 2 ) then
                unit:SetHasPromotion(stormPromotionI, false);
                unit:SetHasPromotion(stormPromotionII, true);
                unit:SetHasPromotion(stormPromotionIII, false);
                unit:SetHasPromotion(stormPromotionIV, false);
                unit:SetHasPromotion(stormPromotionV, false);

            -- On 3 DoF get promotion I and strip the rest
            elseif( numDoF == 3 ) then
                unit:SetHasPromotion(stormPromotionI, false);
                unit:SetHasPromotion(stormPromotionII, false);
                unit:SetHasPromotion(stormPromotionIII, true);
                unit:SetHasPromotion(stormPromotionIV, false);
                unit:SetHasPromotion(stormPromotionV, false);

            -- On 4 DoF get promotion I and strip the rest
            elseif( numDoF == 4 ) then
                unit:SetHasPromotion(stormPromotionI, false);
                unit:SetHasPromotion(stormPromotionII, false);
                unit:SetHasPromotion(stormPromotionIII, false);
                unit:SetHasPromotion(stormPromotionIV, true);
                unit:SetHasPromotion(stormPromotionV, false);

            -- On 1 DoF get promotion I and strip the rest
            elseif( numDoF >= 5 ) then
                unit:SetHasPromotion(stormPromotionI, false);
                unit:SetHasPromotion(stormPromotionII, false);
                unit:SetHasPromotion(stormPromotionIII, false);
                unit:SetHasPromotion(stormPromotionIV, false);
                unit:SetHasPromotion(stormPromotionV, true);
            end -- end of elseif list

        end -- end of for unit

    end -- end of alive and civ check

end -- end of StormLandTrait

-- on turn start, call this method
GameEvents.PlayerDoTurn.Add( StormLandsTrait );