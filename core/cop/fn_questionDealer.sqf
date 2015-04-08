/*
	File: fn_questionDealer.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Questions the drug dealer and sets the sellers wanted.
*/
private["_sellers","_names","_val"];
_sellers = (_this select 0) getVariable["sellers",[]];
if(ja_dzep < 10000) exitWith {hint localize "STR_Cop_DealerQuestionNoMoney";};
if(count _sellers == 0) exitWith {hint localize "STR_Cop_DealerQuestionZuerstMoney"; ja_dzep = ja_dzep - 10000; sleep 3; hint localize "STR_Cop_DealerQuestion";}; //No data.
	// prozentuale Chance und Geld benoetigt zusammen mit bekoo und mantis besprochen.54015
_chance = random(100);
if(_chance >=45) then {	//55 proz. Chance dass er Infos ausspuckt.
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
	hint localize "STR_Cop_DealerQuestionZuerstMoney";
	ja_dzep = ja_dzep - 10000;
	sleep 3;
	hint localize "STR_Cop_DealerQuestionKenneNamen";
	sleep 5;
	hint parseText format["<t color='#D66321' size='2.2'>Kundenliste</t><br/><t size='1.4'>Folgende Personen haben bei mir ihren Stoff verkauft:</t>" + "<br/><br/><t color='#31ADA5' size='1.3'>%1</t>",_names];
	(_this select 0) setVariable["sellers",[],true];
	life_action_inUse = false;
} else {
	hint localize "STR_Cop_DealerQuestionZuerstMoney";
	ja_dzep = ja_dzep - 10000;
	sleep 3;
	hint localize "STR_Cop_DealerQuestionVerziehDich";
};
[0] call SOCK_fnc_updatePartial;	//Wir wollen ja nicht haben, dass man ausversehen die Verbindung verliert... ;D