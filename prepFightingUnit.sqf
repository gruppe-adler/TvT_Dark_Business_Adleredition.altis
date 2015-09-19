#include "missionMacros.h";

_unit = _this;
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


_shouldGetUGL = (
 	(_unit isKindOf  "B_Soldier_TL_F") or
 	(_unit isKindOf  "B_Soldier_SL_F") or
 	(_unit isKindOf  "B_Officer_F") or
 	(_unit isKindOf  "O_Soldier_TL_F") or
 	(_unit isKindOf  "O_Soldier_SL_F") or
 	(_unit isKindOf  "O_Officer_F") or
 	(_unit isKindOf  "I_Soldier_TL_F") or
 	(_unit isKindOf  "I_Soldier_SL_F") or
 	(_unit isKindOf  "I_Officer_F")
);

_isMachinegunner = (
	(_unit isKindOf "B_Soldier_AR_F") or
	(_unit isKindOf "I_Soldier_AR_F") or
	(_unit isKindOf "O_Soldier_AR_F")
);



_additionalExecutable = {};

_primaryWeaponDefaultMagazines = "30Rnd_65x39_caseless_mag";
_addPrimaryMagazines = ["30Rnd_65x39_caseless_mag_Tracer", 7];

switch (_side) do {
	case WEST: {
		_primaryWeaponDefaultMagazines = "30Rnd_65x39_caseless_mag";
		_addPrimaryMagazines = ["30Rnd_65x39_caseless_mag_Tracer", 7];
		if (_isMachinegunner) then {
			_primaryWeaponDefaultMagazines = "100Rnd_65x39_caseless_mag";
			_addPrimaryMagazines = ["100Rnd_65x39_caseless_mag_Tracer", 4];
		};

		if (_shouldGetUGL) then {
			_additionalExecutable = {
				_unit addBackPack "B_TacticalPack_mcamo";
				_unit addMagazines ["UGL_FlareRed_F", 7];
				_unit addMagazines ["Chemlight_red", 5];
				_primaryWeapon = "arifle_MX_GL_F";
			};
		};
	};
	case RESISTANCE: {
		_primaryWeaponDefaultMagazines = "30Rnd_556x45_Stanag";
		_addPrimaryMagazines = ["30Rnd_556x45_Stanag_Tracer_Yellow", 7];
		if (_isMachinegunner) then {
			_primaryWeaponDefaultMagazines = "200Rnd_65x39_cased_Box";
			_addPrimaryMagazines = ["200Rnd_65x39_cased_Box_Tracer", 4];
		};

		if (_shouldGetUGL) then {
			_additionalExecutable = {
				_unit addBackPack "B_TacticalPack_rgr";
				_unit addMagazines ["UGL_FlareYellow_F", 7];
				_unit addMagazines ["Chemlight_green", 5];
				_primaryWeapon = "arifle_Mk20_GL_F";
			};
		};
	};
	case EAST: {
		_primaryWeaponDefaultMagazines = "30Rnd_65x39_caseless_green";
		_addPrimaryMagazines = ["30Rnd_65x39_caseless_green_mag_Tracer", 7];
		if (_isMachinegunner) then {
			_primaryWeaponDefaultMagazines = "150Rnd_762x54_Box";
			_addPrimaryMagazines = ["150Rnd_762x54_Box_Tracer", 4];
		};

		if (_shouldGetUGL) then {
			_additionalExecutable = {
				_unit addBackPack "B_TacticalPack_ocamo";
				_unit addMagazines ["UGL_FlareGreen_F", 7];
				_unit addMagazines ["Chemlight_yellow", 5];
				_primaryWeapon = "arifle_Katiba_GL_F";
			};
		};
	};
	default {
		debugLog("not one of the fihting sides? weirdo.");
	};
};

// remove stuff

_primaryWeapon = primaryWeapon _unit;
_unit removeWeapon _primaryWeapon;
_unit removeMagazines _primaryWeaponDefaultMagazines;
if (!ALLOW_40MM_HE) then {
	_unit removeMagazines "1Rnd_HE_Grenade_shell";
};
[] call _additionalExecutable;

// add stuff

_unit addMagazines _addPrimaryMagazines;
_unit addWeapon _primaryWeapon;
_unit addPrimaryWeaponItem "acc_flashlight";
_unit addItem "ACE_Flashlight_KSF1";

_unit addItem "ACE_fieldDressing";
_unit addItem "ACE_fieldDressing";
_unit addItem "ACE_fieldDressing";
_unit addItem "ACE_fieldDressing";
_unit addItem "ACE_fieldDressing";

if (isClass(configFile >> "CfgMagazines" >> "ACE_HandFlare_White")) then {
	if (_side != WEST) then {
		_unit addItem "ACE_HandFlare_White";
	};
};
