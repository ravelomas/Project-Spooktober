if !(isServer) exitWith {};

_spawnLoot = [] spawn {

	waitUntil { time > 5 };

	_activateLootSpawn = true;

	_spawnDistance = 80;

	_spawnChance = 5;

	_enableDebug = true;

	_lootArray = [

		[
			// Weapons
			"arifle_AK12_F"
		],

		[
			// Ammo
			"arifle_AK12_F"
		],

		[
			// Vests
			"arifle_AK12_F"
		],

		[
			// Backpack
			"arifle_AK12_F"
		],

		[
			// Clothing
			"arifle_AK12_F"
		],

		[
			// Headgear
			"arifle_AK12_F"
		],

		[
			// Survival
			"arifle_AK12_F"
		]

	];

	_weaponLootArray = _lootArray select 0;
	_ammoLootArray = _lootArray select 1;
	_vestLootArray = _lootArray select 2;
	_backpackLootArray = _lootArray select 3;
	_clothingLootArray = _lootArray select 4;
	_headgearLootArray = _lootArray select 5;
	_survivalLootArray = _lootArray select 6;

	while { _activateLootSpawn } do {

		_buildings = player nearObjects [ "House", _spawnDistance ];

		{

			if ( ( _x getVariable [ "hasLoot", true ] ) == false ) then {

				_buildingPositions = [_x] call BIS_fnc_buildingPositions;

				{

						if ( player distance _x <= _spawnDistance ) then {


							if ( _spawnChance > random 100 ) then {
								
								_lootType = floor ( random 7);

								// Weapon type loot
								if ( _lootType == 0 ) then {

									_itemHolder = "WeaponHolderSimulated" createVehicle [0,0,0];
									_itemHolder setPos _x;
									_itemHolder addWeaponCargoGlobal [ _weaponLootArray call BIS_fnc_selectRandom, 1];

								};

								// Ammo type loot
								if ( _lootType == 1 ) then {

									_itemHolder = "WeaponHolderSimulated" createVehicle [0,0,0];
									_itemHolder setPos _x;
									_itemHolder addWeaponCargoGlobal [ _ammoLootArray call BIS_fnc_selectRandom, 1];

								};

								// Vest type loot
								if ( _lootType == 2 ) then {

									_itemHolder = "WeaponHolderSimulated" createVehicle [0,0,0];
									_itemHolder setPos _x;
									_itemHolder addWeaponCargoGlobal [ _vestLootArray call BIS_fnc_selectRandom, 1];

								};

								// Backpack type loot
								if ( _lootType == 3 ) then {

									_itemHolder = "WeaponHolderSimulated" createVehicle [0,0,0];
									_itemHolder setPos _x;
									_itemHolder addWeaponCargoGlobal [ _backpackLootArray call BIS_fnc_selectRandom, 1];

								};

								// Clothing type loot
								if ( _lootType == 4 ) then {

									_itemHolder = "WeaponHolderSimulated" createVehicle [0,0,0];
									_itemHolder setPos _x;
									_itemHolder addWeaponCargoGlobal [ _clothingLootArray call BIS_fnc_selectRandom, 1];

								};

								// Headgear type loot
								if ( _lootType == 5 ) then {

									_itemHolder = "WeaponHolderSimulated" createVehicle [0,0,0];
									_itemHolder setPos _x;
									_itemHolder addWeaponCargoGlobal [ _headgearLootArray call BIS_fnc_selectRandom, 1];

								};

								// Survival type loot
								if ( _lootType == 6 ) then {

									_itemHolder = "WeaponHolderSimulated" createVehicle [0,0,0];
									_itemHolder setPos _x;
									_itemHolder addWeaponCargoGlobal [ _survivalLootArray call BIS_fnc_selectRandom, 1];

								};

								// Enable debug
								if ( _enableDebug ) then {
									_markerID = format["%1", _x];
									_debug = createMarker [_markerID, _x];
									_debug setMarkerType "mil_dot";
									_debug setMarkerColor "ColorRed";
								};

							}; // loot spawn chance

						}; // player distance

				} forEach _buildingPositions; // each building position

				_x setVariable ["hasLoot", true];

			}; // end variable check

		} forEach _buildings; // each building

		sleep 1;

	}; // while loop

}; // end...

//=================================================================================
// _building setVariable ["ExileLootWeaponHolderNetIDs", _lootWeaponHolderNetIDs];
// _building setVariable ["ExileLootSpawnedAt", time];
// _building setVariable ["ExileHasLoot", true];
// _lootWeaponHolderNetIDs pushBack (netId _lootHolder);
//=================================================================================
