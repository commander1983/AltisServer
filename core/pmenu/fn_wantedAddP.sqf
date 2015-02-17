private["_unit","_amount","_copName"];
if(playerSide != west) exitWith {hint "Was glaubst du wer du bist? Auf jedenfall kein Polizist."};
if((lbCurSel 2406) == -1) exitWith {hint "Du musst eine Person auswählen!"};
if((lbCurSel 2407) == -1) exitWith {hint "Du musst ein Verbrechen aus der Kartei auswählen!"};
_unit = lbData [2406,lbCurSel 2406];
_unit = call compile format["%1",_unit];
_amount = lbData [2407,lbCurSel 2407];
_copName = profileName;
if(isNil "_unit") exitWith {};
if(isNull _unit) exitWith {};
if(_unit == player) exitWith {hint "Genau! Schreibe dich doch selbst zur Fahndung aus.";};
if((side _unit == west) OR (side _unit == east) OR (side _unit == independent)) exitWith {hint "Du kannst keine Beamten zur Fahndung ausschreiben.";};

[[1,format["%1 wurde von %2 zur Fahndung ausgeschrieben.",_unit getVariable["realname",name _unit],_copName,_amount,getPlayerUID _unit]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;

[[getPlayerUID _unit,_unit getVariable["realname",name _unit],_amount],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;