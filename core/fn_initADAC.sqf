#include <macro.h>
/*
	File: fn_initADAC.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	ADAC Initialization file.
*/
private["_end"];
player addRating 9999999;
waitUntil {!(isNull (findDisplay 46))};
_end = false;

_igiload = execVM "IgiLoad\IgiLoadInit.sqf";

if((__GETC__(life_adacLevel)) < 1) exitWith {
	["Notwhitelisted",FALSE,TRUE] call BIS_fnc_endMission;
	sleep 35;
};

//Show Ranks
player setVariable["adaclevel", __GETC__(life_adacLevel), true];

[] call life_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.

[] spawn
{
while {(uniform player) == "U_C_WorkerCoveralls"} do
    {
	switch (__GETC__(life_adaclevel)) do 
		{
			case 1: {
			player setObjectTextureGlobal [0,"images\kleidung\adac_1.jpg"];
			};
			
			case 2: {
			player setObjectTextureGlobal [0,"images\kleidung\adac_1.jpg"];
			};
			
			case 3: {
			player setObjectTextureGlobal [0,"images\kleidung\adac_1.jpg"];
			};
			
			case 4: {
			player setObjectTextureGlobal [0,"images\kleidung\adac_1.jpg"];
			};
			
			case 5: {
			player setObjectTextureGlobal [0,"images\kleidung\adac_1.jpg"];
			};
		};
    if(backpack player != "") then {(unitBackpack player) setObjectTextureGlobal [0,""];};
    sleep 30;
    };
};