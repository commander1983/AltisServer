/*
	File: fn_gather.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for gathering.
*/
if(isNil "life_action_gather") then {life_action_gather = false;};
private["_gather","_itemWeight","_diff","_itemName","_val","_resourceZones","_zone"];
_resourceZones = ["apple_1","apple_2","apple_3","apple_4","peaches_1","peaches_2","peaches_3","peaches_4","heroin_1","cocaine_1","weed_1","meth_1","grape_1","grape_2","grape_3","grape_4","frogs_1","cerises_1","cerises_2","cerises_3","cerises_4","banane_1","banane_2","banane_3","banane_4","birne_1","birne_2","birne_3","birne_4"];
_zone = "";

if(life_action_gather) exitWith {}; //Action is in use, exit to prevent spamming.
life_action_gather = true;

//Find out what zone we're near
{
	if(player distance (getMarkerPos _x) < 75) exitWith {_zone = _x;};
} foreach _resourceZones;

if(_zone == "") exitWith {
	life_action_inUse = false;
};

//Get the resource that will be gathered from the zone name...
switch(true) do {
	case (_zone in ["apple_1","apple_2","apple_3","apple_4"]): {_gather = "apple"; _val = 4;};
	case (_zone in ["peaches_1","peaches_2","peaches_3","peaches_4"]): {_gather = "peach"; _val = 4;};
	case (_zone in ["heroin_1"]): {_gather = "heroinu"; _val = 1;};
	case (_zone in ["cocaine_1"]): {_gather = "cocaine"; _val = 1;};
	case (_zone in ["weed_1"]): {_gather = "cannabis"; _val = 1;};
	case (_zone in ["meth_1"]): {_gather = "methu"; _val = 1;};
	case (_zone in ["grape_1","grape_2","grape_3","grape_4"]): {_gather = "grapes"; _val = 4;};
	case (_zone in ["frogs_1"]): {_gather = "frogs"; _val = 1;};
	case (_zone in ["cerises_1","cerises_2","cerises_3","cerises_4"]): {_gather = "cerises"; _val = 4;};
	case (_zone in ["banane_1","banane_2","banane_3","banane_4"]): {_gather = "banane"; _val = 4;};
	case (_zone in ["birne_1","birne_2","birne_3","birne_4"]): {_gather = "birne"; _val = 4;};
	default {""};
};
//gather check??
if(vehicle player != player) exitWith {};

_diff = [_gather,_val,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_diff == 0) exitWith {hint localize "STR_NOTF_InvFull"};
life_action_inUse = true;
for "_i" from 0 to 2 do
{
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	sleep 2.5;
};

if(([true,_gather,_diff] call life_fnc_handleInv)) then
{
	_itemName = [([_gather,0] call life_fnc_varHandle)] call life_fnc_varToStr;
	titleText[format[localize "STR_NOTF_Gather_Success",_itemName,_diff],"PLAIN"];
};

life_action_inUse = false;