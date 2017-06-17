DB_lighter = objNull;

_LighterToggle = {
    if (isNull DB_lighter) then {
        _light = "#lightpoint" createVehicle (getPos player); // TODO: is this global? if no, I'll need to do it on every machine. fugly.
        _light setLightBrightness 0.3;
        _light setLightAmbient [0.6, 0.45, 0.3];
        _light setLightColor [0.6, 0.5, 0.3];
        _light attachTo [player, [0.2, 0.5, 0.6]];
        _light setLightUseFlare true;
        _light setLightFlareSize 0.5;
        _light setLightFlareMaxDistance 500;
        _light setLightAttenuation [0.5, 2, 3, 0];

        DB_lighter = _light;
    } else {
        detach DB_lighter;
        deleteVehicle DB_lighter;
        DB_lighter = objNull;

    };
};
// alternatively: ACE_Chemlight_HiOrange
// Chemlight_Orange
[
    player,
    1,
    ["ACE_SelfActions"],
    (["GRAD_mission_lighterOn", "Toggle Lighter", "", _LighterToggle, {true}] call ace_interact_menu_fnc_createAction)
] call ace_interact_menu_fnc_addActionToObject;
