_side = param [0, sideUnknown];

if (player == blufor_hostage) exitWith { // nope. hostage is separate
    true
};

systemChat format ["your team claimed victory or admitted defeat. you're being moved to spectator", _side];
[{
	[] execVM "player\moveToSpec.sqf";
}, [], 3] call CBA_fnc_waitAndExecute;
