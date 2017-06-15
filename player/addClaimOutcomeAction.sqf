
_victoryCondition = { ((missionNamespace getVariable [DB_playerVictoryVarName, ""]) == "SUCCEEDED") };
_defeatCondition =  { ((missionNamespace getVariable [DB_playerVictoryVarName, ""]) == "FAILED") };
_callback = {
    [[player, playerSide, (missionNamespace getVariable [DB_playerVictoryVarName, ""])], "server\claimOutcomeFor.sqf"] remoteExec ["execVM", 2, false];
};

_action = ["GRAD_mission_claimVictory", "Claim Victory", "", _callback, _victoryCondition] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["GRAD_mission_claimDefeat", "Admit Defeat", "", _callback, _defeatCondition] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;
