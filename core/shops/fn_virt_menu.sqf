#include <macro.h>
/*
	File: fn_virt_menu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initialize the virtual shop menu.
*/
private["_shop"];
_shop = _this select 3;
if(isNil {_shop}) exitWith {};
life_shop_type = _shop;
life_shop_npc = _this select 0;
if(_shop == "cop" && playerSide != west) exitWith {hint localize "STR_NOTF_NotACop"};
if(_shop == "adacmed" && playerSide == civilian) exitWith {hint localize "STR_NOTF_NotASupport"};
if(_shop == "rebel" && !license_civ_rebel) exitWith {hint localize "STR_NOTF_NotARebell"};
if(_shop == "pruefung" && playerSide != east) exitWith {hint localize "STR_NOTF_NotAPruefer"};

createDialog "shops_menu";

[] call life_fnc_virt_update;