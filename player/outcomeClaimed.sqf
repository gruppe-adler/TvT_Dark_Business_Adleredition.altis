_side = param [0, sideUnknown];

systemChat format ["your team claimed victory or admitted defeat. you're being moved to spectator", _side];
[{
	[] execVM "player\moveToSpec.sqf";
}, [], 3] call CBA_fnc_waitAndExecute;

