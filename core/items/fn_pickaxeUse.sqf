/*
	File: fn_pickaxeUse.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for pickaxe in mining.
*/
closeDialog 0;
private["_mine","_itemWeight","_diff","_itemName","_val"];
switch (true) do
{
	case (player distance (getMarkerPos "lead_1") < 35): {_mine = "copperore"; _val = 2;};
	case (player distance (getMarkerPos "iron_1") < 35): {_mine = "ironore"; _val = 2;};
	case (player distance (getMarkerPos "salt_1") < 35) : {_mine = "salt"; _val = 4;};
	case (player distance (getMarkerPos "sand_1") < 35) : {_mine = "sand"; _val = 5;};
	case (player distance (getMarkerPos "diamond_1") < 35): {_mine = "diamond"; _val = 1;};
	case (player distance (getMarkerPos "oil_1") < 35) : {_mine = "oilu"; _val = 1;};
	case (player distance (getMarkerPos "oil_2") < 35) : {_mine = "oilu"; _val = 1;};
	case (player distance (getMarkerPos "rock_1") < 35): {_mine = "rock"; _val = 2;};
	case (player distance (getMarkerPos "uran_1") < 35): {_mine = "uranu"; _val = 1;};
	case (player distance (getMarkerPos "silber_1") < 35): {_mine = "silberu"; _val = 2;};
	case (player distance (getMarkerPos "gold_1") < 35): {_mine = "goldu"; _val = 1;};
	case (player distance (getMarkerPos "kristall_1") < 35) : {_mine = "kristall"; _val =1;};
	default {_mine = "";};
};
//Mine check
if(_mine == "") exitWith {hint localize "STR_ISTR_Pick_NotNear"};
if(vehicle player != player) exitWith {hint localize "STR_ISTR_Pick_MineVeh";};

if(life_action_gather) exitWith {}; // Q-Spam verhindern

_playerUserID = getPlayerUID player;
	// Wenn Ergeben, dann nix Farmen, sondern ""Admin Report"" ;D
if((_mine != "") && player getVariable ["surrender", false]) exitWith {
	life_action_gather = true; 			// Long text of doom haha
	hint parseText format ["<t color='#ff0000' size='2' align='center'>ACHTUNG</t><br/><br/><t align='center'>Solltest du gerade versucht haben einen Farm-Bug auszunutzen, mache dich darauf gefasst, dass ein Admin dich ggf. wegen Bug-Using sperren wird!<br/>Ein Admin wurde bereits kontaktiert.</t><br/><br/><br/><t color='#00ccff' size='1.2'>Spieler:</t> %1<br/><t color='#00ccff' size='1.2'>UID:</t> %2", profileName, _playerUserID];
	sleep 5;	// Strafe muss sein -> 5 Sekunden lang nichts tun.
	player setVariable ["surrender", true];
};

_diff = [_mine,_val,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_diff == 0) exitWith {hint localize "STR_NOTF_InvFull"};
life_action_gather = true;
for "_i" from 0 to 2 do
{
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	sleep 2.5;
};

if(([true,_mine,_diff] call life_fnc_handleInv)) then
{
	_itemName = [([_mine,0] call life_fnc_varHandle)] call life_fnc_varToStr;
	titleText[format[localize "STR_ISTR_Pick_Success",_itemName,_diff],"PLAIN"];
};

life_action_gather = false;