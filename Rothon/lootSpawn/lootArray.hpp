//=======================================================================================
//	LOOT SPAWN SYSTEM FOR THE SPOOKTOBER FREAK SHOW =====================================
//=======================================================================================

// All primary weapons into array
_weaponArray = "getNumber( _x >> 'scope' ) isEqualTo 2 && { getNumber( _x >> 'type' ) isEqualTo 1 }"configClasses( configFile >> "CfgWeapons" ) apply { configName _x };