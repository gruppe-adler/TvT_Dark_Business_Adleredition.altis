#include "..\..\missionMacros.h"

OBJECTIVE_STATE_BLUFOR = 'CREATED';
OBJECTIVE_STATE_IND = 'CREATED';
OBJECTIVE_STATE_OPFOR = 'CREATED';

VICTORY_CLAIMS = [];

publicVariable 'VICTORY_CLAIMS';

DB_publishTaskStates = {
	publicVariable 'OBJECTIVE_STATE_BLUFOR';
	publicVariable 'OBJECTIVE_STATE_IND';
	publicVariable 'OBJECTIVE_STATE_OPFOR';
};

DB_client_updateTaskState = {
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
};

DB_updateTasks = {
	call DB_publishTaskStates;
	sleep 1;
	DB_client_updateTaskState remoteExec ["BIS_fnc_call", [WEST, EAST, CIVILIAN, RESISTANCE], true];

    // interestingly, CSSA3 causes people to be CIV, BUT THE SERVER DOES NOT SEEM KNOW THAT, AT LEAST NOT FOR PURPOSES OF REMOTEEXEC TARGETING
	// THIS DOESNT WORK:
	// {task_main_objective setTaskState 'CANCELED';} remoteExec ["BIS_fnc_call", CIVILIAN, true];
};

DB_endMission = {
	call DB_publishTaskStates;
	sleep 1;
	_foo = {
		["end1", ('SUCCEEDED' == (taskState task_main_objective) )] call BIS_fnc_endMission
	};
	_foo  remoteExec ["BIS_fnc_call", [WEST, EAST, CIVILIAN, RESISTANCE], true];

	adminLog("mission end has been called for");
};

DB_createInAreaPresenceTrigger = {
    _markerName = param [0, ""];
    _triggerActivationCondition = param [1, {}];
    _triggerActivationCallback = param [2, {}];

    _fnToString = {
        _tail = (str _this) select [1];
        _foo = _tail select [0, ((count _tail)  - 1)];

        _foo
    };

    _triggerActivationCondition = _triggerActivationCondition call _fnToString;
    _triggerActivationCallback = _triggerActivationCallback call _fnToString;

    diag_log "foo1";
    diag_log _triggerActivationCondition;
    diag_log "foo2";
    diag_log _triggerActivationCallback;

    _markerPos = markerPos _markerName;
    _markerSize = markerSize _markerName;
    _markerAngle = markerDir _markerName;

    _aRadius = ((_markerSize select 0) - 500) max 50;
    _bRadius =  ((_markerSize select 1) - 500) max 50;

    _trg = createTrigger ["EmptyDetector", _markerPos, false];
    _trg setTriggerArea [_aRadius, _bRadius, _markerAngle, true, 500];
    _trg setTriggerActivation ["ANY", "PRESENT", false];
    _trg setTriggerStatements [
        _triggerActivationCondition,
        _triggerActivationCallback,
        ""
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
                _status = 'dead';
                if (alive blufor_hostage) then { _status = 'alive'; };
                _msg = format ["Dark Business: BLUFOR hostage reached BLUFOR base %1!", _status];
    			OBJECTIVE_STATE_BLUFOR = 'SUCCEEDED';
                if (_status == "dead") then {
                    OBJECTIVE_STATE_BLUFOR = 'CANCELED';
                };
    			OBJECTIVE_STATE_OPFOR = 'FAILED';
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
                _status = 'dead';
                if (alive blufor_hostage) then { _status = 'alive'; };
                _msg = format ["Dark Business: BLUFOR hostage is deep in OPFOR area %1!", _status];
    			OBJECTIVE_STATE_OPFOR = 'SUCCEEDED';
                if (_status == "dead") then {
                    OBJECTIVE_STATE_OPFOR = 'CANCELED';
                };
    			OBJECTIVE_STATE_BLUFOR = 'FAILED';
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
                OBJECTIVE_STATE_IND = 'SUCCEEDED';
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
            {
                (!alive blufor_hostage)
            },
            {
                // OBJECTIVE_STATE_BLUFOR = 'FAILED';
            	// OBJECTIVE_STATE_OPFOR = 'FAILED';
                // TODO  change task to "retrieve body"
            	call DB_publishTaskStates;
            	adminLog("Dark Business: BLUFOR hostage is dead!");
            }
        ] call CBA_fnc_waitUntilAndExecute;
    }
] call CBA_fnc_waitUntilAndExecute;

[
    {
        (!isNil "opfor_munitions_truck")
    },
    {
        [
            {
                (!alive opfor_munitions_truck)
            },
            {
                OBJECTIVE_STATE_IND = 'FAILED';
            	call DB_publishTaskStates;
            	adminLog("Dark Business: OPFOR ammo truck is destroyed!");
            }
        ] call CBA_fnc_waitUntilAndExecute;
    }
] call CBA_fnc_waitUntilAndExecute;

[] call DB_publishTaskStates;
