/*
	File: fn_pullOutVeh.sqf
	Author: Bryan "Tonic" Boardwine
*/
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if(vehicle player == player) exitWith {};
if(player getVariable "restrained") then
{
	detach player;
	player setVariable["Escorting",false,true];
	player setVariable["transporting",false,true];
};

player action ["Eject", vehicle player];
titleText[format[localize "STR_NOTF_PulledOut",[_unit getVariable["realname", name _unit]]],"PLAIN"];
titleFadeOut 4;