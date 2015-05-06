#include "missionMacros.h";

_unit = player;

_side = side _unit;
_isNvgNotAllowed = (_side != west);

if (_isNvgNotAllowed) then {
	debugLog("removing NVG...");
	_classname = "NVGoggles";
	switch (_side) do {
		case east: { _classname = "NVGoggles_OPFOR"; };
		case resistance:  { _classname = "NVGoggles_INDEP"; };
	};

	_unit unassignItem _classname;
	_unit removeItem _classname;
} else {
	_unit additem "NVGoggles";
	_unit assignitem "NVGoggles";
};

_unit addPrimaryWeaponItem "acc_flashlight";

if (!(isNil "blufor_hostage")) then {
	if (_unit == blufor_hostage) then {
		_unit execVM "prepHostage.sqf";
	};
};
