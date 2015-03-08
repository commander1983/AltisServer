/*
    File: vehicleWarned.sqf
    Author: © 2014 nano2K - written for we-are-friendly.de
*/
private["_vehicle"];
_vehicle =  [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {};
if(isNil "_vehicle") exitWith {hint "Fahrzeug nicht mehr in Reichweite?";};
if((_vehicle getVariable ["nano_land", false])) exitWith {};
_vehicle setVariable["nano_land",true,true];
_vehicle say3D "empwarn";
sleep 3.35;
_vehicle say3D "empwarn";
sleep 3.35;
_vehicle say3D "empwarn";
sleep 3.35;
_vehicle setVariable["nano_land",false,true];