/*
    File: vehicleWarned.sqf
    Author: © 2014 nano2K - written for we-are-friendly.de
*/
private["_vehicle","_dist"];
_vehicle =  [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_dist = player distance _vehicle;
if(isNull _vehicle) exitWith {};
if(_dist >= 150) exitWith {hint localize "STR_EMP_Reichweite";};
if(isNil "_vehicle") exitWith {hint localize "STR_EMP_Reichweite";};
if((_vehicle getVariable ["nano_warned", false])) exitWith {};
_vehicle setVariable["nano_warned",true,true];
_vehicle say3D "empwarn";
sleep 3.35;
_vehicle say3D "empwarn";
sleep 3.35;
_vehicle say3D "empwarn";
sleep 3.35;
_vehicle setVariable["nano_warned",false,true];