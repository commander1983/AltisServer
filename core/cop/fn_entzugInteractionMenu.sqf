/*
	File: fn_copInteractionMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Replaces the mass addactions for various cop actions towards another player.
*/
#define Btn1 8001
#define Btn2 8002
#define Btn3 8003
#define Btn4 8004
#define Btn5 8005
#define Btn6 8006

private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6"];

createDialog "pInteraction_entzug";

disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target

if(!isPlayer _curTarget && side _curTarget == civilian) exitWith {closeDialog 0;}; //Bad side check?
_display = findDisplay 37400;
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_Btn3 = _display displayCtrl Btn3;
_Btn4 = _display displayCtrl Btn4;
_Btn5 = _display displayCtrl Btn5;
_Btn6 = _display displayCtrl Btn6;
life_pInact_curTarget = _curTarget;

_Btn1 ctrlSetText localize "STR_pInAct_checkLicenses";
_Btn1 buttonSetAction "[[player],""life_fnc_licenseCheck"",life_pInact_curTarget,FALSE] spawn life_fnc_MP; closeDialog 0;";

_Btn2 ctrlSetText localize "STR_pInAct_driverfalseB";
_Btn2 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_scheinBEntzug; closeDialog 0;";

_Btn3 ctrlSetText localize "STR_pInAct_driverfalseC";
_Btn3 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_scheinCEntzug; closeDialog 0;";

_Btn4 ctrlSetText localize "STR_pInAct_driverfalseP";
_Btn4 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_scheinWaffenEntzug; closeDialog 0;";

_Btn5 ctrlSetText localize "STR_pInAct_driverfalsePerm";
_Btn5 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_scheinPermEntzug; closeDialog 0;";

_Btn6 ctrlSetText localize "STR_pInAct_driverfalseWaffen";
_Btn6 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_scheinWaffenEntzug; closeDialog 0;";