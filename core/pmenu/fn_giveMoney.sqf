/*
	File: fn_giveMoney.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gives the selected amount of money to the selected player.
*/
private["_unit","_amount"];
_amount = ctrlText 2018;
ctrlShow[2001,false];
if((lbCurSel 2022) == -1) exitWith {hint "Niemand wurde ausgewählt!";ctrlShow[2001,true];};
_unit = lbData [2022,lbCurSel 2022];
_unit = call compile format["%1",_unit];
if(isNil "_unit") exitWith {ctrlShow[2001,true];};
if(_unit == player) exitWith {ctrlShow[2001,true];};
if(isNull _unit) exitWith {ctrlShow[2001,true];};

//A series of checks *ugh*
if(!life_use_atm) exitWith {hint "Du hast die Bank ausgeraubt! Du kannst jetzt kein Geld weitergeben.";ctrlShow[2001,true];};
if(!([_amount] call TON_fnc_isnumber)) exitWith {hint "Gib eine Zahl ein!";ctrlShow[2001,true];};
if(parseNumber(_amount) <= 0) exitWith {hint "Du musst eine gültige Zahl eingeben!";ctrlShow[2001,true];};
if(parseNumber(_amount) > ja_dzep) exitWith {hint "Soviel hast du nicht!!";ctrlShow[2001,true];};
if(player getVariable ["restrained", true]) exitWith {hint "Du kannst kein Geld weitergeben, während du gefesselt bist!";ctrlShow[2001,true];};
if(player getVariable ["surrender", false]) exitWith {hint "Du kannst kein Geld weitergeben, während du dich ergibst!";ctrlShow[2001,true];};
if(isNull _unit) exitWith {ctrlShow[2001,true];};
if(isNil "_unit") exitWith {ctrlShow[2001,true]; hint "Der Spieler ist zu weit weg!";};
hint format["Du hast %1€ %2 gegeben.",[(parseNumber(_amount))] call life_fnc_numberText,_unit getVariable["realname",name _unit]];
ja_dzep = ja_dzep - (parseNumber(_amount));
[0] call SOCK_fnc_updatePartial;
[[_unit,_amount,player],"life_fnc_receiveMoney",_unit,false] spawn life_fnc_MP;
[] call life_fnc_p_updateMenu;

ctrlShow[2001,true];