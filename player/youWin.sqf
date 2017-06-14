_side = param [0, sideUnknown];

systemChat format ["your side %1 wins. you're being moved to spectator", _side];
[] execVM "player\moveToSpec.sqf";
