/* 
	fn_diskomusik.sqf
*/
if((disko getVariable["disko_musik",false])) exitWith
{
	hint "Schaltet Musik aus.";
	sleep 80;
	disko setVariable["disko_musik",false,true];

};
disko setVariable["disko_musik",true,true];

while {(disko getVariable["disko_musik",false])} do
{
	[disko,"disko1"] call life_fnc_globalSound;
	sleep 72;
};