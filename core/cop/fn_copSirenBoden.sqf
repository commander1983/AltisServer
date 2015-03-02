/*
	Siren_Boden was made for StaiyLiteDE
*/

private["_vehicle"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if(isNull _vehicle) exitWith {};
if(isNil {_vehicle getVariable "siren_boden"}) exitWith {};

while {true} do
{
    if(!(_vehicle getVariable "siren_boden")) exitWith {};
    if(count (crew (_vehicle)) == 0) then {_vehicle setVariable["siren_boden",false,true]};
    if(!alive _vehicle) exitWith {};
    if(isNull _vehicle) exitWith {};
    _vehicle say3D "siren_boden";
    sleep 7.2810;	// Sirene automatisch ausschalten
    if(!(_vehicle getVariable "siren_boden")) exitWith {};
};