#include "missionMacros.h";

_unit = player;

if (!(isNil "blufor_hostage") && (_unit == blufor_hostage)) then {
	_unit execVM "prepHostage.sqf";
} else {
	_unit execVM "prepFightingUnit.sqf";
};

if (isClass(configFile >> "CfgWeapons" >> "ACE_EarPlugs")) then {
	_unit addItem "ACE_EarPlugs";
};