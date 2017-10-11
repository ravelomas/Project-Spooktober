if !(isServer) exitWith {};

_spawnLoot = [] spawn {

	waitUntil { time > 5 };

	_activateLootSpawn = true;

	_spawnDistance = 80;

	_spawnChance = 0.1;

	_enableDebug = true;

	_lootArray = [
		"arifle_AK12_F",
		"arifle_AKM_F",
		"arifle_CTAR_ghex_F",
		"arifle_Katiba_F",
		"arifle_Mk20_GL_plain_F",
		"arifle_MX_GL_F",
		"arifle_MX_F",
		"arifle_MXC_Black_F",
		"arifle_MXM_Black_F",
		"arifle_MXM_khk_F",
		"arifle_SPAR_01_snd_F",
		"arifle_SPAR_02_khk_F",
		"arifle_TRG21_GL_F",
		"arifle_ARX_hex_F",
		"launch_RPG32_F",
		"launch_I_Titan_F",
		"launch_B_Titan_F",
		"launch_I_Titan_short_F",
		"LMG_Mk200_F",
		"MMG_01_hex_F",
		"MMG_02_sand_F",
		"hgun_P07_F",
		"hgun_Pistol_01_F",
		"hgun_Pistol_Signal_F",
		"srifle_DMR_07_ghex_F",
		"srifle_GM6_F",
		"optic_ACO_grn_smg",
		"optic_Holosight_khk_F",
		"acc_pointer_IR",
		"acc_flashlight_pistol",
		"acc_flashlight"	
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

			_buildingPositions = [_x] call BIS_fnc_buildingPositions;

			{

				if ( player distance _x <= _spawnDistance ) then {

					if ( _spawnChance > random 100 ) then {

						_lootType = _lootArray call BIS_fnc_selectRandom;

						// Weapon type loot
						if ( _lootType == 0 ) then {

							_itemHolder = "WeaponHolderSimulated" createVehicle [0,0,0];
							_itemHolder setPos _x;
							_itemHolder addWeaponCargoGlobal [ _lootArray call BIS_fnc_selectRandom, 1];

						};

						// Ammo type loot
						if ( _lootType == 1 ) then {};

						// Vest type loot
						if ( _lootType == 2 ) then {};

						// Backpack type loot
						if ( _lootType == 3 ) then {};

						// Clothing type loot
						if ( _lootType == 4 ) then {};

						// Headgear type loot
						if ( _lootType == 5 ) then {};

						// Survival type loot
						if ( _lootType == 6 ) then {};

						// Enable debug
						if ( _enableDebug ) then {
							_markerID = format["%1", _x];
							_debug = createMarker [_markerID, getPos _itemHolder];
							_debug setMarkerType "mil_dot";
							_debug setMarkerColor "ColorRed";
						};

					}; // loot spawn chance

				}; // player distance

			} forEach _buildingPositions; // each building position

		} forEach _buildings; // each building

		sleep 0.1;

	}; // while loop

}; // end...
