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
    local stormPromotionIII = GameInfoTypes["PROMOTION_FURY_III"];

    -- when the civ is stormlands, initiate bonus on all units
    if ( player:IsAlive() and civType == GameInfoTypes["CIVILIZATION_STORMLANDS"] ) then
        for unit in player:Units() do

            -- if the unit has promotion 2, give it promotion 3 (TEST)
            if ( unit:IsHasPromotion(stormPromotionII) ) then
                unit:SetHasPromotion(stormPromotionI, false);
                unit:SetHasPromotion(stormPromotionII, false);
                unit:SetHasPromotion(stormPromotionIII, true);

                print("Unit should have gained the stormPromotionIII");
            end

            -- if the unit has promotion 1, give it promotion 2 (TEST)
            if ( unit:IsHasPromotion(stormPromotionI) ) then
                unit:SetHasPromotion(stormPromotionI, false);
                unit:SetHasPromotion(stormPromotionII, true);
                unit:SetHasPromotion(stormPromotionIII, false);

                print("Unit should have gained the stormPromotionII");
            end

            -- if the unit has not a promotion yet, we grand it (no decleration of friendship check yet)
            if ( not unit:IsHasPromotion(stormPromotionI) ) then
                unit:SetHasPromotion(stormPromotionI, true);
                unit:SetHasPromotion(stormPromotionII, false);
                unit:SetHasPromotion(stormPromotionIII, false);

                print("Unit should have gained the stormPromotionI");
            end

        end -- end of for unit
    end

end -- end of StormLandTrait

-- on turn start, call this method
GameEvents.PlayerDoTurn.Add( StormLandsTrait );