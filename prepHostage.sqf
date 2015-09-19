removeBackpack _this;
removeAllWeapons _this;
removeAllItems _this;
removeAllAssignedItems _this;
removeHeadgear _this;
_this unassignItem "NVGoggles";
_this removeItem "NVGoggles";

_this spawn {
	sleep 10; //wait for tfar. /me too stupid for event listening
	removeBackpack _this;
	_this addItem "ACE_EarPlugs";
};
