player createDiarySubject ["scenario", localize "str_GRAD_scenario_subject"];

player createDiaryRecord ["scenario", [localize "str_GRAD_scenario_background_title", localize "str_GRAD_scenario_background"]];
player createDiaryRecord ["scenario", [localize "str_GRAD_scenario_story_title", localize "str_GRAD_scenario_story"]];
player createDiaryRecord ["scenario", [localize "str_GRAD_scenario_environment_title", localize "str_GRAD_scenario_environment"]];
player createDiaryRecord ["scenario", [localize "str_GRAD_scenario_equipment_title", localize "str_GRAD_scenario_equipment"]];

_title = "";
_content = "";
_condition = "";
_title = "";

switch (side player) do {
	case west: {
		_title = localize "str_GRAD_BLUFOR_title";
		_content = localize "str_GRAD_BLUFOR_story";

		_condition = localize "str_GRAD_BLUFOR_condition";

		if (!(isNil "blufor_hostage")) then {
			if (player == blufor_hostage) then {
				_title = localize "str_GRAD_BLUFOR_hostage_title";
				_content = localize "str_GRAD_BLUFOR_hostage_story";
			};
			_condition = localize "str_GRAD_BLUFOR_hostage_condition";
		};
	};
	case east: {
		_title = localize "str_GRAD_OPFOR_title";
		_content = localize "str_GRAD_OPFOR_story";
		_condition = localize "str_GRAD_OPFOR_condition";
	};
	case resistance: {
		_title = localize "str_GRAD_IND_title";
		_content = localize "str_GRAD_IND_story";
		_condition = localize "str_GRAD_IND_condition";
	};
};

player createDiaryRecord ["Diary", [_title, _content]];

task_main_objective = player createSimpleTask [_title];
task_main_objective setSimpleTaskDescription [_condition, _title, _title];
player setCurrentTask task_main_objective;

/*

task_main_objective setTaskState "SUCCEEDED";
task_main_objective setTaskState "FAILED";
task_main_objective setTaskState "CANCELED";

*/
