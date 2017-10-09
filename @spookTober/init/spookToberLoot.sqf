ST_lootArray = [

	[
		// Weapons - _lootArray select 0
		"arifle_Katiba_F",
		"arifle_TRG21_F",
		"arifle_MXC_F",
		"arifle_MX_GL_F",
		"arifle_AK12_F"
	],

	[
		// Ammunition - _lootArray select 1
	]

];

// SETUP VARIABLES TO REFERENCE NESTED ARRAYS FOR APORIS =======
_weaponsArray = ST_lootArray select 0;
_ammunitionArray = ST_lootArray select 1;
_itemsArray = ST_lootArray select 2;
_clothingArray = ST_lootArray select 3;
_headgearArray = ST_lootArray select 4;
_survivalitemsArray = ST_lootArray select 5;
//==============================================================


_spawnLoot = [] spawn {

	_houseArray = player nearObjects [ "house", 200 ];

	{

		_housePositions = [_x] call BIS_fnc_buildingPositions;

		{

			if ( 10 > random 100 ) then {

				_weapon = ST_lootArray select 0 call BIS_fnc_selectRandom;
				_itemBox = "WeaponHolderSimulated" createVehicle [0,0,0];
				_itemBox setPos _x;
				_itemBox addWeaponCargoGlobal [_weapon, 1];

			};

		} forEach _housePositions;

	} forEach _houseArray;

};
