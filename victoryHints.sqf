#include "missionMacros.h"

waitUntil {
	sleep 1;
	(!isNil "blufor_hostage") && (!isNil "opfor_munitions_truck")
};

[] spawn {
	while { true } do {
		_status = 'dead';
		if (alive blufor_hostage) then { _status = 'alive'; };
		if ((blufor_hostage distance2D blufor_arsenal) < 50) exitWith {
			_msg = format ["Dark Business: BLUFOR hostage reached BLUFOR base %1!", _status];
			adminLog(_msg);
		};
		sleep 10;
	};
};

[] spawn {
	while { true } do {
		_status = 'dead';
		if (alive blufor_hostage) then { _status = 'alive'; };
		if ((blufor_hostage distance2D opfor_arsenal) < 50) exitWith {
			_msg = format ["Dark Business: BLUFOR hostage reached OPFOR base %1!", _status];
			adminLog(_msg);
		};
		sleep 10;
	};
};

[] spawn {
	while { (opfor_munitions_truck distance2D ind_arsenal) > 50 } do {
		sleep 10;
	};
	_status = 'dead';
	if (alive opfor_munitions_truck) then { _status = 'alive'; };
	_msg = format ["Dark Business: Ammotruck reached IND base %1!", _status];
	adminLog(_msg);
};

[] spawn {
	waitUntil { sleep 5; !alive blufor_hostage };
	adminLog("Dark Business: BLUFOR hostage is dead!");
};

[] spawn {
	waitUntil { sleep 5; !alive opfor_munitions_truck };
	adminLog("Dark Business: OPFOR ammo truck is destroyed!");
};
