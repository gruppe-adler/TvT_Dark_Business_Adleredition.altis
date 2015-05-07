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


if (_unit isKindOf  "B_Soldier_SL_F") then {
	_unit removeWeapon (primaryWeapon _unit);
	_unit addWeapon "arifle_MX_GL_F";
	_unit addBackPack "B_TacticalPack_mcamo";
	_unit addMagazines ["Chemlight_red", 5];
};
if (_unit isKindOf  "O_Soldier_SL_F") then {
	_unit removeWeapon (primaryWeapon _unit);
	_unit addWeapon "arifle_Katiba_GL_F";
	_unit addBackPack "B_TacticalPack_ocamo";
	_unit addMagazines ["UGL_FlareGreen_F", 10];
	_unit addMagazines ["Chemlight_yellow", 5];
};
if (_unit isKindOf  "I_Soldier_SL_F") then {
	_unit removeWeapon (primaryWeapon _unit);
	_unit addWeapon "arifle_Mk20_GL_F";
	_unit addBackPack "B_TacticalPack_rgr";
	_unit addMagazines ["UGL_FlareGreen_F", 10];
	_unit addMagazines ["Chemlight_green", 5];
};



_unit addPrimaryWeaponItem "acc_flashlight";

if (!(isNil "blufor_hostage")) then {
	if (_unit == blufor_hostage) then {
		_unit execVM "prepHostage.sqf";
	};
};
