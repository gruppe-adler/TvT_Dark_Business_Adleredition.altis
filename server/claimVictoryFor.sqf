_player = param [0];
_side = param [1];

if (_side in VICTORY_CLAIMS) exitWith {
    diag_log "victory already claimed for " + (str _side);
};

_mainObjectiveState = 'CREATED';
switch (_side) do {
    case WEST: {_mainObjectiveState = OBJECTIVE_STATE_BLUFOR};
    case RESISTANCE: {_mainObjectiveState = OBJECTIVE_STATE_IND};
    case EAST: {_mainObjectiveState = OBJECTIVE_STATE_OPFOR};
};

if (_mainObjectiveState != 'SUCCEEDED') exitWith {
    ['the server disagrees'] remoteExec ["hint", _player, true];
};


VICTORY_CLAIMS pushBack _side;
publicVariable 'VICTORY_CLAIMS';

[[_side], "player\youWin.sqf"] remoteExec ["execVM", _side, true];

switch (_side) do {
    case RESISTANCE: opfor_munitions_truck setPos [0, 0];
};
