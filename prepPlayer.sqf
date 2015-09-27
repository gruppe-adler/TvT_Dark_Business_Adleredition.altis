#include "missionMacros.h";

_unit = player;

_handle = nil; // scope...
if ("B_Pilot_F" == typeOf _unit) then {
	_handle = _unit execVM "prepHostage.sqf";
} else {
	_handle = _unit execVM "prepFightingUnit.sqf";
};

waitUntil {isNull _handle};

_unit addItem "ACE_EarPlugs";
