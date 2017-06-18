#include "..\..\missionMacros.h"

OBJECTIVE_STATE_BLUFOR = -2;
OBJECTIVE_STATE_IND = -2;
OBJECTIVE_STATE_OPFOR = -2;

VICTORY_CLAIMS = [];
DEFEAT_CLAIMS = [];

publicVariable 'VICTORY_CLAIMS';

DB_publishTaskStates = {
	publicVariable 'OBJECTIVE_STATE_BLUFOR';
	publicVariable 'OBJECTIVE_STATE_IND';
	publicVariable 'OBJECTIVE_STATE_OPFOR';
};

DB_client_updateTaskState = {

	_taskSurviveState = 'SUCCEEDED';
	if (DB_playerIsDead) then {
		_taskSurviveState = 'FAILED';
	};
	task_survive setTaskState _taskSurviveState;


	_objectiveState = (missionNamespace getVariable [DB_playerVictoryVarName, ""]);
	_secondaryObjectiveTaskState = "CREATED";
	_mainObjectiveTaskState = "CREATED";
	switch (_objectiveState) do {
		case 2: {
			_mainObjectiveTaskState = "SUCCEEDED";
			_secondaryObjectiveTaskState = "CANCELED";
		};
		case -1: {
			_mainObjectiveTaskState = "FAILED";
			_secondaryObjectiveTaskState = "SUCCEEDED";
		};
		case -2: {
			_mainObjectiveTaskState = "FAILED";
			_secondaryObjectiveTaskState = "FAILED";
		};
	};

	if (!(isNil "task_secondary_objective")) then {
		task_secondary_objective setTaskState _secondaryObjectiveTaskState
	};
	task_main_objective setTaskState _mainObjectiveTaskState;

};

DB_updateTasks = {
	call DB_publishTaskStates;
	[{
		DB_client_updateTaskState remoteExec ["BIS_fnc_call", [WEST, EAST, CIVILIAN, RESISTANCE], true];
	}, [], 2] call CBA_fnc_waitAndExecute;
	// interestingly, CSSA3 causes people to be CIV, BUT THE SERVER DOES NOT SEEM KNOW THAT, AT LEAST NOT FOR PURPOSES OF REMOTEEXEC TARGETING
	// THIS DOESNT WORK:
	// {task_main_objective setTaskState 'CANCELED';} remoteExec ["BIS_fnc_call", CIVILIAN, true];
};

DB_endMission = {
	call DB_updateTasks;
	[{
		_foo = {
			["end1", ('SUCCEEDED' == (taskState task_main_objective))] call BIS_fnc_endMission
		};
		_foo  remoteExec ["BIS_fnc_call", [WEST, EAST, CIVILIAN, RESISTANCE], true];
		adminLog("mission end has been called for");
	}, [], 5] call CBA_fnc_waitAndExecute;
};

DB_createInAreaPresenceTrigger = {
	_markerName = param [0, ""];
	_triggerActivationCondition = param [1, {}];
	_triggerActivationCallback = param [2, {}];
	_triggerDeactivationCallback = param [3, {}];

	_fnToString = {
		_tail = (str _this) select [1];
		_foo = _tail select [0, ((count _tail)  - 1)];
		_foo
	};

	_triggerActivationCondition = _triggerActivationCondition call _fnToString;
	_triggerActivationCallback = _triggerActivationCallback call _fnToString;
	_triggerDeactivationCallback = _triggerDeactivationCallback call _fnToString;

	_markerPos = markerPos _markerName;
	_markerSize = markerSize _markerName;
	_markerAngle = markerDir _markerName;

	_aRadius = ((_markerSize select 0) - 500) max 50;
	_bRadius =  ((_markerSize select 1) - 500) max 50;

	_trg = createTrigger ["EmptyDetector", _markerPos, false];
	_trg setTriggerArea [_aRadius, _bRadius, _markerAngle, true, 500];
	_trg setTriggerActivation ["ANY", "PRESENT", true];
	_trg setTriggerStatements [
		_triggerActivationCondition,
		_triggerActivationCallback,
		_triggerDeactivationCallback
	];
};

