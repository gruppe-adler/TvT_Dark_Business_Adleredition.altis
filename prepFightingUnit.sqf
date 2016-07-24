#include "missionMacros.h";

_backpack = "";
if (_rank == "LIEUTENANT" || _rank == "CAPTAIN") then { // make sure to give everyone from 2nd in cmd upwards a LR radio
	switch (playerSide) do {
		case west: {_backpack = TF_defaultWestBackpack;};
		case resistance: {_backpack = TF_defaultGuerBackpack;};
		case east: {_backpack = TF_defaultEastBackpack;};
		default {_backpack = ""};
	};
};
if (_backpack != "") then {
	_unit addBackpack _backpack;
};
