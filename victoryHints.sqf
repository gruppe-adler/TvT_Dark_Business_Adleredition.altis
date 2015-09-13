#include "missionMacros.h"

OBJECTIVE_STATE_BLUFOR = 'CREATED';
OBJECTIVE_STATE_IND = 'CREATED';
OBJECTIVE_STATE_OPFOR = 'CREATED';

DB_publishTaskStates = {
	publicVariable 'OBJECTIVE_STATE_BLUFOR';
	publicVariable 'OBJECTIVE_STATE_IND';
	publicVariable 'OBJECTIVE_STATE_OPFOR';
};

DB_updateTasks = {
	call DB_publishTaskStates;
	sleep 1;
	{
		_mainObjectiveState = 'CANCELED';
		_taskSurviveState = 'SUCCEEDED';
		if (!alive player) then {
			_taskSurviveState = 'FAILED';
		};
		switch (side player) do {
			case WEST: {_mainObjectiveState = OBJECTIVE_STATE_BLUFOR};
			case RESISTANCE: {_mainObjectiveState = OBJECTIVE_STATE_IND};
			case EAST: {_mainObjectiveState = OBJECTIVE_STATE_OPFOR};
			default { _taskSurviveState = 'FAILED'};
		};
		task_main_objective setTaskState _mainObjectiveState;
		task_survive setTaskState _taskSurviveState;
	} remoteExec ["BIS_fnc_call", [WEST, EAST, CIVILIAN, RESISTANCE], true];

	// interestingly, CSSA3 causes people to be CIV, BUT THE SERVER DOES NOT SEEM KNOW THAT, AT LEAST NOT FOR PURPOSES OF REMOTEEXEC TARGETING
	// THIS DOESNT WORK:
	// {task_main_objective setTaskState 'CANCELED';} remoteExec ["BIS_fnc_call", CIVILIAN, true];
};

DB_endMission = {
	call DB_publishTaskStates;
	sleep 1;
	{
		["end1", ('SUCCEEDED' == (taskState task_main_objective) )] call BIS_fnc_endMission;
	} remoteExec ["BIS_fnc_call", [WEST, EAST, CIVILIAN, RESISTANCE], true];

	adminLog("mission end has been called for");
};

call DB_publishTaskStates;


[] spawn {
	waitUntil { sleep 1; (!isNil "blufor_hostage") };
	while { true } do {
		_status = 'dead';
		if (alive blufor_hostage) then { _status = 'alive'; };
		if ((blufor_hostage distance2D blufor_arsenal) < 50) exitWith {
			_msg = format ["Dark Business: BLUFOR hostage reached BLUFOR base %1!", _status];
			OBJECTIVE_STATE_BLUFOR = 'SUCCEEDED';
			OBJECTIVE_STATE_OPFOR = 'FAILED';
			call DB_publishTaskStates;
			adminLog(_msg);
		};
		sleep 10;
	};
};

[] spawn {
	waitUntil { sleep 1; (!isNil "blufor_hostage") };
	while { true } do {
		_status = 'dead';
		if (alive blufor_hostage) then { _status = 'alive'; };
		if ((blufor_hostage distance2D opfor_arsenal) < 50) exitWith {
			_msg = format ["Dark Business: BLUFOR hostage reached OPFOR base %1!", _status];
			OBJECTIVE_STATE_OPFOR = 'SUCCEEDED';
			OBJECTIVE_STATE_BLUFOR = 'FAILED';
			call DB_publishTaskStates;
			adminLog(_msg);
		};
		sleep 10;
	};
};

[] spawn {
	waitUntil { sleep 1; (!isNil "opfor_munitions_truck") };
	while { (opfor_munitions_truck distance2D ind_arsenal) > 50 } do {
		sleep 10;
	};
	_status = 'dead';
	if (alive opfor_munitions_truck) then { _status = 'alive'; };
	_msg = format ["Dark Business: Ammotruck reached IND base %1!", _status];
	OBJECTIVE_STATE_IND = 'SUCCEEDED';
	call DB_publishTaskStates;
	adminLog(_msg);
};

[] spawn {
	waitUntil { sleep 1; (!isNil "blufor_hostage") };
	waitUntil { sleep 5; !alive blufor_hostage };
	OBJECTIVE_STATE_BLUFOR = 'FAILED';
	OBJECTIVE_STATE_OPFOR = 'FAILED';
	call DB_publishTaskStates;
	adminLog("Dark Business: BLUFOR hostage is dead!");
};

[] spawn {
	waitUntil { sleep 1; (!isNil "opfor_munitions_truck") };
	waitUntil { sleep 5; !alive opfor_munitions_truck };
	OBJECTIVE_STATE_IND = 'FAILED';
	call DB_publishTaskStates;
	adminLog("Dark Business: OPFOR ammo truck is destroyed!");
};

