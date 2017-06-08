_playerPos = getPosATL player;

[player, true] call ace_spectator_fnc_stageSpectator;
[true] call ace_spectator_fnc_setSpectator;

if (isClass (configFile >> "CfgPatches" >> "task_force_radio")) then {
    [player, true] call TFAR_fnc_forceSpectator;
};


[nil, nil, nil, _playerPos] call ace_spectator_fnc_setCameraAttributes;
