if (playerSide in [INDEPENDENT, OPFOR]) then {
    [
        {
            _markerName = "";
            switch (playerSide) do {
                case INDEPENDENT: { _markerName = "marker_area_green"};
                case OPFOR: { _markerName = "marker_area_green"};
            };
            if (!(alive player) || _markerName == "") exitWith {objNull};

            _pos = getPos player;

            if ((_pos inArea "marker_area_operations") || (_pos inArea _markerName)) exitWith {objNull};

        	[
        		[player],
        		"server\reportPlayerAstray.sqf"
        	] remoteExec ["execVM", 2, false];
        },
        30,
        []
    ] call CBA_fnc_addPerFrameHandler;
};


if (playerSide == BLUFOR) then {
    [
        {
            if (!(alive player) || (player == blufor_hostage)) exitWith {objNull};

            _pos = getPos player;

            if ((_pos inArea "marker_area_green") || (_pos inArea "marker_area_red")) then {
                _height = (getPosATL player) select 2;
                if (_height < 10) then {
                    [
                		[player],
                		"server\reportPlayerAstray.sqf"
                	] remoteExec ["execVM", 2, false];
                };
            };
        },
        30,
        []
    ] call CBA_fnc_addPerFrameHandler;
};
