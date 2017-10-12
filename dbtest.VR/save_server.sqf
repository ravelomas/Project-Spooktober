_uid = _this select 0;

_pos = _this select 1;

_ret = ["players", "location", _uid, _pos] call iniDB_write;