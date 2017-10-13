if !(isServer) exitWith {};

RAZ_fnc_lootArray = [

	[
		// Uniforms
		"U_C_IDAP_Man_cargo_F"
	],

	[
		// Backpacks
		"B_AssaultPack_blk"
	],

	[
		// Vests
		"V_PlateCarrierGL_blk"
	],

	[
		// Headgear
		"H_HelmetSpecO_blk"
	],

	[
		// Items
		"FirstAidKit"
	],

	[
		// Survival
		"ItemCompass"
	]

];

_RAZ_fnc_spawnLoot = [] spawn {

	_spawnDistance = 30; // Set the distance to building for loot spawn...

	_spawnChance = 25; // Set the % chance of loot spawning ( 0.5 - 5 is recommended)...

	_deletionTime = 5 * 60; // mins before loot deleted ready for respawn (will only delete when player is ?? far away and timer is over ??)...

	_enableDebug = true; // Enable debug loot markers...

	_spawnedLoot = []; // Array- netId of spawned item holders

	while { true } do {

		_buildings = player nearObjects [ "House", _spawnDistance ]; // Get buildings close to player...

		{

			if (_x getVariable ["buildingEmpty", true]) then {

				_buildingPositions = [ _x ] call BIS_fnc_buildingPositions; // Get positions in buildings if variable is false...

				{

					if ( player distance _x <= _spawnDistance && _spawnChance >= random 100 ) then {

						_lootSelection = floor ( random 7 );

						if ( _lootSelection == 0 ) then {

							_rifleConfigs = "getNumber( _x >> 'scope' ) isEqualTo 2 && { getNumber( _x >> 'type' ) isEqualTo 1 && getText( _x >> 'cursor' ) == 'arifle' }"configClasses( configFile >> "CfgWeapons" ) apply { configName _x };
							_itemHolder = "WeaponHolderSimulated" createVehicle [0,0,0];
							_itemHolder setPos _x;
							_itemHolder addWeaponCargoGlobal [ (selectRandom ( _rifleConfigs ) ), 1];
							_timer = time + _deletionTime;
							_spawnedLoot pushBack _itemHolder;
							if ( _enableDebug ) then {
								_markerID = format [ "%1", _x ];
								_markerText = format [ "%1", _lootSelection ];
								_debug = createMarker [_markerID, _x];
								_debug setMarkerType "mil_dot";
								_debug setMarkerColor "ColorRed";
								_debug setMarkerText _markerText;
							}

						}; // Spawn weapon loot

						if ( _lootSelection == 1 ) then {

							_rifleConfigs = "getNumber( _x >> 'scope' ) isEqualTo 2 && { getNumber( _x >> 'type' ) isEqualTo 1 && getText( _x >> 'cursor' ) == 'arifle' }"configClasses( configFile >> "CfgWeapons" ) apply { configName _x };
							_itemHolder = "WeaponHolderSimulated" createVehicle [0,0,0];
							_itemHolder setPos _x;
							_item = ( selectRandom ( _rifleConfigs ) );
							_mags = getArray ( configFile >> "CfgWeapons" >> _item >> "magazines" );
							_mag = ( selectRandom ( _mags ) );
							_itemHolder addMagazineCargoGlobal [_mag, (random 4)];
							_timer = time + _deletionTime;
							_spawnedLoot pushBack _itemHolder;
							if ( _enableDebug ) then {
								_markerID = format [ "%1", _x ];
								_markerText = format [ "%1", _lootSelection ];
								_debug = createMarker [_markerID, _x];
								_debug setMarkerType "mil_dot";
								_debug setMarkerColor "ColorRed";
								_debug setMarkerText _markerText;
							}

						}; // Spawn ammo loot

						if ( _lootSelection == 2 ) then {

							_itemHolder = "WeaponHolderSimulated" createVehicle [0,0,0];
							_itemHolder setPos _x;
							_itemHolder addItemCargoGlobal [ (selectRandom ( RAZ_fnc_lootArray select 0 ) ), 1];
							_timer = time + _deletionTime;
							_spawnedLoot pushBack _itemHolder;
							if ( _enableDebug ) then {
								_markerID = format [ "%1", _x ];
								_markerText = format [ "%1", _lootSelection ];
								_debug = createMarker [_markerID, _x];
								_debug setMarkerType "mil_dot";
								_debug setMarkerColor "ColorRed";
								_debug setMarkerText _markerText;
							}

						}; // Spawn uniform loot

						if ( _lootSelection == 3 ) then {

							_itemHolder = "WeaponHolderSimulated" createVehicle [0,0,0];
							_itemHolder setPos _x;
							_itemHolder addBackpackCargoGlobal [ (selectRandom ( RAZ_fnc_lootArray select 1 ) ), 1];
							_timer = time + _deletionTime;
							_spawnedLoot pushBack _itemHolder;
							if ( _enableDebug ) then {
								_markerID = format [ "%1", _x ];
								_markerText = format [ "%1", _lootSelection ];
								_debug = createMarker [_markerID, _x];
								_debug setMarkerType "mil_dot";
								_debug setMarkerColor "ColorRed";
								_debug setMarkerText _markerText;
							}

						}; // Spawn backpack loot

						if ( _lootSelection == 4 ) then {

							_itemHolder = "WeaponHolderSimulated" createVehicle [0,0,0];
							_itemHolder setPos _x;
							_itemHolder addItemCargoGlobal [ (selectRandom ( RAZ_fnc_lootArray select 2 ) ), 1];
							_timer = time + _deletionTime;
							_spawnedLoot pushBack _itemHolder;
							if ( _enableDebug ) then {
								_markerID = format [ "%1", _x ];
								_markerText = format [ "%1", _lootSelection ];
								_debug = createMarker [_markerID, _x];
								_debug setMarkerType "mil_dot";
								_debug setMarkerColor "ColorRed";
								_debug setMarkerText _markerText;
							}

						}; // Spawn vest loot

						if ( _lootSelection == 5 ) then {

							_itemHolder = "WeaponHolderSimulated" createVehicle [0,0,0];
							_itemHolder setPos _x;
							_itemHolder addItemCargoGlobal [ (selectRandom ( RAZ_fnc_lootArray select 3 ) ), 1];
							_timer = time + _deletionTime;
							_spawnedLoot pushBack _itemHolder;
							if ( _enableDebug ) then {
								_markerID = format [ "%1", _x ];
								_markerText = format [ "%1", _lootSelection ];
								_debug = createMarker [_markerID, _x];
								_debug setMarkerType "mil_dot";
								_debug setMarkerColor "ColorRed";
								_debug setMarkerText _markerText;
							}

						}; // Spawn headgear loot

						if ( _lootSelection == 6 ) then {

							_itemHolder = "WeaponHolderSimulated" createVehicle [0,0,0];
							_itemHolder setPos _x;
							_itemHolder addItemCargoGlobal [ (selectRandom ( RAZ_fnc_lootArray select 4 ) ), 1];
							_timer = time + _deletionTime;
							_spawnedLoot pushBack _itemHolder;
							if ( _enableDebug ) then {
								_markerID = format [ "%1", _x ];
								_markerText = format [ "%1", _lootSelection ];
								_debug = createMarker [_markerID, _x];
								_debug setMarkerType "mil_dot";
								_debug setMarkerColor "ColorRed";
								_debug setMarkerText _markerText;
							}

						}; // Spawn item loot

						if ( _lootSelection == 7 ) then {

							_itemHolder = "WeaponHolderSimulated" createVehicle [0,0,0];
							_itemHolder setPos _x;
							_itemHolder addItemCargoGlobal [ (selectRandom ( RAZ_fnc_lootArray select 5 ) ), 1];
							_timer = time + _deletionTime;
							_spawnedLoot pushBack _itemHolder;
							if ( _enableDebug ) then {
								_markerID = format [ "%1", _x ];
								_markerText = format [ "%1", _lootSelection ];
								_debug = createMarker [_markerID, _x];
								_debug setMarkerType "mil_dot";
								_debug setMarkerColor "ColorRed";
								_debug setMarkerText _markerText;
							}

						}; // Spawn survival loot...

					}; // End spawn distance and chance check...

					if ( player distance _x > _spawnDistance ) then { { deleteVehicle _x } forEach _spawnedLoot; }; // Delete loot if player moves away...

				} forEach _buildingPositions; // End for each building position...

				_x setVariable ["buildingEmpty", false]; // Set the building variable to false...

			}; // End building variable check...

			if ( player distance _x > _spawnDistance ) then { _x setVariable ["buildingEmpty", true]; }; // Set building to empty if player moves away...

		} forEach _buildings; // End for each building...

		sleep 1; // Time between spawn checks...

	}; // End while loop...

}; // End RAZ_fnc_spawnLoot...
