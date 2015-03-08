#include <macro.h>
/*
	
	file: fn_newMsg.sqf
	Author: Silex
	
*/

private["_to","_type","_playerData","_msg"];
disableSerialization;

_type = [_this,0,-1] call BIS_fnc_param;
_playerData = [_this,1,-1] call BIS_fnc_param;
_msg = [_this,2,"",[""]] call BIS_fnc_param;

_display = findDisplay 88888;
_cPlayerList = _display displayCtrl 88881;
_cMessageEdit = _display displayCtrl 88884;

switch(_type) do
{
	case 0:
	{
		life_smartphoneTarget = call compile format["%1",_playerData];
		ctrlSetText[88886, format["Nachricht an: %1",name life_smartphoneTarget]];
		if((__GETC__(life_adminlevel) < 1)) then
		{
			ctrlShow[888897,false];
		};
	};
	//normal message
	case 1:
	{
		if(isNUll life_smartphoneTarget) exitWith {hint format["Du hast keine Person ausgwählt!"];};
		ctrlShow[88885, false];
		if(_msg == "") exitWith {hint "Du musst eine Nachricht eingeben!";ctrlShow[88885, true];};
		[[life_smartphoneTarget,_msg,player,0],"TON_fnc_handleMessages",false] spawn life_fnc_MP;
		hint format["Du hast %1 folgende Nachricht gesendet: %2",name life_smartphoneTarget,_msg];	
		ctrlShow[88885, true];
		closeDialog 88883;
	};
	//copmessage
	case 2:
	{
		if(({side _x == west} count playableUnits) == 0) exitWith {hint format["Zurzeit befindet sich kein Polizeibeamter im Dienst. Bitte probieren Sie es später erneut."];};
		ctrlShow[888895,false];
		if(_msg == "") exitWith {hint "Du musst eine Nachricht eingeben!";ctrlShow[888895,true];};
		[[ObjNull,_msg,player,1],"TON_fnc_handleMessages",false] spawn life_fnc_MP;
		_to = "der Polizei";
		hint format["Du hast %1 folgenden Notruf gesendet: %2",_to,_msg];
		ctrlShow[888895,true];
		closeDialog 887890;
	};
	//msgadmin
	case 3:
	{
		ctrlShow[888896,false];
		if(_msg == "") exitWith {hint "Du musst eine Nachricht eingeben!";ctrlShow[888896,true];};
		[[ObjNull,_msg,player,2],"TON_fnc_handleMessages",false] spawn life_fnc_MP;
		_to = "den Admins";
		hint format["Du hast %1 folgende Nachricht gesendet: %2",_to,_msg];
		ctrlShow[888896,true];
		closeDialog 887890;
	};
	//emsrequest
	case 4:
	{
		if(({side _x == independent} count playableUnits) == 0) exitWith {hint format["Zurzeit befindet sich kein Sanitäter im Dienst. Bitte probieren Sie es später erneut."];};
		//ctrlShow[888899,false];
		if(_msg == "") exitWith {hint "Du musst eine Nachricht eingeben!";ctrlShow[888899,true];};
		[[ObjNull,_msg,player,3],"TON_fnc_handleMessages",false] spawn life_fnc_MP;
		hint parseText format["Du hast den Sanitätern folgenden Notruf gesendet: %1",_msg];
		//ctrlShow[888899,true];
		closeDialog 887890;
	};
	//adminToPerson
	case 5:
	{
		if((call life_adminlevel) < 1) exitWith {hint "Du bist kein Admin!";};
		if(isNULL life_smartphoneTarget) exitWith {hint format["Es wurde keine Person ausgwählt!"];};
		if(_msg == "") exitWith {hint "Du musst eine Nachricht eingeben!";};
		[[life_smartphoneTarget,_msg,player,4],"TON_fnc_handleMessages",false] spawn life_fnc_MP;
		hint format["Du hast folgende Adminnachricht an %1 gesendet: %2",name life_smartphoneTarget,_msg];
		closeDialog 88883;
	};
	//emergencyloading
	case 6:
	{
		if((__GETC__(life_adminlevel) < 1)) then
		{
			ctrlShow[888898,false];
			ctrlShow[888896,true];
		} else {
			ctrlShow[888898,true];
			ctrlShow[888896,false];
		};
	};
	//adminMsgAll
	case 7:
	{
		if((call life_adminlevel) < 1) exitWith {hint "Du bist kein Admin!";};
		if(_msg == "") exitWith {hint "Du musst eine Nachricht eingeben!";};
		[[ObjNull,_msg,player,5],"TON_fnc_handleMessages",false] spawn life_fnc_MP;
		hint format["Eine Adminnachricht wurde an jeden gesendet: %1",_msg];
		closeDialog 887890;
	};
	
	//adacrequest
	case 8:
	{
		if(({side _x == east} count playableUnits) == 0) exitWith {hint format["Zurzeit befindet sich kein Pannenhelfer im Dienst. Bitte probieren Sie es später erneut."];};
		//ctrlShow[888900,false];
		if(_msg == "") exitWith {hint "Du musst eine Nachricht eingeben!";ctrlShow[888900,true];};
		[[ObjNull,_msg,player,6],"TON_fnc_handleMessages",false] spawn life_fnc_MP;
		hint format["Du hast den Pannenhelfern folgende Nachricht gesendet: %1 ",_msg];
		//[] spawn life_fnc_adaceinsatz;
		//ctrlShow[888900,true];
		closeDialog 887890;
	};
	//coptozivi
	case 9:
	{
		if(side player == west && __GETC__(life_coplevel) < 4) exitWith {
			hint "Dazu bist du nicht berechtigt!";
		};
		if(side player == east && __GETC__(life_adaclevel) < 2) exitWith {
			hint "Dazu bist du nicht berechtigt!";
		};
		if(side player == independent && __GETC__(life_mediclevel) < 2) exitWith {
			hint "Dazu bist du nicht berechtigt!";
		};
		if(side player == civilian) exitWith {
			hint "Dazu bist du nicht berechtigt!";
		};
		if(_msg == "") exitWith {
			hint "Du musst eine Nachricht eingeben!";
		};
		[[ObjNull,_msg,player,7],"TON_fnc_handleMessages",false] spawn life_fnc_MP;
		hint format["Folgender Rundfunk wurde gesendet: %1",_msg];
		closeDialog 888910;
	};
};