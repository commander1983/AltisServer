/* 
	fn_diskolights.sqf
*/
_trueorfalse = disko_light getVariable["diskolights",FALSE];

if(_trueorfalse) then {
	disko_light setVariable["diskolights",FALSE,TRUE];
	hint "Schaltet lichter aus.";
} else {
	disko_light setVariable["diskolights",TRUE,TRUE];
	[[disko_light,0.22],"life_fnc_diskolightsOn",true,false] call life_fnc_MP;
};