/*
	File: fn_medicRequest.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Notifies the medics that someone has requested emergency and prompts them
	if they want to take the request or not.
*/
private["_caller","_callerName"];
_caller = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_callerName = [_this,1,"Unknown Player",[""]] call BIS_fnc_param;
if(isNull _caller) exitWith {}; //Bad data

["MedicalRequestEmerg",[format[localize "STR_Medic_Request",_callerName]]] call BIS_fnc_showNotification;
{switch (side _x) do {
		case independent: {playSound "med_notif"};
};} 
foreach playableUnits;
[[4,format["<t color='#FF9900' size='2.3'>Notruf</t><br/><br/><t size='1.3'>%1</t><br/><t size='1.2'> benötigt medizinische Hilfe!</t>", _callerName]],"life_fnc_broadcast",independent,false] spawn life_fnc_MP;};