[
    {
        if (!isNil "ace_spectator_freeCamera") then {
            ace_spectator_camera = ace_spectator_freeCamera;
        };
    },
    5,
    []
] call CBA_fnc_addPerFrameHandler;
