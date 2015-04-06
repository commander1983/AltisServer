/*
	File: empVehicles.sqf
	Author: © 2014 nano2K - written for we-are-friendly.de
*/
private["_index","_vehicle","_dist"];
disableSerialization;
if(!isNull (findDisplay 3494)) then {
	if(nn_empInUse) exitWith { hint "Die Batterie muss sich erst wieder aufladen!"; };
	_index = lbCurSel (2902);
	_vehicle = nn_last_vehicles select _index;
	if(isNull _vehicle) exitWith {};
	if(isNil "_vehicle") exitWith {hint localize "STR_EMP_Reichweite";};
	if((lbCurSel 2902) == -1) exitWith {hint localize "STR_EMP_NoVehicleSel";};
	nn_empInUse = true;
	(vehicle player) say3D "empacsound";
	_vehicle say3D "emped";
	[[_vehicle], "life_fnc_vehicleEmpd",crew _vehicle,false] spawn life_fnc_MP;
	hint localize "STR_EMP_BatterieAufladen";
	sleep (3 * 60);
	nn_empInUse = false;
};
