_unit = _this select 0;

diag_log format ["onPlayerRespawn for %1", name _unit];

if (side _unit != west) then {
	_classname = "NVGoggles";
	switch (side _unit) do {
		case east: { _classname = "NVGoggles_OPFOR"; };
		case resistance:  { _classname = "NVGoggles_INDEP"; };
	};

	_unit unassignItem _classname;
	_unit removeItem _classname;
};

_unit addPrimaryWeaponItem "acc_flashlight";

if (!(isNil "blufor_hostage")) then {
	if (_unit == blufor_hostage) then {
		_unit execVM "prepHostage.sqf";
	};
};
