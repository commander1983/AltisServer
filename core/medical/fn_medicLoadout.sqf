/*
	File: fn_medicLoadout.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Loads the medic out with the default gear.
*/
private["_handle"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

player addUniform  "U_Rangemaster";
player addBackpack "B_Carryall_oli";
player addItem "FirstAidKit";
player addItem "Medikit";

player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemRadio";
player assignItem "ItemRadio";

[] spawn life_fnc_updateClothing;
[] call life_fnc_medicsaveGear;