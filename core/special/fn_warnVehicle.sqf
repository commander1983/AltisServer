/*
	File: warnVehicles.sqf
	Author: © 2014 nano2K - written for we-are-friendly.de
*/
private["_index","_vehicle"];
disableSerialization;
if(!isNull (findDisplay 3494)) then {
	if(nn_warnInUse) exitWith {hint localize "STR_EMP_BereitsAmWarnen";};
	_index = lbCurSel (2902);
	_vehicle = nn_last_vehicles select _index;
	if(isNull _vehicle) exitWith {};
	if(isNil "_vehicle") exitWith {hint localize "STR_EMP_Reichweite";};
	if((lbCurSel 2902) == -1) exitWith {hint localize "STR_EMP_NoVehicleSel";};
	nn_warnInUse = true;
	[[_vehicle], "life_fnc_vehicleWarned",crew _vehicle,false] spawn life_fnc_MP;
	[[[2,1],"Das EMP-Modul wird auf Sie gerichtet! Das ist die letzte Warnung! Halten Sie unverzüglich an!"],"life_fnc_broadcast",crew _vehicle,false] spawn life_fnc_MP;
	sleep 10;
	nn_warnInUse = false;
};