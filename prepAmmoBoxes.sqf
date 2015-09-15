// prepAmmoBoxes.sqf

removeMagazinesCargoGlobal = {
	_crate = _this select 0;
	_magazineName = _this select 1;

	_blah = getMagazineCargo _crate;
	_magazineNames = (_blah select 0);
	_magazineCounts = (_blah select 1);
	clearMagazineCargoGlobal _crate;
	{
		if (_x != _magazineName) then {
			_count = _magazineCounts select _forEachIndex;
			_crate addMagazineCargoGlobal [_x, _count];
		};
	} forEach _magazineNames;
};

//------------------------------------------------------

if (!ALLOW_40MM_HE) then {
	{
		[_x, "1Rnd_HE_Grenade_shell"] call removeMagazinesCargoGlobal;
	} forEach [blufor_munitions, opfor_munitions, ind_munitions, opfor_ifrit];

	[blufor_munitions, "3Rnd_HE_Grenade_shell"] call removeMagazinesCargoGlobal;
};

clearBackpackCargoGlobal blufor_heli;


fillBackpacks = {

	_arsenal = _this select 0;
	_cargoplox = _this select 1;

	{
		_backpack = firstBackpack _x;
		if (_backpack isKindOf "Bag_Base") then {
			{
				_backpack addItemCargoGlobal _x;
			} forEach _cargoplox;
		};
	} forEach nearestObjects [_arsenal, ["weaponholder"], 50];
};


[
	blufor_arsenal,
	[
		["30Rnd_65x39_caseless_mag_Tracer", 10],
		["100Rnd_65x39_caseless_mag_Tracer", 4]
	]
] call fillBackpacks;

[
	ind_arsenal,
	[
		["30Rnd_556x45_Stanag_Tracer_Yellow", 10],
		["200Rnd_65x39_cased_Box_Tracer", 3],
		["ACE_200Rnd_65x39_cased_Box_Tracer_Dim", 1]
	]
] call fillBackpacks;



[
	opfor_arsenal, [
		["30Rnd_65x39_caseless_green_mag_Tracer", 10],
		["150Rnd_762x54_Box_Tracer", 4]
	]
] call fillBackpacks;
