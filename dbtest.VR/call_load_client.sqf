_uid = getPlayerUID player;

_player = vehicle player;

[[_uid, _player], "load_server.sqf"] remoteExec ["BIS_fnc_execVM",2];