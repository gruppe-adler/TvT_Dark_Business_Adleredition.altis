_wrapIntoBodyBag = {
    // _target -- corpse
    _position = getPos _target;
    _bodyBag = "ACE_BodyBagObject" createVehicle _position;
    if (blufor_hostage == _target) then {
        blufor_hostage = _bodyBag;
        publicVariable "blufor_hostage"; // TODO this is brutal. test test test
    };
    //deleteVehicle _target; // cabnnot delete player unit, soooo just move it
    _target setPos [0, 0];

};

[
    "B_Pilot_F",
    0,
    ["ACE_MainActions"],
    (["GRAD_mission_bodyBag", "Wrap in body bag", "", _wrapIntoBodyBag, {!(alive _target)}] call ace_interact_menu_fnc_createAction)
] call ace_interact_menu_fnc_addActionToClass;
