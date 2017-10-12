_uid = getPlayerUID player;

_pos = getPos player;

[[_uid, _pos], "save_server.sqf"] remoteExec ["BIS_fnc_execVM",2];