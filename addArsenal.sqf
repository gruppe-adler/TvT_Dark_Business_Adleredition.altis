
_addArsenal = {
	_crate = _this;

	clearWeaponCargoGlobal _crate;
	clearItemCargoGlobal _crate;
	clearMagazineCargoGlobal _crate;
	clearBackpackCargo _crate;
	removeAllActions _crate; //funzt nicht mit Inventar dddAction

	["AmmoboxInit", [_crate, true]] spawn BIS_fnc_arsenal;
};

_bitAnd = {
	_a = _this select 0;
	_b = _this select 1;

	_shifted = floor (_a / _b);

	(_shifted % 2) == 1
};

_crates = [blufor_arsenal, opfor_arsenal, ind_arsenal];
_sides = [1, 2, 4];

{

	if ([VIRTUAL_ARSENAL_PLACEMENTS, _x] call _bitAnd) then {
		(_crates select  _foreachIndex) call _addArsenal;
	};
} forEach _sides;
