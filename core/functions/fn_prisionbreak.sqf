/*
	File: fn_prisionbreak.sqf
	Author: Herman "Mordin" Othelius
*/
private["_unit","_obj","_handle"];
_unit = lbData[8101,(lbCurSel 8101)];
_obj = objNull;
{
	_temp = format["%1", _x];
	if(_temp == _unit) exitWith {
		_obj = _x;
	};
} forEach nearestObjects [getMarkerPos "jail_marker",["Man"],17]; 
// 15 = distance from jail_marker
// this adds all the prisioners around the jail_marker within 15 meters



[_obj] spawn life_fnc_progressBaren;
[[[2,1],"--- JEMAND HACKT DAS SYSTEM DES STAATSGEFÄNGNISES VON ALTIS ---"],"life_fnc_broadcast",nil,false] spawn life_fnc_MP; //hint + mid_text