/*
	File: fn_questionDealer.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Questions the drug dealer and sets the sellers wanted.
*/
private["_sellers","_names"];
_sellers = (_this select 0) getVariable["sellers",[]];
if(count _sellers == 0) exitWith {hint localize "STR_Cop_DealerQuestion";}; //No data.
if(ja_dzep < 7500) exitWith {hint "Ohne Knete keine Infos, yo.";};
life_action_inUse = true;
_names = "";
{
	if(_x select 2 > 75000) then
	{
		_val = round((_x select 2) / 16);
	};
	[[_x select 0,_x select 1,"483",_val],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
	_names = _names + format["%1<br/>",_x select 1];
} foreach _sellers;
ja_dzep = ja_dzep - 7500;
hint parseText format["<t color='#D66321' size='2.2'>Kundenliste</t><br/><t size='1.4'>Folgende Personen haben bei mir ihren Stoff verkauft:</t>" + "<br/><br/><t color='#31ADA5' size='1.3'>%1</t>",_names];
(_this select 0) setVariable["sellers",[],true];
life_action_inUse = false;