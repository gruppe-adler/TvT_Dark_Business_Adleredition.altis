
if (side player != west) then {
	_classname = "NVGoggles";
	switch (side player) do {
		case east: { _classname = "NVGoggles_OPFOR"; };
		case resistance:  { _classname = "NVGoggles_INDEP"; };
	};

	player unassignItem _classname;
	player removeItem _classname;
};


player addPrimaryWeaponItem "acc_flashlight";
if (player == blufor_hostage) then {
	player execVM "prepHostage.sqf";
};
