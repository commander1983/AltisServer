#include <macro.h>
/*
	File: fn_impoundMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Not actually a impound menu, may act as confusion to some but that is what I wanted.
	The purpose of this menu is it is now called a 'Garage' where vehicles are stored (persistent ones).
*/
private["_vehicles","_control","_garagenautos"];
disableSerialization;
_vehicles = [_this,0,[],[[]]] call BIS_fnc_param;
_restore = [_this,1,[],[[]]] call BIS_fnc_param;

_garagenautos = true;
_restoring = true;

ctrlShow[2803,false];
ctrlShow[2830,false];
waitUntil {!isNull (findDisplay 2800)};

if(count _vehicles == 0) then {
    _garagenautos = false;
	ctrlSetText[2811,localize "STR_Garage_NoVehicles"];
};
/*
if(count _restore == 0) then
{
    _restoring = false;
};

if (_garagenautos) then {

_control = ((findDisplay 2800) displayCtrl 2802);
lbClear _control;


{
	_vehicleInfo = [_x select 2] call life_fnc_fetchVehInfo;
	_control lbAdd (_vehicleInfo select 3);
	_tmp = [_x select 2,_x select 8];
	_tmp = str(_tmp);
	_control lbSetData [(lbSize _control)-1,_tmp];
	_control lbSetPicture [(lbSize _control)-1,_vehicleInfo select 2];
	_control lbSetValue [(lbSize _control)-1,_x select 0];
} foreach _vehicles;

ctrlShow[2810,false];
ctrlShow[2811,false];

};
*/
if (_restoring) then {

_control = ((findDisplay 2800) displayCtrl 2802);

_control lbAdd "--------Kaputte Fahrzeuge--------";

{
	_vehicleInfo = [_x select 2] call life_fnc_fetchVehInfo;
	_control lbAdd (_vehicleInfo select 3);
	_tmp = [_x select 2,_x select 8];
	_tmp = str(_tmp);
	_control lbSetData [(lbSize _control)-1,_tmp];
	_control lbSetPicture [(lbSize _control)-1,_vehicleInfo select 2];
	_control lbSetValue [(lbSize _control)-1,_x select 0];
} foreach _restore;

ctrlShow[2810,false];
ctrlShow[2811,false];

};