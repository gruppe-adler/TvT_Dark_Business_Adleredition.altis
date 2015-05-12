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
	} forEach [blufor_munitions, opfor_munitions, ind_munitions];

	[blufor_munitions, "3Rnd_HE_Grenade_shell"] call removeMagazinesCargoGlobal;
};
