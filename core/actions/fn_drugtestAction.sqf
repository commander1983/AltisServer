private["_unit","_dText","_meth","_weed","_heroin","_cocaine","_lsd","_alk","_moon"];

_unit = cursorTarget;
if(isNull _unit) exitWith {};

hint "Teste nach Drogen & Alkohol...";
sleep 2;

if(player distance _unit > 5 || !alive player || !alive _unit) exitWith {hint "Test fehlgeschlagen."};

if(_unit getVariable["drug_meth",false]) then { _meth = "Positiv"; } else { _meth = "Negativ"; };
if(_unit getVariable["drug_weed",false]) then { _weed = "Positiv"; } else { _weed = "Negativ"; };
if(_unit getVariable["drug_heroin",false]) then { _heroin = "Positiv"; } else { _heroin = "Negativ"; };
if(_unit getVariable["drug_cocaine",false]) then { _cocaine = "Positiv"; } else { _cocaine = "Negativ"; };
if(_unit getVariable["drug_lsd",false]) then { _lsd = "Positiv"; } else { _lsd = "Negativ"; };
if(_unit getVariable["drug_alk",false]) then { _alk = "Positiv"; } else { _alk = "Negativ"; };
if(_unit getVariable["drug_moon",false]) then { _moon = "Positiv"; } else { _moon = "Negativ"; };

hint parseText format["
<t color='#FF0000'><t size='2'>%1</t></t><br/>
<t color='#FFD700'>Methamphetamin: </t>%2<br/>
<t color='#FFD700'>Mariuhana: </t>%3<br/>
<t color='#FFD700'>Heroin: </t>%4<br/>
<t color='#FFD700'>Kokain: </t>%5<br/>
<t color='#FFD700'>LSD: </t>%6<br/><br/>
<t color='#FFD700'>Alkohol: </t>%7<br/>
<t color='#FFD700'>Moonshine: </t>%8<br/>"
,name _unit,_meth,_weed,_heroin,_cocaine,_lsd,_alk,_moon];