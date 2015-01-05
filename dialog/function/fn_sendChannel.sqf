/*
	File: fn_sendChannel.sqf
	Author: alleskapot & Lifted
	Thanks again for all the help alleskapot!
	Description:
	Ermöglicht senden bzw. die Abfrage des Geschriebenen.

*/

private["_message"];
disableSerialization;

waitUntil {!isnull (findDisplay 9000)};

_message = ctrlText 9001;
[[3,format ["Channel 7 News: %1",_message]],"life_fnc_broadcast",true,false] call life_fnc_MP;