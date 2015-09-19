#include "missionMacros.h";

_unit = player;

if ("B_Pilot_F" == typeOf _unit) then {
	_nil = _unit execVM "prepHostage.sqf";
} else {
	_nil = _unit execVM "prepFightingUnit.sqf";
};

_unit addItem "ACE_EarPlugs";
