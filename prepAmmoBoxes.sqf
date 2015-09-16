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
	} forEach [opfor_ifrit];
};

clearBackpackCargoGlobal blufor_heli;


fillCarryAlls = {

	_arsenal = _this select 0;
	_cargoplox = _this select 1;

	{
		_backpack = firstBackpack _x;
		if ((_backpack isKindOf "Bag_Base") && !(_backpack isKindOf "B_AssaultPack_Base")) then {
			{
				_backpack addItemCargoGlobal _x;
			} forEach _cargoplox;
		};
	} forEach nearestObjects [_arsenal, ["weaponholder"], 50];
};

fillAssaultPacks = {

	_arsenal = _this select 0;
	_cargoplox = _this select 1;

	{
		_backpack = firstBackpack _x;
		if (_backpack isKindOf "B_AssaultPack_Base") then {
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
		["100Rnd_65x39_caseless_mag_Tracer", 4],
		["HandGrenade", 5]
	]
] call fillCarryAlls;

[
	ind_arsenal,
	[
		["30Rnd_556x45_Stanag_Tracer_Yellow", 10],
		["200Rnd_65x39_cased_Box_Tracer", 3],
		["HandGrenade", 5]
	]
] call fillCarryAlls;



[
	opfor_arsenal, [
		["30Rnd_65x39_caseless_green_mag_Tracer", 10],
		["150Rnd_762x54_Box_Tracer", 4],
		["HandGrenade", 5]
	]
] call fillCarryAlls;

{
	[
		_x, [
			["ACE_epinephrine", 10],
			["ACE_morphine", 20],
			["ACE_personalAidKit", 40],
			["ACE_bloodIV_500", 5]
		]
	] call fillAssaultPacks;
} forEach [blufor_arsenal, ind_arsenal, opfor_arsenal];