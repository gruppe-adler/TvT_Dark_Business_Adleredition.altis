
_victoryCondition = {true};
_defeatCondition =  {true};
_callbackVictory = {
	[
		[player, playerSide, -1],
		"server\claimOutcomeFor.sqf"
	] remoteExec ["execVM", 2, false];
};
_callbackDefeat = {
	[
		[player, playerSide, -2],
		"server\claimOutcomeFor.sqf"
	] remoteExec ["execVM", 2, false];
};

_action = ["GRAD_mission_control", "Scenario control", "", {}, {true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["GRAD_mission_claimVictory", "Claim Victory", "", _callback, _victoryCondition] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "GRAD_mission_control"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["GRAD_mission_claimDefeat", "Admit Defeat", "", _callback, _defeatCondition] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "GRAD_mission_control"], _action] call ace_interact_menu_fnc_addActionToObject;
