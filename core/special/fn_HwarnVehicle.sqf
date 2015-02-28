/*
	File: warnVehicles.sqf
	Author: © 2014 nano2K - written for we-are-friendly.de
*/
private["_index","_vehicle"];
disableSerialization;
if(!isNull (findDisplay 3494)) then {
	if(nn_landenInUse) exitWith { hint "Das EMP warnt grade schon ein Fahrzeug"; };
	nn_landenInUse = true;
	_index = lbCurSel (2902);
	_vehicle = nn_last_vehicles select _index;
	if(isNull _vehicle) exitWith {};
	[[_vehicle], "life_fnc_vehicleWarned",crew _vehicle,false] spawn life_fnc_MP;
	[[[2,1],"Das EMP-Modul wird auf dich ausgerichtet! Das ist die letzte Warnung zu landen!"],"life_fnc_broadcast",crew _vehicle,false] spawn life_fnc_MP;
	sleep 10;
	nn_landenInUse = false;
};