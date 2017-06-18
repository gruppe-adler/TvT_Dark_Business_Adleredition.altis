#include "..\..\missionMacros.h"

DB_onDisconnect = addMissionEventHandler ["HandleDisconnect", {
    _unit = param [0, objNull];
    if (_unit == blufor_hostage) then {true} else {false}; // transfer player to AI
}];
