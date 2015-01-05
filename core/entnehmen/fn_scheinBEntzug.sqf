/*
Datei : fn_scheinBEntzug.sqf
*/
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit) exitWith {}; //Not valid

[[_unit,false],"life_fnc_scheinBEntzugNow",_unit,false] spawn life_fnc_MP;