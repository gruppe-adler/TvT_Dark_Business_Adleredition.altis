#include "missionMacros.h";

_unit = player;

if ("B_Pilot_F" == typeOf _unit) then {
	_unit execVM "prepHostage.sqf";
} else {
	_unit execVM "prepFightingUnit.sqf";
};

if (isClass(configFile >> "CfgWeapons" >> "ACE_EarPlugs")) then {
	_unit addItem "ACE_EarPlugs";
};