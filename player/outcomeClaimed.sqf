_side = param [0, sideUnknown];

systemChat format ["you're being moved to spectator", _side];
[] execVM "player\moveToSpec.sqf";
