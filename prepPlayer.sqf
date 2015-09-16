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

if (!ALLOW_40MM_HE) then {
	_unit removeMagazines "1Rnd_HE_Grenade_shell";
};

if ((_unit isKindOf  "B_Soldier_TL_F") or (_unit isKindOf  "B_Soldier_SL_F") or (_unit isKindOf  "B_Officer_F")) then {
	_unit removeWeapon (primaryWeapon _unit);
	_unit addWeapon "arifle_MX_GL_F";
	_unit addBackPack "B_TacticalPack_mcamo";
	_unit addMagazines ["Chemlight_red", 5];
};
if ((_unit isKindOf  "O_Soldier_TL_F") or (_unit isKindOf  "O_Soldier_SL_F") or (_unit isKindOf  "O_Officer_F")) then {
	_unit removeWeapon (primaryWeapon _unit);
	_unit addWeapon "arifle_Katiba_GL_F";
	_unit addBackPack "B_TacticalPack_ocamo";
	_unit addMagazines ["UGL_FlareGreen_F", 10];
	_unit addMagazines ["Chemlight_yellow", 5];
	_unit addMagazines ["30Rnd_65x39_caseless_green_mag_Tracer", 5];
};
if ((_unit isKindOf  "I_Soldier_TL_F") or (_unit isKindOf  "I_Soldier_SL_F") or (_unit isKindOf  "I_Officer_F")) then {
	_unit removeWeapon (primaryWeapon _unit);
	_unit addWeapon "arifle_Mk20_GL_F";
	_unit addBackPack "B_TacticalPack_rgr";
	_unit addMagazines ["UGL_FlareYellow_F", 10];
	_unit addMagazines ["Chemlight_green", 5];
	_unit addMagazines ["30Rnd_556x45_Stanag_Tracer_Yellow", 5];
};

_unit addPrimaryWeaponItem "acc_flashlight";

if (isClass(configFile >> "CfgWeapons" >> "ACE_EarPlugs")) then {
	_unit addItem "ACE_EarPlugs";
};


if (isClass(configFile >> "CfgMagazines" >> "ACE_HandFlare_White")) then {
	if ((side player) != WEST) then {
	_unit addItem "ACE_HandFlare_White";
	};
};

if (!(isNil "blufor_hostage") && (_unit == blufor_hostage)) then {
	_unit execVM "prepHostage.sqf";
} else {
	_unit addItem "ACE_personalAidKit";
	_unit addItem "ACE_personalAidKit";
	_unit addItem "ACE_personalAidKit";
	_unit addItem "ACE_personalAidKit";
	_unit addItem "ACE_personalAidKit";
};
