/*

	Player clicked arrest/ok

*/

private ["_time"];

if(playerSide != west) exitWith {};
if(isNil "life_pInact_curTarget") exitWith {hint "Ungültiges Ziel."};

//Get minutes
_time = ctrlText 1400;


if(! ([_time] call fnc_isnumber)) exitWith
{
	hint "Du musst eine Zahl eingeben.";
};

_time = parseNumber _time; //requested number
_time = round _time;

if(_time < 5 || _time > 40) exitWith { hint "Du kannst Personen nur für 5-40 Minuten in das Gefängnis stecken!"; };

closeDialog 0; 
[life_pInact_curTarget, _time] call life_fnc_arrestAction;