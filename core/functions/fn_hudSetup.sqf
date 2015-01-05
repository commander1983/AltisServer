/*
	File: fn_hudSetup.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Setups the hud for the player?
*/
private["_display","_alpha","_version","_p","_pg"];
disableSerialization;
_display = findDisplay 46;
_alpha = _display displayCtrl 1001;
_version = _display displayCtrl 1000;

2 cutRsc ["playerHUD","PLAIN"];
_version ctrlSetText format["BETA: 0.%1.%2",(productVersion select 2),(productVersion select 3)];
[] call life_fnc_hudUpdate;

[] spawn
{
	private["_dam","_cash"];
	while {true} do
	{
		_dam = damage player;
		_cash  = ja_dzep + ja_pare;
		waitUntil {((damage player) != _dam) || _cash != ja_dzep + ja_pare};
		[] call life_fnc_hudUpdate;
	};
};