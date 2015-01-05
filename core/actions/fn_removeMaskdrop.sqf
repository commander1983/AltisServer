private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit) exitWith {};
sleep 2;
if(player distance _unit > 5 || !alive player || !alive _unit) exitWith {hint "ich kann diese Person nicht dursuchen."};
[[player],"life_fnc_maskdrop",_unit,false] spawn life_fnc_MP;