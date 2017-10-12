_uid = _this select 0;

_player = _this select 1;

_savepos = ["players", "location", _uid, "ARRAY"] call iniDB_read;

_player setPos _savepos;