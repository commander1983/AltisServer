#include <macro.h>
/*
	File: fn_unimpound.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Yeah... Gets the vehicle from the garage.
*/
private["_vehicle","_vid","_pid","_unit","_price"];
disableSerialization;
if(lbCurSel 2802 == -1) exitWith {hint localize "STR_Global_NoSelection"};
_vehicle = lbData[2802,(lbCurSel 2802)];
_vehicle = (call compile format["%1",_vehicle]) select 0;
_vid = lbValue[2802,(lbCurSel 2802)];
_restorehelper = _vehicle;
if (_restorehelper == "--------Kaputte Fahrzeuge--------") exitWith {}; //somit werden die Kaputten Fahrzeuge von den ganzen getrennt
_pid = getPlayerUID player;
_unit = player;

if(isNil "_vehicle") exitWith {hint localize "STR_Garage_Selection_Error"};

_price = [_vehicle,__GETC__(life_garage_prices)] call TON_fnc_index;
if(_price == -1) then {_price = 1000;} else {_price = (__GETC__(life_garage_prices) select _price) select 1;};
if(ja_pare < _price) exitWith {hint format[(localize "STR_Garage_CashError"),[_price] call life_fnc_numberText];};

fahrzeug_kaputt = false;

[[_vid,_pid,_unit],"DB_fnc_fahrzeug_kaputt",false,false] call life_fnc_MP;  //kaputte Fahrzeuge werden ausgeparkt

_restoreprice = 0;
if (fahrzeug_kaputt) then {
    _restoreprice = _price *100;
};

if (life_atmcash < _restoreprice) exitWith {hint format ["Du brauchst zur Wiederherstellung des Fahrzeugs %1€.",_restoreprice];};

if(typeName life_garage_sp == "ARRAY") then {
	[[_vid,_pid,life_garage_sp select 0,_unit,_price,life_garage_sp select 1],"TON_fnc_spawnVehicle",false,false] spawn life_fnc_MP;
} else {
	if(life_garage_sp in ["medic_spawn_1","medic_spawn_2","medic_spawn_3","medic_spawn_4"]) then {
		[[_vid,_pid,life_garage_sp,_unit,_price],"TON_fnc_spawnVehicle",false,false] spawn life_fnc_MP;
	} else {
		[[_vid,_pid,(getMarkerPos life_garage_sp),_unit,_price,markerDir life_garage_sp],"TON_fnc_spawnVehicle",false,false] spawn life_fnc_MP;
	};
};

hint localize "STR_Garage_SpawningVeh";

life_atmcash = life_atmcash - _restoreprice;

ja_pare = ja_pare - _price;