/*
	Siren_Razzia was made for StaiyLiteDE
*/

private["_vehicle"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if(isNull _vehicle) exitWith {};
if(isNil {_vehicle getVariable "siren_razzia"}) exitWith {};

while {true} do
{
    if(!(_vehicle getVariable "siren_razzia")) exitWith {};
    if(count (crew (_vehicle)) == 0) then {_vehicle setVariable["siren_razzia",false,true]};
    if(!alive _vehicle) exitWith {};
    if(isNull _vehicle) exitWith {};
    _vehicle say3D "siren_razzia";
    sleep 5.7380;	// Sirene automatisch ausschalten
	titleText ["== Razzia-Sirene deaktiviert ==","PLAIN"];
	_veh setVariable["siren_razzia",false,true];
    if(!(_vehicle getVariable "siren_razzia")) exitWith {};
};