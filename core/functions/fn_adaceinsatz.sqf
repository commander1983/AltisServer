_name = name player;
_Pos = position player;

_marker = createMarkerLocal [_name, _Pos];
_marker setMarkerColorLocal "ColorYellow";
_marker setMarkerTextLocal "Unfall";
_marker setMarkerTypeLocal "mil_warning"; [[0],"life_fnc_broadcast",east,false] spawn life_fnc_MP;

sleep 300; //Marker stays on the Map for 5 Minutes. Can be changed
deleteMarker _marker;