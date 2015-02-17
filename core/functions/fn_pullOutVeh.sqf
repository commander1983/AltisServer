/*
	File: fn_pullOutVeh.sqf
	Author: Bryan "Tonic" Boardwine
*/
private["_puller"];
_puller = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;

if(vehicle player == player) exitWith {};
if(player getVariable "restrained") then
{
	detach player;
	player setVariable["Escorting",false,true];
	player setVariable["transporting",false,true];
};

player action ["Eject", vehicle player];
player action ["GetOut", vehicle player];
hint format ["== Du wurdest von %1 aus dem Fahrzeug gezogen. ==",name _puller];
titleFadeOut 4;