-- Lua Script1
-- Author: dvdkwak
-- DateCreated: 5/7/2021 11:06:36 PM
--------------------------------------------------------------

-- Trait of the Stormland increases the combat bonus of all units by 10% per DoF (Decleration of Friendship)

function StormLandsTrait( playerID )

    local player = Players[playerID];

    print("this is a test");
    print("CURRENT CIV: " .. player:GetCivilizationType());

end -- end of StormLandTrait

-- on turn start, call this method
GameEvents.PlayerDoTurn.add( StormLandsTrait );