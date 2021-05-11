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

    -- when the civ is stormlands, initiate bonus on all units
    if ( player:IsAlive() and civType == GameInfoTypes["CIVILIZATION_STORMLANDS"] ) then

        -- calculate number of DoF of the player
        -- for key, value in ipairs(Players) do
        --     print("I am a line representing a player " .. test);
        --     -- print("Player with ID: " .. test:GetID() .. " is in the game");
        -- end

        a = {"one", "two", "three"};
        for key, value in a
            print("KEY: " .. key .. " | VALUE: " .. value);
        end


        for unit in player:Units() do

            -- if the unit has promotion 2, give it promotion 3 (TEST)
            if ( unit:IsHasPromotion(stormPromotionII) ) then
                unit:SetHasPromotion(stormPromotionI, false);
                unit:SetHasPromotion(stormPromotionII, false);
                unit:SetHasPromotion(stormPromotionIII, true);

                print("Unit should have gained the stormPromotionIII");

            -- if the unit has promotion 1, give it promotion 2 (TEST)
            elseif ( unit:IsHasPromotion(stormPromotionI) ) then
                unit:SetHasPromotion(stormPromotionI, false);
                unit:SetHasPromotion(stormPromotionII, true);
                unit:SetHasPromotion(stormPromotionIII, false);

                print("Unit should have gained the stormPromotionII");

            -- if the unit has not a promotion yet, we grand it (no decleration of friendship check yet)
            elseif ( not unit:IsHasPromotion(stormPromotionI) ) then
                unit:SetHasPromotion(stormPromotionI, true);
                unit:SetHasPromotion(stormPromotionII, false);
                unit:SetHasPromotion(stormPromotionIII, false);

                print("Unit should have gained the stormPromotionI");
            end

        end -- end of for unit

    end -- end of alive and civ check

end -- end of StormLandTrait

-- on turn start, call this method
GameEvents.PlayerDoTurn.Add( StormLandsTrait );