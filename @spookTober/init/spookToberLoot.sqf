//====================================================================================

_lootArray = [

  [
    // Weapons - lootArray select 0
  ],
  
  [
    // Ammunition - lootArray select 1
  ],
  
  [
    // Items - lootArray select 2
  ],
  
  [
    // Clothing - lootArray select 3
  ],
  
  [
    // Headgear - lootArray select 4
  ],
  
  [
    // Survival items - lootArray select 5
  ]

];

//====================================================================================

_markerPos = getMarkerPos "NAME-HERE"; // A marker covering the map

_houseArray = _markerPos nearObjects [ "house", 100000 ]; // Get houses that are within 10000 of the marker center

{

  _buildingPositions = [_x] call BIS_fnc_buildingPositions;
  
  {
  
    if ( 2 > random 100 ) then { // 2% chance of spawning item
    
      // spawn code here for each house
    
    };
  
  } forEach _buildingPositions;

forEach _houseArray;
