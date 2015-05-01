//Init stuff
_crate = _this;

clearWeaponCargoGlobal _crate;
clearItemCargoGlobal _crate;
clearMagazineCargoGlobal _crate;
clearBackpackCargo _crate;
removeAllActions _crate; //funzt nicht mit Inventar dddAction

["AmmoboxInit", [_crate, true]] spawn BIS_fnc_arsenal;
