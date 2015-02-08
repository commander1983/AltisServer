/*
	File: fn_pardon.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Pardons the selected player.
*/
private["_display","_list","_uid","_copname"];
disableSerialization;
if(playerside != west) exitWith {};

_display = findDisplay 2400;
_list = _display displayCtrl 2402;
_data = lbData[2401,(lbCurSel 2401)];
_data = call compile format["%1", _data];
if(isNil "_data") exitWith {};
if(typeName _data != "ARRAY") exitWith {};
if(count _data == 0) exitWith {};

_uid = _data select 0;
[[_uid],"life_fnc_wantedPardon",false,false] spawn life_fnc_MP;
_copname = profileName;
/*
diag_log format ["|| Wanted+ || %1 nahm eine Person (%2) von der Fahndungsliste!", _copname, _uid]; // Log-Eintrag vornehmen, wenn jemand wen von der Fahndungsliste streicht.
*/
diag_log format ["|| Wanted+ || %1 nahm eine Person (%2) von der Fahndungsliste!", _copname, _uid];