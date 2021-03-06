/*
	File: fn_removeItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Removes the selected item & amount to remove from the players
	virtual inventory.
*/
private["_data","_value","_obj","_pos","_ind"];
disableSerialization;
_data = lbData[2005,(lbCurSel 2005)];
_value = ctrlText 2010;
if(_data == "") exitWith {hint "Du hast nichts zum entfernen ausgewählt.";};
if(!([_value] call TON_fnc_isnumber)) exitWith {hint "Du hast keine gültige Zahl eingegeben."};
if(parseNumber(_value) <= 0) exitWith {hint "Du musst eine Menge eingeben."};
_ind = [_data,life_illegal_items] call TON_fnc_index;
if(_ind != -1 && side player == civilian) exitWith {hint "Das ist ein illegales Item. Du kannst es nicht entfernen.";};
if(player != vehicle player) exitWith {titleText["Du kannst keine Items entfernen wenn du im Fahrzeug bist!","PLAIN"]};
if(player getVariable ["restrained", true]) exitWith {hint "Du kannst keine Items entfernen, während du gefesselt bist!";};
if(player getVariable ["surrender", false]) exitWith {hint "Du kannst keine Items entfernen, während du dich ergibst!";};
if(!([false,_data,(parseNumber _value)] call life_fnc_handleInv)) exitWith {hint "Du kannst nicht so viele Items auswählen."};
_type = [_data,0] call life_fnc_varHandle;
_type = [_type] call life_fnc_varToStr;
hint format["Du hast %1 %2 aus deinem Inventar entfernt.",(parseNumber _value), _type];
	
[] call life_fnc_p_updateMenu;