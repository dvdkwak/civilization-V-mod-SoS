-- MeereenTrait
-- Author: lihe, altered by Dvdkwak
-- DateCreated: 5/7/2021 12:05:23 PM
--------------------------------------------------------------
function CityCapturedNoResistance(hexPos, playerID, cityID, newPlayerID)
	local winner = Players[newPlayerID];

	if not IsMajorCiv(winner) then return 
	end

	local loser = Players[playerID];
	local pPlot = Map.GetPlot(ToGridFromHex(hexPos.x, hexPos.y));


	-- check if the plot has a city
	if pPlot:IsCity() then

		local pCity = pPlot:GetPlotCity();
		local winnerID = GameInfo.Leaders[winner:GetLeaderType()].ID;

		-- check if winner is Liu Bei
		if winnerID == GameInfo.Leaders["LEADER_DAENERYS_TARGARYEN"].ID and IsValidPlayer(winner) then

			-- check if the city is in resistance
			if pCity:IsResistance() then 

				-- change the resistance time
				pCity:ChangeResistanceTurns(-pCity:GetResistanceTurns());

				-- pay back the lost population
				iLostPop = math.floor(pCity:GetPopulation()/2) + 1;
				pCity:ChangePopulation(iLostPop, true);

				-- send a message to player
				local text = Locale.ConvertTextKey("TXT_KEY_CITY_LIBERATED");
				print("TEST: ", text, pCity:GetName(), "!");
				winner:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, pCity:GetName(), "!");

					-- give free courthouse to Liu Bei if Liu Bei choose to occupy the city
					if pCity:IsOccupied() then
					pCity:SetNumRealBuilding(GameInfoTypes["BUILDING_COURTHOUSE"], 1);
					
					end
			end
		end
	end
end
Events.SerialEventCityCaptured.Add( CityCapturedNoResistance );

function IsValidPlayer(player)
	return player ~= nil and player:IsAlive() and not player:IsBarbarian();
end


function IsMajorCiv(player)
	return IsValidPlayer(player) and player:GetID() <= GameDefines.MAX_MAJOR_CIVS-1;
end
