#include "missionMacros.h";

_unit = player;

_unit addEventhandler ["HandleRating", {0}]; // prevent geting labeled as ROGUE when killing enemies (which are 'friendly' here)

if ("B_Pilot_F" == typeOf _unit) then {
	_unit execVM "prepHostage.sqf";
} else {
	_unit execVM "prepFightingUnit.sqf";
};
