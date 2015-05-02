tf_no_auto_long_range_radio = true;

execVM "spreadLove.sqf"; // so the hostage can board all vehicles. also, nice for testing.

if (!isDedicated) then {
	waitUntil {!isNull player};

	[player] execVM "onPlayerRespawn.sqf"; // screw this.
	execVM "addBriefing.sqf";
	blufor_arsenal execVM "addArsenal.sqf";
};
