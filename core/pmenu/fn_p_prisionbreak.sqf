/*
	File: fn_p_prisionbreak.sqf
	Author: Herman "Mordin" Othelius
	Based on wantedlist by: Bryan "Tonic" Boardwine"
*/
private["_shop","_display","_list","_array","_units","_Btn1","_unit"];
_shop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
disableSerialization;
if((playerSide == independent) OR (playerSide == east)) exitWith {hint parseText format ["<t size='2'>APBO_SL v2.0</t><br/><t color='#ff0000' size='1.5' align='center'>ERROR</t><br/><br/><t size='1.3'>SystemHack Rejected!</t><br/>Fehler in <t color='#66ffff'>apbo.sl.inject_hack.side</t><br/>Dazu haben Sie keine Berechtigung. Authentifizierung Erforderlich"];};
if(player distance _shop > 2) exitWith {};	// Distanz zu gross
if(playersNumber west < 5) exitWith {	// Check for cops online - 5 minimum
	hint parseText format ["<t size='2'>APBO_SL v2.0</t><br/><t color='#ff0000' size='1.5' align='center'>ERROR</t><br/><br/><t size='1.3'>SystemHack Rejected!</t><br/>Fehler in <t color='#66ffff'>apbo.sl.inject_hack</t><br/>System ist offline. Versuchen Sie es später erneut!"];
};

createDialog "life_prision_list";
_display = findDisplay 8100;
_list = _display displayCtrl 8101;
lbClear _list;
ctrlSetText[8104,"APBO_SL v2.0 - Hacking..."];
_list = _display displayctrl 8101;
_units = [];
{
	if(side _x == civilian) then {_units pushBack _x;};
} 

forEach nearestObjects [getMarkerPos "jail_marker",["Man"],17]; 
// 15 = distance from jail_marker
// this adds all the prisioners around the jail_marker within 15 meters

{
	_temp = format["%1", _x];
	if(["civ", _temp, false] call BIS_fnc_inString) then {
	_list lbAdd format["%1", (_x getVariable["realname",name _x])];
	_list lbSetData [(lbSize _list)-1,str(_x)];
	};
} forEach _units;
ctrlSetText[8104,"APBO_SL v2.0 - Hacked!"];
if(((lbSize _list)-1) == -1) then
{
	_display closeDisplay 8100;
	hint parseText format ["<t size='2'>APBO_SL v2.0</t><br/><t color='#ff0000' size='1.5' align='center'>ERROR</t><br/><br/><t size='1.3'>PlayerFinder Rejected!</t><br/>Fehler in <t color='#66ffff'>apbo.sl.player_find</t><br/>Es wurde keinen Eintrag in der Datenbank des Staatsgefängnises gefunden!"];
};