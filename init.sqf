#include "missionMacros.h"

DEBUG_MODE = ("DebugMode" call BIS_fnc_getParamValue) == 1;
VIRTUAL_ARSENAL_PLACEMENTS = ("VirtualArsenalPlacements" call BIS_fnc_getParamValue);
ALLOW_40MM_HE = ("Allow40MmHes" call BIS_fnc_getParamValue) == 1;
VICTORY_TIMEOUT = 900; // seconds
RE_EQUIP_TIME = 900; // how long should re-equipment be possible  after mission start?

disableRemoteSensors true;

 tf_no_auto_long_range_radio = true;
 tf_give_personal_radio_to_regular_soldier = false;

if (isServer) then {
	[] execVM "tfarSettings.sqf";
	[] execVM "prepAmmoBoxes.sqf";
	[] execVM "setAllSidesFriendly.sqf";
	[] execVM "victoryHints.sqf";
	["Initialize", [true]] call BIS_fnc_dynamicGroups;

};

if (hasInterface) then {
	waitUntil {!isNull player};
	enableSentences false;
	[] execVM "prepPlayer.sqf";
	[] execVM "addBriefing.sqf";
	[] execVM "addArsenal.sqf";
	[] execVM "player\loadoutAction.sqf";
	["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups;
};
