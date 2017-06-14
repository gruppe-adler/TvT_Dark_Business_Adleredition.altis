#include "missionMacros.h"

DEBUG_MODE = ("DebugMode" call BIS_fnc_getParamValue) == 1; DEBUG_MODE = true;
VIRTUAL_ARSENAL_PLACEMENTS = ("VirtualArsenalPlacements" call BIS_fnc_getParamValue);
VICTORY_TIMEOUT = 900; // seconds
RE_EQUIP_TIME = 900; // how long should re-equipment be possible after mission start?

disableRemoteSensors true;

 tf_no_auto_long_range_radio = true;
 tf_give_personal_radio_to_regular_soldier = false;

if (isServer) then {
    [] execVM "server\init\tfarSettings.sqf";
    [] execVM "server\init\prepAmmoBoxes.sqf";
    [] execVM "server\init\setAllSidesFriendly.sqf";
    [] execVM "server\init\victoryHints.sqf";
    [] execVM "server\init\makeUnitsEditableForZeus.sqf";

    ["Initialize", [true]] call BIS_fnc_dynamicGroups;

    [] execVM "helpers\removeInventory.sqf";

};

if (hasInterface) then {
    waitUntil {!isNull player};
    enableSentences false;

    if (side player == civilian) then { // spectators

        [{
            [] execVM "player\moveToSpec.sqf";
        }, [], 15] call CBA_fnc_waitAndExecute;


    } else  {
        [] execVM "player\prepPlayer.sqf";
        [] execVM "player\addBriefing.sqf";
        [] execVM "player\addArsenal.sqf";
        [] execVM "player\loadoutAction.sqf";
        [] execVM "player\moveToSpecAction.sqf";
        [] execVM "player\addClaimVictoryAction.sqf";

        [] execVM "helpers\patchAceCommonSpectatorCheck.sqf";

        ["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups;
    };
};
