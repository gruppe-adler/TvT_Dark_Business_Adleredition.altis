#include "missionMacros.h";

ensureBinoculars = {
	_unit = _this;
	if ("Binocular" in (items _unit)) then {
			_unit removeWeapon "Binocular";
	};
	_unit addWeapon "Binocular";
};

addItems = {
	_unit = _this select 0;
	_classname = _this select 1;
	_count = _this select 2;
	for "_i" from 1 to _count do {
		_unit addItem _classname;
	};
};

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

_rank = rank _unit;
if ((_rank == "PRIVATE") or (_rank == "CORPORAL")) then {
	debugLog("ranking lower than sergeant - trying to remove gps...");
	if ("ItemGPS" in (assignedItems _unit)) then {
		debugLog("unassigning gps...");
		_unit unassignItem "ItemGPS";
	};
	if ("ItemGPS" in (items _unit)) then {
		debugLog("rewmoving gps...");
		_unit removeItem "ItemGPS";
	};
} else {
	debugLog("making sure unit has GPS...");
	if (!("ItemGPS" in (assignedItems _unit))) then {
		if (!("ItemGPS" in (items _unit))) then {
			debugLog("adding gps...");
			_unit addItem "ItemGPS";
		};
		debugLog("assigning gps...");
		_unit assignItem "ItemGPS";
	};
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

_isHeliPilot = ("B_Helipilot_F" == typeof _unit);

_vest = vest _unit;
_uniform = uniform _unit;
_backpack = backpack _unit;
if (_rank == "LIEUTENANT" || _rank == "CAPTAIN") then { // make sure to give everyone from 2nd in cmd upwards a LR radio
	switch (playerSide) do {
		case west: {_backpack = TF_defaultWestBackpack;};
		case resistance: {_backpack = TF_defaultGuerBackpack;};
		case east: {_backpack = TF_defaultEastBackpack;};
		default {_backpack = ""};
	};
};

_additionalExecutable = {};

_primaryWeaponDefaultMagazines = "30Rnd_65x39_caseless_mag";
_addPrimaryMagazineType = "30Rnd_65x39_caseless_mag_Tracer";
_addPrimaryMagazineCount = 7;

// remove stuff

_primaryWeapon = primaryWeapon _unit;
_unit removeWeapon _primaryWeapon;
removeUniform _unit;
removeVest _unit;
if (_backpack != "") then {
	removeBackpack _unit;
};

_unit addUniform _uniform;
_unit addVest _vest;
if (_backpack != "") then {
	_unit addBackpack _backpack;
};

switch (playerSide) do {
	case WEST: {
		_primaryWeaponDefaultMagazines = "30Rnd_65x39_caseless_mag";
		_addPrimaryMagazineType = "30Rnd_65x39_caseless_mag_Tracer";
		_addPrimaryMagazineCount = 11;
		if (_isMachinegunner) then {
			_primaryWeaponDefaultMagazines = "100Rnd_65x39_caseless_mag";
			_addPrimaryMagazineType = "100Rnd_65x39_caseless_mag_Tracer";
			 _addPrimaryMagazineCount = 4;
		};
		if (_isHeliPilot) then {
			_primaryWeaponDefaultMagazines = "30Rnd_45ACP_Mag_SMG_01";
			_addPrimaryMagazineType = "30Rnd_45ACP_Mag_SMG_01_tracer_green";
			_addPrimaryMagazineCount = 5;
		};

		if (_shouldGetUGL) then {
			_unit call ensureBinoculars;
			_unit addMagazines ["UGL_FlareRed_F", 7];
			_unit addMagazines ["Chemlight_red", 1];
			_addPrimaryMagazineCount = 6;
			_primaryWeapon = "arifle_MX_GL_F";
			_unit addItem "SmokeShell";
			_unit addItem "B_IR_Grenade";
		};
		if (!_isMachinegunner && !_isHeliPilot && !_shouldGetUGL) then {
			_unit addItem "SmokeShell";
			[_unit, "HandGrenade", 3] call addItems;
		};
		_unit addItem "SmokeShellRed";
	};
	case RESISTANCE: {
		_primaryWeaponDefaultMagazines = "30Rnd_556x45_Stanag";
		_addPrimaryMagazineType = "30Rnd_556x45_Stanag_Tracer_Yellow";
		_addPrimaryMagazineCount = 11;
		if (_isMachinegunner) then {
			_primaryWeaponDefaultMagazines = "200Rnd_65x39_cased_Box";
			_addPrimaryMagazineType = "200Rnd_65x39_cased_Box_Tracer";
			_addPrimaryMagazineCount = 4;
		};

		if (_shouldGetUGL) then {
			_unit call ensureBinoculars;
			_unit addMagazines ["UGL_FlareYellow_F", 7];
			_unit addMagazines ["Chemlight_green", 1];
			_addPrimaryMagazineCount = 6;
			_primaryWeapon = "arifle_Mk20_GL_F";
			_unit addItem "SmokeShell";
		};
		if (!_isMachinegunner && !_isHeliPilot && !_shouldGetUGL) then {
			_unit addItem "SmokeShell";
			[_unit, "HandGrenade", 3] call addItems;
		};
		_unit addItem "SmokeShellYellow";
	};
	case EAST: {
		_primaryWeaponDefaultMagazines = "30Rnd_65x39_caseless_green";
		_addPrimaryMagazineType = "30Rnd_65x39_caseless_green_mag_Tracer";
		_addPrimaryMagazineCount = 11;
		if (_isMachinegunner) then {
			_primaryWeaponDefaultMagazines = "150Rnd_762x54_Box";
			_addPrimaryMagazineType = "150Rnd_762x54_Box_Tracer";
			_addPrimaryMagazineCount = 4;
		};

		if (_shouldGetUGL) then {
			_unit call ensureBinoculars;
			_unit addMagazines ["UGL_FlareGreen_F", 7];
			_unit addMagazines ["Chemlight_yellow", 1];
			_addPrimaryMagazineCount = 6;
			_primaryWeapon = "arifle_Katiba_GL_F";
			_unit addItem "SmokeShell";
		};
		if (!_isMachinegunner && !_isHeliPilot && !_shouldGetUGL) then {
			_unit addItem "SmokeShell";
			[_unit, "HandGrenade", 3] call addItems;
		};
		_unit addItem "SmokeShellGreen";
	};
	default {
		debugLog("not one of the fighting sides? weirdo.");
	};
};


_unit addMagazines [_addPrimaryMagazineType, _addPrimaryMagazineCount];
_unit addWeapon _primaryWeapon;

_unit addPrimaryWeaponItem "acc_flashlight";
_unit addItem "ACE_Flashlight_KSF1";
_unit addItem "ACE_morphine";
[_unit, "ACE_fieldDressing", 5] call addItems;


if (isClass(configFile >> "CfgMagazines" >> "ACE_HandFlare_White")) then {
	if (_side != WEST) then {
		_unit addItem "ACE_HandFlare_White";
	};
};

