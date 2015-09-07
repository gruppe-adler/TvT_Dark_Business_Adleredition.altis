#include "missionMacros.h"

DEBUG_MODE = (paramsArray select 0) == 1;
VIRTUAL_ARSENAL_PLACEMENTS = (paramsArray select 1);
ALLOW_40MM_HE = (paramsArray select 2) == 1;



if (isServer) then {
	execVM "tfarSettings.sqf";
	execVM "prepAmmoBoxes.sqf";
	execVM "spreadLove.sqf"; // so the hostage can board all vehicles. also, nice for testing.

	blufor_hemtt setVehicleLock "LOCKED";
	blufor_heli addEventHandler [
		"Killed", 
		{ 
			adminLog("Dark Business: BLUFOR Helicopter destroyed. Unlocking HEMTT...");
			blufor_hemtt setVehicleLock "UNLOCKED";
		}
	];

};

if (!isDedicated) then {
	waitUntil {!isNull player};

	[] execVM "CSSA3\CSSA3_init.sqf";
	execVM "prepPlayer.sqf";
	execVM "addBriefing.sqf";
	execVM "keepLove.sqf";
	execVM "addArsenal.sqf";
};
