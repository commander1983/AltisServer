/*
	File: fn_adacLoadout.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Loads the medic out with the default gear.
*/
private["_handle"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

player addUniform  "U_I_HeliPilotCoveralls";
player addBackpack "B_Carryall_oli";
player addItem "FirstAidKit";
player addItem "Repairkit";

player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemRadio";
player assignItem "ItemRadio";

[] spawn life_fnc_updateClothing;
[] call life_fnc_adacsaveGear;