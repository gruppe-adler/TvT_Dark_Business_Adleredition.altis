
_this spawn {
	sleep 10; //wait for tfar. /me too stupid for event listening
	removeBackpack _this;
};

_this addEventHandler ["GetOutMan", {
        params ["_unit", "", "_vehicle"];

        if ((side _unit != side _vehicle) && (speed _vehicle > 0)) then {
            [_vehicle, "hostage jumped out"] remoteExec ["vehicleChat", 0];
        };
}];
