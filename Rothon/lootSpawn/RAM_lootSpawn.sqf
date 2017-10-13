if !(isServer) exitWith {};

RAZ_fnc_lootArray = [

	[
		// Weapons
		"arifle_MXC_F"
	],

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
	],

	[
		// Weapon attachments
	]

];

_RAZ_fnc_spawnLoot = [] spawn {

	_runScript = true;

	_spawnDistance = 30; // Set the distance to building for loot spawn...

	_spawnChance = 100; // Set the % chance of loot spawning ( 0.5 - 5 is recommended)...

	_deletionTime = 1 * 60; // mins before loot deleted ready for respawn (will only delete when player is ?? far away and timer is over ??) (30 mins recommended)...

	_deletionDistance = 500;

	_buildingCoolOff = 1 * 60; // Time between fresh loot spawning / replacing into a building (1 hour recommended)

	_enableDebug = true; // Enable debug loot markers...

	_spawnedLoot = []; // Array- netId of spawned item holders

	_buildingsArray = []; // Array of all buildings checked...

	while { _runScript } do {

		_buildings = player nearObjects [ "House", _spawnDistance ]; // Get buildings close to player...

		{

			if (_x getVariable ["buildingEmpty", true]) then {

				_coolOfPeriod = time + _buildingCoolOff;
				_buildingsArray pushBack [_x call BIS_fnc_netId, _coolOfPeriod];

				_buildingPositions = [ _x ] call BIS_fnc_buildingPositions; // Get positions in buildings if variable is false...

				{

					if ( player distance _x <= _spawnDistance && _spawnChance >= random 100 ) then {

						_lootSelection = Ceil random 8;

						if ( _lootSelection == 1 ) then {
							_itemHolder = "WeaponHolderSimulated" createVehicle [0,0,0];
							_itemHolder setPos _x;
							_item = ( selectRandom ( RAZ_fnc_lootArray select 0 ) );
							_itemHolder addWeaponCargoGlobal [ _item, 1];
							_timer = time + _deletionTime;
							if ( _enableDebug ) then {
								_markerID = format [ "%1", _x ];
								_debug = createMarker [_markerID, _x];
								_debug setMarkerType "mil_dot";
								_debug setMarkerColor "ColorRed";
								_debug setMarkerText "Weapon";
							};
							if !(isNull _itemHolder) then { _spawnedLoot pushBack [_itemHolder call BIS_fnc_netId, _timer, _x] };

						}; // Spawn weapon loot

						if ( _lootSelection == 2 ) then {

							_itemHolder = "WeaponHolderSimulated" createVehicle [0,0,0];
							_itemHolder setPos _x;
							_item = ( selectRandom ( RAZ_fnc_lootArray select 0 ) );
							_mags = getArray ( configFile >> "CfgWeapons" >> _item >> "magazines" );
							_mag = ( selectRandom ( _mags ) );
							_itemHolder addMagazineCargoGlobal [_mag, (random 4)];
							_timer = time + _deletionTime;
							if ( _enableDebug ) then {
								_markerID = format [ "%1", _x ];
								_debug = createMarker [_markerID, _x];
								_debug setMarkerType "mil_dot";
								_debug setMarkerColor "ColorRed";
								_debug setMarkerText "Ammo";
							};
							if !(isNull _itemHolder) then { _spawnedLoot pushBack [_itemHolder call BIS_fnc_netId, _timer, _x] };

						}; // Spawn ammo loot

						if ( _lootSelection == 3 ) then {

							_itemHolder = "WeaponHolderSimulated" createVehicle [0,0,0];
							_itemHolder setPos _x;
							_itemHolder addItemCargoGlobal [ (selectRandom ( RAZ_fnc_lootArray select 1 ) ), 1];
							_timer = time + _deletionTime;
							if ( _enableDebug ) then {
								_markerID = format [ "%1", _x ];
								_debug = createMarker [_markerID, _x];
								_debug setMarkerType "mil_dot";
								_debug setMarkerColor "ColorRed";
								_debug setMarkerText "Uniform";
							};
							if !(isNull _itemHolder) then { _spawnedLoot pushBack [_itemHolder call BIS_fnc_netId, _timer, _x] };

						}; // Spawn uniform loot

						if ( _lootSelection == 4 ) then {

							_itemHolder = "WeaponHolderSimulated" createVehicle [0,0,0];
							_itemHolder setPos _x;
							_itemHolder addBackpackCargoGlobal [ (selectRandom ( RAZ_fnc_lootArray select 2 ) ), 1];
							_timer = time + _deletionTime;
							if ( _enableDebug ) then {
								_markerID = format [ "%1", _x ];
								_debug = createMarker [_markerID, _x];
								_debug setMarkerType "mil_dot";
								_debug setMarkerColor "ColorRed";
								_debug setMarkerText "Backpack";
							};
							if !(isNull _itemHolder) then { _spawnedLoot pushBack [_itemHolder call BIS_fnc_netId, _timer, _x] };

						}; // Spawn backpack loot

						if ( _lootSelection == 5 ) then {

							_itemHolder = "WeaponHolderSimulated" createVehicle [0,0,0];
							_itemHolder setPos _x;
							_itemHolder addItemCargoGlobal [ (selectRandom ( RAZ_fnc_lootArray select 3 ) ), 1];
							_timer = time + _deletionTime;
							if ( _enableDebug ) then {
								_markerID = format [ "%1", _x ];
								_debug = createMarker [_markerID, _x];
								_debug setMarkerType "mil_dot";
								_debug setMarkerColor "ColorRed";
								_debug setMarkerText "Vest";
							};
							if !(isNull _itemHolder) then { _spawnedLoot pushBack [_itemHolder call BIS_fnc_netId, _timer, _x] };

						}; // Spawn vest loot

						if ( _lootSelection == 6 ) then {

							_itemHolder = "WeaponHolderSimulated" createVehicle [0,0,0];
							_itemHolder setPos _x;
							_itemHolder addItemCargoGlobal [ (selectRandom ( RAZ_fnc_lootArray select 4 ) ), 1];
							_timer = time + _deletionTime;
							if ( _enableDebug ) then {
								_markerID = format [ "%1", _x ];
								_debug = createMarker [_markerID, _x];
								_debug setMarkerType "mil_dot";
								_debug setMarkerColor "ColorRed";
								_debug setMarkerText "Headgear";
							};
							if !(isNull _itemHolder) then { _spawnedLoot pushBack [_itemHolder call BIS_fnc_netId, _timer, _x] };

						}; // Spawn headgear loot

						if ( _lootSelection == 7 ) then {

							_itemHolder = "WeaponHolderSimulated" createVehicle [0,0,0];
							_itemHolder setPos _x;
							_itemHolder addItemCargoGlobal [ (selectRandom ( RAZ_fnc_lootArray select 5 ) ), 1];
							_timer = time + _deletionTime;
							if ( _enableDebug ) then {
								_markerID = format [ "%1", _x ];
								_debug = createMarker [_markerID, _x];
								_debug setMarkerType "mil_dot";
								_debug setMarkerColor "ColorRed";
								_debug setMarkerText "Inventory Item";
							};
							if !(isNull _itemHolder) then { _spawnedLoot pushBack [_itemHolder call BIS_fnc_netId, _timer, _x] };

						}; // Spawn item loot

						if ( _lootSelection == 8 ) then {

							_itemHolder = "WeaponHolderSimulated" createVehicle [0,0,0];
							_itemHolder setPos _x;
							_itemHolder addItemCargoGlobal [ (selectRandom ( RAZ_fnc_lootArray select 6 ) ), 1];
							_timer = time + _deletionTime;
							if ( _enableDebug ) then {
								_markerID = format [ "%1", _x ];
								_debug = createMarker [_markerID, _x];
								_debug setMarkerType "mil_dot";
								_debug setMarkerColor "ColorRed";
								_debug setMarkerText "Survival Item";
							};
							if !(isNull _itemHolder) then { _spawnedLoot pushBack [_itemHolder call BIS_fnc_netId, _timer, _x] };

						}; // Spawn survival loot...

					}; // End spawn distance and chance check...

				} forEach _buildingPositions; // End for each building position...

				_x setVariable ["buildingEmpty", false]; // Set the building variable to false...

			}; // End building variable check...

		} forEach _buildings; // End for each building...

		{
			_obj = _x select 0 call BIS_fnc_objectFromNetId;

			_getMarkerName = _x select 2;

			_markerName = format [ "%1", _getMarkerName ];

			if ( player distance _obj > _deletionDistance && time > _x select 1 ) then { deleteVehicle _obj; deleteMarker _markerName; _spawnedLoot deleteAt (_spawnedLoot find _x) };

		} forEach _spawnedLoot; // Foreach loot item in array...

		{

			_building = _x select 0 call BIS_fnc_objectFromNetId;

			if ( player distance _building > _deletionDistance && time > _x select 1 ) then { _building setVariable [ "buildingEmpty", true ] };

		} forEach _buildingsArray; // Foreach building in array...

		hint str _spawnedLoot;

		sleep 2; // Time between spawn checks...

	}; // End while loop...

}; // End RAZ_fnc_spawnLoot...
