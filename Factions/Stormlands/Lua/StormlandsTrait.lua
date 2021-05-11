-- Lua Script1
-- Author: dvdkwak
-- DateCreated: 5/7/2021 11:06:36 PM
--------------------------------------------------------------

-- Trait of the Stormland increases the combat bonus of all units by 10% per DoF (Decleration of Friendship)

-- this is the next update on the stormlands civilization in it's own branch!

function StormLandsTrait( playerID )

    local player = Players[playerID];
    local civType = player:GetCivilizationType();
    local stormPromotionI = GameInfoTypes["PROMOTION_FURY_I"];
    local stormPromotionII = GameInfoTypes["PROMOTION_FURY_II"];

    -- when the civ is stormlands, initiate bonus on all units
    if ( player:IsAlive() and civType == GameInfoTypes["CIVILIZATION_STORMLANDS"] ) then
        if ( Locale.ConvertTextKey("DEBUG_MODE") ) then
            print("TEST: YOU SHOULD GET A COMBAT BONUS FOR EVERY UNIT");
        end
        for unit in player:Units() do
            if ( Locale.ConvertTextKey("DEBUG_MODE") ) then
                print("TEST UNIT: " .. unit:GetID());
            end
            
            -- if the unit has not a promotion yet, we grand it (no decleration of friendship check yet)
            if ( not unit:IsHasPromotion(stormPromotionI) ) then
                unit:SetHasPromotion(stormPromotionI, true);
                print("TEST PROMOTION GIVEN: UNIT SHOULD HAVE BEEN GRANTED PROMOTION_FURY_I");
            end

            -- if the unit has promotion 1, give it promotion 2 (TEST)
            if ( unit:IsHasPromotion(stormPromotionI) ) then
                unit:SetHasPromotion(stormPromotionII, true);
            end
        end
    end

end -- end of StormLandTrait

-- on turn start, call this method
GameEvents.PlayerDoTurn.Add( StormLandsTrait );