DEBUG_MODE = (paramsArray select 0) == 1;
TF_NO_AUTO_LONG_RANGE_RADIO = true;

execVM "spreadLove.sqf"; // so the hostage can board all vehicles. also, nice for testing.

[] execVM "CSSA3\CSSA3_init.sqf";

if (!isDedicated) then {
	waitUntil {!isNull player};

	execVM "prepPlayer.sqf";
	execVM "addBriefing.sqf";
	execVM "keepLove.sqf";
	blufor_arsenal execVM "addArsenal.sqf";
};
