#include "missionMacros.h";

_unit = player;

_unit addEventhandler ["HandleRating", {0}]; // prevent geting labeled as ROGUE when killing enemies (which are 'friendly' here)

_unit addEventHandler ["InventoryOpened", {
    params ["_unit", "_container"];

    _vehicle = vehicle player;
    _preventOpening = false;

    if (side _vehicle != side player) then {
        _preventOpening = true;
        hint format ["Can't access %1, I'm being watched here", _container];
    };

    _preventOpening

}];


if ("B_Pilot_F" == typeOf _unit) then {
	_unit execVM "prepHostage.sqf";
} else {
	_unit execVM "prepFightingUnit.sqf";
};
