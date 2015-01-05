/*
	File: vehicleEmpd.sqf
	Author: © 2014 nano2K - written for we-are-friendly.de
*/
private["_vehicle"];
_vehicle =  [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {};
if((_vehicle getVariable ["nano_empd", false])) exitWith {};
_vehicle setVariable["nano_empd",true,true];

if(_vehicle isKindOf "Air") then {
	if(local _vehicle) then {
		_vehicle setFuel 0.025;
	}
};

_vehicle setVariable["nano_empd",false,true];