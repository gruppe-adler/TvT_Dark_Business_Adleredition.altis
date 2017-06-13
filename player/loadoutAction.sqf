#include "..\missionMacros.h"

{
	_x addAction [
		localize "str_GRAD_gimmeLoadout",
		{
			_msg = "player " + profileName + " getting re-equipped...";
			adminLog(_msg);
            [] call A3G_Loadout_fnc_ApplyLoadout;
			[] execVM "player\prepPlayer.sqf";
		},
		nil,
		0,
		true,
		true,
		"",
		"time < RE_EQUIP_TIME"
	];
} forEach [blufor_arsenal, ind_arsenal, opfor_arsenal];
