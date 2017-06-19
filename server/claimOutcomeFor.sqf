#include "..\missionMacros.h"

_player = param [0];
_side = param [1];
_minObjectiveState = param [2];

_msg = format ["%1 is trying to claim status %3 for %2", _player, _minObjectiveState, _side];
adminLog(_msg);

if (_minObjectiveState > 0 && (_side in VICTORY_CLAIMS)) exitWith {
    _msg =  "...but: victory already claimed for " + (str _side);
    adminLog(_msg);
    [_msg] remoteExec ["hint", _player, true];
};

_serverObjectiveState = 0;
switch (_side) do {
    case WEST: {_serverObjectiveState = OBJECTIVE_STATE_BLUFOR};
    case RESISTANCE: {_serverObjectiveState = OBJECTIVE_STATE_IND};
    case EAST: {_serverObjectiveState = OBJECTIVE_STATE_OPFOR};
};

if (_minObjectiveState > _serverObjectiveState) exitWith {
    _msg = format["...but: we disagree, objectiveState is only %1 ", _serverObjectiveState];
    adminLog(_msg);
    ['the server disagrees.'] remoteExec ["hint", _player, true];
};

adminLog("...server accepts the claim");

if (_minObjectiveState >= -1) then {
    VICTORY_CLAIMS pushBackUnique _side;
    publicVariable "VICTORY_CLAIMS";
};
if (_minObjectiveState < -1) then {
    DEFEAT_CLAIMS pushBackUnique _side;
    publicVariable "DEFEAT_CLAIMS";
};

_msg = format ["new global claim status established. victory: %1, defeat: %2", VICTORY_CLAIMS, DEFEAT_CLAIMS];
adminLog(_msg);

_allClaims = DEFEAT_CLAIMS + VICTORY_CLAIMS;
_allClaimsUnique = _allClaims arrayIntersect [BLUFOR, INDEPENDENT, OPFOR];
if ((count _allClaimsUnique) == 3) then {
    adminLog("all sides claimed a result. ending mission in 10s...");
    [DB_endMission, [], 10] call CBA_fnc_waitAndExecute; // all accounted for!
};


[[_side, _minObjectiveState], "player\outcomeClaimed.sqf"] remoteExec ["execVM", _side, true];

switch (_side) do {
    case RESISTANCE: {opfor_munitions_truck setPos [0, 0]};
    case OPFOR: {
        if (_minObjectiveState == 2) then {
            [[_side, _minObjectiveState], "player\outcomeClaimed.sqf"] remoteExec ["execVM", blufor_hostage, true];
        };
    };
};
