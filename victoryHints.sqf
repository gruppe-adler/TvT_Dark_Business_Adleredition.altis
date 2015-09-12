#include "missionMacros.h"

OBJECTIVE_STATE_BLUFOR = 'CREATED';
OBJECTIVE_STATE_IND = 'CREATED';
OBJECTIVE_STATE_OPFOR = 'CREATED';
publicVariable OBJECTIVE_STATE_BLUFOR;
publicVariable OBJECTIVE_STATE_IND;
publicVariable OBJECTIVE_STATE_OPFOR;


waitUntil {
	sleep 1;
	(!isNil "blufor_hostage") && (!isNil "opfor_munitions_truck")
};

[] spawn {
	while { true } do {
		_status = 'dead';
		if (alive blufor_hostage) then { _status = 'alive'; };
		if ((blufor_hostage distance2D blufor_arsenal) < 50) exitWith {
			_msg = format ["Dark Business: BLUFOR hostage reached BLUFOR base %1!", _status];
			OBJECTIVE_STATE_BLUFOR = 'SUCCEEDED';
			OBJECTIVE_STATE_OPFOR = 'FAILED';
			publicVariable 'OBJECTIVE_STATE_BLUFOR';
			publicVariable 'OBJECTIVE_STATE_OPFOR';
			adminLog(_msg);
		};
		sleep 10;
	};
};

[] spawn {
	while { true } do {
		_status = 'dead';
		if (alive blufor_hostage) then { _status = 'alive'; };
		if ((blufor_hostage distance2D opfor_arsenal) < 50) exitWith {
			_msg = format ["Dark Business: BLUFOR hostage reached OPFOR base %1!", _status];
			OBJECTIVE_STATE_OPFOR = 'SUCCEEDED';
			OBJECTIVE_STATE_BLUFOR = 'FAILED';
			publicVariable 'OBJECTIVE_STATE_BLUFOR';
			publicVariable 'OBJECTIVE_STATE_OPFOR';
			adminLog(_msg);
		};
		sleep 10;
	};
};

[] spawn {
	while { (opfor_munitions_truck distance2D ind_arsenal) > 50 } do {
		sleep 10;
	};
	_status = 'dead';
	if (alive opfor_munitions_truck) then { _status = 'alive'; };
	_msg = format ["Dark Business: Ammotruck reached IND base %1!", _status];
	OBJECTIVE_STATE_IND = 'SUCCEEDED';
	publicVariable 'OBJECTIVE_STATE_IND';
	adminLog(_msg);
};

[] spawn {
	waitUntil { sleep 5; !alive blufor_hostage };
	OBJECTIVE_STATE_BLUFOR = 'FAILED';
	OBJECTIVE_STATE_OPFOR = 'FAILED';
	publicVariable 'OBJECTIVE_STATE_BLUFOR';
	publicVariable 'OBJECTIVE_STATE_OPFOR';
	adminLog("Dark Business: BLUFOR hostage is dead!");
};

[] spawn {
	waitUntil { sleep 5; !alive opfor_munitions_truck };
	OBJECTIVE_STATE_IND = 'FAILED';
	publicVariable 'OBJECTIVE_STATE_IND';
	adminLog("Dark Business: OPFOR ammo truck is destroyed!");
};

DB_updateTasks = {
	{task_main_objective setTaskState OBJECTIVE_STATE_BLUFOR;} remoteExec ["BIS_fnc_call", WEST, true];
	{task_main_objective setTaskState OBJECTIVE_STATE_IND;} remoteExec ["BIS_fnc_call", RESISTANCE, true];
	{task_main_objective setTaskState OBJECTIVE_STATE_OPFOR;} remoteExec ["BIS_fnc_call", EAST, true];
};

DB_endMission = {
	{["end1", (OBJECTIVE_STATE_BLUFOR == 'SUCCEEDED')] call BIS_fnc_endMission;} remoteExec ["BIS_fnc_call", WEST, true];
	{["end1", (OBJECTIVE_STATE_IND == 'SUCCEEDED')] call BIS_fnc_endMission;} remoteExec ["BIS_fnc_call", RESISTANCE, true];
	{["end1", (OBJECTIVE_STATE_OPFOR == 'SUCCEEDED')] call BIS_fnc_endMission;} remoteExec ["BIS_fnc_call", EAST, true];
	adminLog("mission end has been called for");
};
