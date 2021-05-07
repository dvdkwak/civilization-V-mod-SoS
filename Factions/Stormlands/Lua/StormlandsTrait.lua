-- Lua Script1
-- Author: dvdkwak
-- DateCreated: 5/7/2021 11:06:36 PM
--------------------------------------------------------------

-- Trait of the Stormland increases the combat bonus of all units by 10% per DoF (Decleration of Friendship)

function StormLandsTrait( playerID )

    local player = Players[playerID];
    local civType = player:GetCivilizationType();

    if ( civType == GameInfoTypes["CIVILIZATION_STORMLANDS"] ) then
        print("TEST: YOU SHOULD GET A COMBAT BONUS FOR EVERY UNIT");
    end

end -- end of StormLandTrait

-- on turn start, call this method
GameEvents.PlayerDoTurn.Add( StormLandsTrait );