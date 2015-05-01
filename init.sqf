diag_log "init.sqf";

tf_no_auto_long_range_radio = true;

if (!isDedicated) then {
	waitUntil {!isNull player};

	[player] execVM "onPlayerRespawn.sqf"; // screw this.
	execVM "addBriefing.sqf";
	blufor_arsenal execVM "addArsenal.sqf";
};
