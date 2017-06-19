_victoryCondition = {true};
_defeatCondition =  {true};
_callbackVictory = {
	[
		[player, playerSide, -1],
		"server\claimOutcomeFor.sqf"
	] remoteExec ["execVM", 2, false];
};



DB_defeatClaimCounter = 0;
_callbackDefeat = {
    if (DB_defeatClaimCounter == 0) exitWith {
        DB_defeatClaimCounter = 1;
        [{DB_defeatClaimCounter = 0;}, [], 60] call CBA_fnc_waitAndExecute;
        _msg = "Do you really want to do admit defeat for your side and go to spec mode? Confirm by trying again within 60s";
        hint _msg;
        systemChat _msg;
    };
    if (player == blufor_hostage) exitWith { // hostage must NOT be able to influence all of blufor
        player setDamage 1;
    };
	[
		[player, playerSide, -2],
		"server\claimOutcomeFor.sqf"
	] remoteExec ["execVM", 2, false];
};

_action = ["GRAD_mission_control", "Scenario control", "", {}, {true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["GRAD_mission_claimVictory", "Claim Victory", "", _callbackVictory, _victoryCondition] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "GRAD_mission_control"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["GRAD_mission_claimDefeat", "Admit Defeat", "", _callbackDefeat, _defeatCondition] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "GRAD_mission_control"], _action] call ace_interact_menu_fnc_addActionToObject;
