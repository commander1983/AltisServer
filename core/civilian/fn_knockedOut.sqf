/*
	File: fn_knockedOut.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts and monitors the knocked out state.
*/
private["_target","_who","_obj"];
_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_who = [_this,1,"",[""]] call BIS_fnc_param;
if(isNull _target) exitWith {};
if(_target != player) exitWith {};
if(_who == "") exitWith {};

titleText[format[localize "STR_Civ_KnockedOut",_who],"PLAIN"];
player playMoveNow "Incapacitated";

_obj = createVehicle ["Land_ClutterCutter_small_F", getPosATL player, [], 0, "NONE"];  

_obj setPosATL (getPosATL player);
player attachTo [_obj,[0,0,0]];
disableUserInput true;
sleep 15;
disableUserInput false;
player playMoveNow "amovppnemstpsraswrfldnon";
detach player;
deleteVehicle _obj;
player setFatigue 0.6;
player setVariable["robbed",FALSE,TRUE];