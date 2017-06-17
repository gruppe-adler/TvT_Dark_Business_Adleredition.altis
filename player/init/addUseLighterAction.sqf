DB_lighter = objNull;

_lighterToggle = {
    _unit = player;
    _light = _unit getVariable ["DB_lighter", objNull];
    _newState = false;
    if (isNull _light) then { _newState = true; };

    [_unit, _newState] remoteExec ["DB_lighterSwitch", 0, true];
};
// alternatively: ACE_Chemlight_HiOrange
// Chemlight_Orange
[
    player,
    1,
    ["ACE_SelfActions"],
    (["GRAD_mission_lighterOn", "Toggle Lighter", "", _lighterToggle, {true}] call ace_interact_menu_fnc_createAction)
] call ace_interact_menu_fnc_addActionToObject;
