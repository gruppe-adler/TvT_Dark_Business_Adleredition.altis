#include "..\missionMacros.h"

_player = param [0, objNull];
_pos = getPos _player;
_msg = format ["player %1 seems to be astray at %2 ", _player, _pos];
adminLog(_msg);
