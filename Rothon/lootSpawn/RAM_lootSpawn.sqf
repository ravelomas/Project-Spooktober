// THIS NEEDS TO BE MULTIPLAYER(IZED)..... PARAMS["_unit"] etc...
// 1) Needed: array of current loot & positions so we can despawn loot but keep in memory
// 2) Needed: build our loot array either manually or from config file
// 3) Maybe add building exclusion list into the function ??
//
//
//

if !(isServer) exitWith {};

ST_fnc_spawnSurvivalLoot = {

	_spawnLoot = true;

	_spawnChance = 10;

	_spawnDistance = 150;

	_enableDebug = true;

	_lootArray = [];

	while { _spawnLoot } do {

		_buildings = player nearObjects [ "House", _spawnDistance ];

		{

			if ( player distance _x <= _spawnDistance ) then {

				for '_i' from 0 to 50 do {

					_buildingPosition = _x buildingPos _i;

					if ( str _buildingPosition == "[0,0,0]" ) exitWith {};

					if ( _spawnChance > random 100 ) then {

						_pos = ( _buildingPosition select 0 );
						_pos0 = ( _pos select 0 );
						_pos1 = ( _pos select 1 );
						_pos2 = ( _pos select 2 );

						_itemBox = createVehicle [ "WeaponHolderSimulated", [ _pos0, _pos1, _pos2 + 0.1 ], [], 0, "can_Collide" ];

						_lootType = floor ( random 6 );

						if ( _enableDebug ) then {

							_debug = createMarker [ "lootMarker", getPos _itemBox ];
							_debug setMarkerType "mil_dot";
							_debug setMarkerColor "ColorRed";

						};

						if ( _lootTYpe == 0 ) then {}; // Spawn weapon

						if ( _lootTYpe == 1 ) then {}; // Spawn ammo

						if ( _lootType == 2 ) then {}; // Spawn vest

						if ( _lootType == 3 ) then {}; // Spawn backpack

						if ( _lootType == 4 ) then {}; // Spawn item

						if ( _lootType == 5 ) then {}; // Spawn uniform

						if ( _lootType == 6 ) then {}; // Spawn survival item

						if ( _lootType == 7 ) then {}; // Spawn headgear

					};

				};

			};

		} forEach _buildings;

		sleep 0.5;

	};

};

_startSpawningLoot = [] spawn {

	_runLootFunction = true;

	while { _runLootFunction } do {

		_ST_spawnLoot = [] call ST_fnc_spawnSurvivalLoot;

		sleep 2;

	};

};
