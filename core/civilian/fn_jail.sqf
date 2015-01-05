/*
	File: fn_jail.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the initial process of jailing.
*/
private["_bad","_unit","_time"]; //<-- Replace Old Line With This
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
hint format["%1", _unit];
if(isNull _unit) exitWith {}; //Dafuq?
if(_unit != player) exitWith {}; //Dafuq?
if(life_is_arrested) exitWith {}; //Dafuq i'm already arrested
_bad = [_this,1,false,[false]] call BIS_fnc_param;

//##80
_time = [_this,2,15,[0]] call BIS_fnc_param;  // <-- Add This Line

player setVariable["restrained",false,true];
player setVariable["Escorting",false,true];
player setVariable["transporting",false,true];

titleText[localize "STR_Jail_Warn","PLAIN"];
hint localize "STR_Jail_LicenseNOTF";
player setPos (getMarkerPos "jail_marker");

//Lets add jail outfits
removeUniform player;
removeVest player;
removeBackpack player;
player addUniform "U_I_HeliPilotCoveralls";
[] call life_fnc_updateClothing;

if(_bad) then
{
	waitUntil {alive player};
	sleep 1;
};

//Check to make sure they goto check
if(player distance (getMarkerPos "jail_marker") > 120) then
{
	player setPos (getMarkerPos "jail_marker");
};

[1] call life_fnc_removeLicenses;

life_is_arrested = true;

removeAllWeapons player;
{player removeMagazine _x} foreach (magazines player);

[[player,_bad,_time],"life_fnc_jailSys",false,false] spawn life_fnc_MP; //Give time ##80 to jailSys, if not BAD save time variable in DB, if not, load <-- Replace Old Line With This
[5] call SOCK_fnc_updatePartial;
//[1,false] call SOCK_fnc_updateRequest;