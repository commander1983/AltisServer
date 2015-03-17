/*
	File: empVehicles.sqf
	Author: © 2014 nano2K - written for we-are-friendly.de
*/
private["_index","_vehicle"];
disableSerialization;
if(!isNull (findDisplay 3494)) then {
	if(nn_empInUse) exitWith { hint "Die Batterie muss sich erst wieder aufladen!"; };
	_index = lbCurSel (2902);
	_vehicle = nn_last_vehicles select _index;
	if(isNull _vehicle) exitWith {};
	if(isNil "_vehicle") exitWith {hint "Fahrzeug nicht mehr in Reichweite?";};
	if((lbCurSel 2902) == -1) exitWith {hint "Du hast kein Fahrzeug ausgewählt!";};
	nn_empInUse = true;
	(vehicle player) say3D "empacsound";
	[[_vehicle], "life_fnc_vehicleEmpd",crew _vehicle,false] spawn life_fnc_MP;
	hint "Das EMP lädt sich nun wieder auf. Du kannst es wieder in circa 3 Minuten verwenden!";
	sleep (3 * 60);
	nn_empInUse = false;
};
