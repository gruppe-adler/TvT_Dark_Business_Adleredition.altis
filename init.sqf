#include "missionMacros.h"

DEBUG_MODE = (["DebugMode", 1] call BIS_fnc_getParamValue) == 1;
VIRTUAL_ARSENAL_PLACEMENTS = ("VirtualArsenalPlacements" call BIS_fnc_getParamValue);
RE_EQUIP_TIME = 900; // how long should re-equipment be possible after mission start?

disableRemoteSensors true;

 tf_no_auto_long_range_radio = true;
 tf_give_personal_radio_to_regular_soldier = false;

[] execVM "helpers\lighterSwitch.sqf";

if (isServer) then {
    [] execVM "server\init\tfarSettings.sqf";
    [] execVM "server\init\prepAmmoBoxes.sqf";
    [] execVM "server\init\setAllSidesFriendly.sqf";
    [] execVM "server\init\victoryHints.sqf";
    [] execVM "server\init\makeUnitsEditableForZeus.sqf";
    [] execVM "server\init\handleHostageDisconnect.sqf";

    ["Initialize", [true]] call BIS_fnc_dynamicGroups;

    [] execVM "helpers\removeInventory.sqf";
};

if (hasInterface) then {
    waitUntil {!isNull player};
    enableSentences false;
    DB_playerIsDead = false;
    [] execVM "helpers\patchAceCommonSpectatorCheck.sqf";

    if (playerSide == CIVILIAN) then { // spectators

        [{
            [] execVM "player\moveToSpec.sqf";
        }, [], 15] call CBA_fnc_waitAndExecute;

    } else  {
        [] execVM "player\init\playerVictoryVarName.sqf";
        [] execVM "player\init\addBodyBagAction.sqf";
        [] execVM "player\init\checkOutOfArea.sqf";
        [] execVM "player\prepPlayer.sqf";
        [] execVM "player\addBriefing.sqf";
        [] execVM "player\addArsenal.sqf";
        [] execVM "player\loadoutAction.sqf";
        [] execVM "player\moveToSpecAction.sqf";
        [] execVM "player\init\addClaimOutcomeAction.sqf";

        ["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups;
    };
};
