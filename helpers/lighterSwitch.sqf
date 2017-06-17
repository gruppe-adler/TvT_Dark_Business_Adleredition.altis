DB_lighterSwitch = {
    _unit = param [0, objNull];
    _newState = param [1, false];

    _light = _unit getVariable ["DB_lighter", objNull];

    // first remove it...
    if (!(isNull _light)) then {
        detach _light;
        deleteVehicle _light;
        _unit setVariable ["DB_lighter", objNull];
    };

    // ... then add if necessary
    if (!_newState) exitWith {true};

    _light = "#lightpoint" createVehicleLocal (getPos _unit);
    _light setLightBrightness 0.3;
    _light setLightAmbient [0.6, 0.45, 0.3];
    _light setLightColor [0.6, 0.5, 0.3];
    _light setLightUseFlare true;
    _light setLightFlareSize 0.3;
    _light setLightFlareMaxDistance 500;
    _light setLightAttenuation [0.5, 2, 3, 0];
    _light attachTo [_unit, [0.2, 0.4, 1.6]];

    _unit setVariable ["DB_lighter", _light];

};
