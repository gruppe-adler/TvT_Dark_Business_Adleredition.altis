#include "..\missionMacros.h"

{
	_x addAction [
		"MOVE TO SPECTATOR - THIS IS IRREVERSIBLE!",
		{
			_msg = "player " + profileName + " is moving to spec...";
			adminLog(_msg);
            // [[player], "helpers\server\addPlayerToZeus.sqf"] remoteExec ["execVM", 2, false];

             [] execVM "player\moveToSpec.sqf";
		},
		nil,
		0,
		true,
		true,
		"",
		"true" // "time > RE_EQUIP_TIME" // TODO
	];
} forEach [blufor_arsenal, ind_arsenal, opfor_arsenal];
