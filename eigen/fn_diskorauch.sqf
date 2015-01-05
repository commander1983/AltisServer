/* 
	fn_diskorauch.sqf
*/
if((nebelmaschiene getVariable["disko_nebelmaschiene",false])) exitWith
{
	hint "Schaltet Nebelmaschiene aus.";
	nebelmaschiene setVariable["disko_nebelmaschiene",false,true];
};
nebelmaschiene setVariable["disko_nebelmaschiene",true,true];
hint "Schaltet Nebelmaschiene ein.";

while {(nebelmaschiene getVariable["disko_nebelmaschiene",false])} do
{
	_smoke = "SmokeShell" createVehicle getMarkerPos "smoke";
	hideObject _smoke;
	sleep 60;
};