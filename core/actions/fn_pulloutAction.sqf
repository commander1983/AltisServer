/*
	File: fn_pulloutAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Pulls civilians out of a car if it's stopped.
*/
private["_crew"];
_crew = crew cursorTarget;
{
	_x setVariable ["transporting",false,true]; _x setVariable ["Escorting",false,true];
	[[_x],"life_fnc_pulloutVeh",_x,false] spawn life_fnc_MP;
	//[[2,format["== Du wurdest von %1 aus dem Fahrzeug gezogen ==",profileName]],"life_fnc_broadcast",_x,false] spawn life_fnc_MP;
} foreach _crew;