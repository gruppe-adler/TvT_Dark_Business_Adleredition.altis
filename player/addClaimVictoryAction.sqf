_mainCondition = { (taskState task_main_objective == "SUCCEEDED") };
_callback = {
    [[player, playerSide], "server\claimVictoryFor.sqf"] remoteExec ["execVM", 2, false];
};
_action = ["GRAD_mission_claimVictory", "Claim Victory", "", _callback, _mainCondition] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;
