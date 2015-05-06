DEBUG_MODE = (paramsArray select 0) == 1;
TF_NO_AUTO_LONG_RANGE_RADIO = true;
VIRTUAL_ARSENAL_PLACEMENTS = (paramsArray select 1);


[] execVM "CSSA3\CSSA3_init.sqf";

execVM "spreadLove.sqf"; // so the hostage can board all vehicles. also, nice for testing.

if (!isDedicated) then {
	waitUntil {!isNull player};

	execVM "prepPlayer.sqf";
	execVM "addBriefing.sqf";
	execVM "keepLove.sqf";
	execVM "addArsenal.sqf";
};
