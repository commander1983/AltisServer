#include <macro.h>
/*
	File: fn_initMedic.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initializes the medic..
*/
private["_end"];
player addRating 99999999;
waitUntil {!(isNull (findDisplay 46))};

if((__GETC__(life_medicLevel)) < 1) exitWith {
	["Notwhitelisted",FALSE,TRUE] call BIS_fnc_endMission;
	sleep 35;
};

switch (__GETC__(life_medicLevel)) do 
			{
	             case 1: {life_paycheck = life_paycheck + 500;}; // Rank 1
	             case 2: {life_paycheck = life_paycheck + 500;}; // Rank 2
	             case 3: {life_paycheck = life_paycheck + 750;}; // Rank 3
	             case 4: {life_paycheck = life_paycheck + 1200;}; // Rank 4
	             case 5: {life_paycheck = life_paycheck + 1500;}; // Rank 5 
			};

//Show Ranks
player setVariable["medlevel", __GETC__(life_medicLevel), true];

[] call life_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.

[] spawn
{
while {(uniform player) == "U_Rangemaster"} do
    {
	switch (__GETC__(life_medicLevel)) do 
		{
			case 1: {
			player setObjectTextureGlobal [0,"images\kleidung\med_0.jpg"];
			};
			
			case 2: {
			player setObjectTextureGlobal [0,"images\kleidung\med_1.jpg"];
			};
			
			case 3: {
			player setObjectTextureGlobal [0,"images\kleidung\med_1.jpg"];
			};
			
			case 4: {
			player setObjectTextureGlobal [0,"images\kleidung\med_1.jpg"];
			};
			
			case 5: {
			player setObjectTextureGlobal [0,"images\kleidung\med_1.jpg"];
			};
		};
    if(backpack player != "") then {(unitBackpack player) setObjectTextureGlobal [0,""];};
    sleep 30;
    };
};