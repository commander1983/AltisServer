/*
Datei : fn_scheinPermEntzug.sqf
*/
private["_unit","_cop"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_cop = profileName;
if(isNull _unit) exitWith {}; //Not valid

[[_unit,false],"life_fnc_scheinPermEntzugNow",_unit,false] spawn life_fnc_MP;

[[1,format["%1 hat dir deinen Führerschein (Permanent) entzogen!",_cop]],"life_fnc_broadcast",_unit,false] spawn life_fnc_MP;
[[1,format["%1 hat %2's Führerschein (Permanent) entzogen!",_cop,name _unit]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;