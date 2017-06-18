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

clearBackpackCargoGlobal blufor_heli;
[blufor_heli, "30Rnd_65x39_caseless_mag"] call removeMagazinesCargoGlobal;
