#include "..\missionMacros.h"

_player = param [0];
_side = param [1];
_taskState = param [2];

if (_taskState == "SUCCEEDED" && (_side in VICTORY_CLAIMS)) exitWith {
    _msg =  "victory already claimed for " + (str _side);
    adminLog(_msg);
    [_msg] remoteExec ["hint", _player, true];
};

_mainObjectiveState = 'CREATED';
switch (_side) do {
    case WEST: {_mainObjectiveState = OBJECTIVE_STATE_BLUFOR};
    case RESISTANCE: {_mainObjectiveState = OBJECTIVE_STATE_IND};
    case EAST: {_mainObjectiveState = OBJECTIVE_STATE_OPFOR};
};

if (_mainObjectiveState != _taskState) exitWith {
    ['the server disagrees.'] remoteExec ["hint", _player, true];
};

if (_taskState == "SUCCEEDED") then {
    VICTORY_CLAIMS pushBackUnique _side;
    publicVariable "VICTORY_CLAIMS";
};
if (_taskState == "FAILED") then {
    DEFEAT_CLAIMS pushBackUnique _side;
    publicVariable "DEFEAT_CLAIMS";
};

_allClaims = DEFEAT_CLAIMS + VICTORY_CLAIMS;
_allClaimsUnique = _allClaims arrayIntersect [BLUFOR, INDEPENDENT, OPFOR];
if (count _allClaimsUnique == 3) then {
    [DB_endMission, [], 10] call CBA_fnc_waitAndExecute; // all accounted for!
};


[[_side], "player\outcomeClaimed.sqf"] remoteExec ["execVM", _side, true];

switch (_side) do {
    case RESISTANCE: {opfor_munitions_truck setPos [0, 0]};
};