[
	{
		(!isNil "blufor_hostage")
	},
	{
		[
			"marker_area_blufor",
			{
				(blufor_hostage in thisList) // FIXME dead units are excepted from trigger stuff. yes -.-
			},
			{
				_status = 'alive';
				if (typeof blufor_hostage == "ACE_BodyBagObject") then { _status = 'dead'; };
				_msg = format ["Dark Business: BLUFOR hostage reached BLUFOR base %1!", _status];
				OBJECTIVE_STATE_BLUFOR = 2;
				if (_status == "dead") then {
					OBJECTIVE_STATE_BLUFOR = -1;
				};
				OBJECTIVE_STATE_OPFOR = -2;
				call DB_publishTaskStates;
				adminLog(_msg);
			},
			{
				if (BLUFOR in VICTORY_CLAIMS) exitWith {
					adminLog("hostage left blufor area, but victory has already been claimed");
				};
				_msg = format ["Dark Business: BLUFOR hostage left BLUFOR base %1!", _status];
				OBJECTIVE_STATE_BLUFOR = -2;
				OBJECTIVE_STATE_OPFOR = -2;
				call DB_publishTaskStates;
				adminLog(_msg);
			}
		] call DB_createInAreaPresenceTrigger;
	}
] call CBA_fnc_waitUntilAndExecute;

[
	{
		(!isNil "blufor_hostage")
	},
	{
		[
			"marker_area_redfor",
			{
				(blufor_hostage in thisList)
			},
			{
				_status = 'alive';
				if (typeof blufor_hostage == "ACE_BodyBagObject") then { _status = 'dead'; };
				_msg = format ["Dark Business: BLUFOR hostage is deep in OPFOR area %1!", _status];
				OBJECTIVE_STATE_OPFOR = 2;
				if (_status == "dead") then {
					OBJECTIVE_STATE_OPFOR = -1;
				};
				OBJECTIVE_STATE_BLUFOR = -2;
				call DB_publishTaskStates;
				adminLog(_msg);
			},
			{
				if (OPFOR in VICTORY_CLAIMS) exitWith {
					adminLog("hostage left redfor area, but victory has already been claimed");
				};
				_msg = format ["Dark Business: BLUFOR hostage left REDFOR base %1!", _status];
				OBJECTIVE_STATE_BLUFOR = -2;
				OBJECTIVE_STATE_OPFOR = -2;
				call DB_publishTaskStates;
				adminLog(_msg);
			}
		] call DB_createInAreaPresenceTrigger;
	}
] call CBA_fnc_waitUntilAndExecute;

[
	{
		(!isNil "opfor_munitions_truck")
	},
	{
		[
			"marker_area_greenfor",
			{
				(opfor_munitions_truck in thisList)
			},
			{
				_msg = format ["Dark Business: Fuel truck is deep in IND area %1!", "alive"];
				OBJECTIVE_STATE_IND = 2;
				call DB_publishTaskStates;
				adminLog(_msg);
			},
			{
				if (INDEPENDENT in VICTORY_CLAIMS) exitWith {
					adminLog("truck left greenfor area, but victory has already been claimed");
				};
				_msg = format ["Dark Business: truck left GREENFOR base %1!", _status];
				OBJECTIVE_STATE_IND = -2;
				call DB_publishTaskStates;
				adminLog(_msg);
			}
		] call DB_createInAreaPresenceTrigger;
	}
] call CBA_fnc_waitUntilAndExecute;

DB_killedHandler = addMissionEventHandler ["EntityKilled",
{
	_killed = param [0, objNull];
	if (_killed == blufor_hostage) then {
		adminLog("hostage killed");
	};
	if (_killed == opfor_munitions_truck) then {
		adminLog("Dark Business: OPFOR ammo truck is destroyed!");
	};
}];

[] call DB_publishTaskStates;
