#include <macro.h>
/*
	File: fn_initCop.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Cop Initialization file.
*/
private["_end"];

player addRating 9999999;
waitUntil {!(isNull (findDisplay 46))};
_end = false;
if(life_blacklisted) exitWith
{
	["Blacklisted",false,true] call BIS_fnc_endMission;
	sleep 30;
};

if((str(player) in ["cop_1","cop_2","cop_3"])) then {
	if((__GETC__(life_adminlevel) == 0)) then {
		["Only4Admins",false,true] call BIS_fnc_endMission;
		sleep 30;
	};
};

if((str(player) in ["cop_4","cop_5","cop_6","cop_7","cop_8","cop_9","cop_10","cop_11","cop_12","cop_13","cop_14","cop_15","cop_16","cop_17","cop_18","cop_19","cop_20","cop_21","cop_22","cop_23","cop_24","cop_25","cop_26","cop_27","cop_28"])) then {
	if((__GETC__(life_coplevel) == 0) && (__GETC__(life_adminlevel) < 1)) then {
		["Only4Whitelisted",false,true] call BIS_fnc_endMission;
		sleep 30;
	};
};

//Show Ranks
player setVariable["coplevel", __GETC__(life_coplevel), true];


[] call life_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.

[] spawn
{
while {(uniform player) == "U_NikosAgedBody"} do
    {
	switch (__GETC__(life_coplevel)) do 
		{
			case 1: {
			player setObjectTextureGlobal [0,"images\kleidung\test_1.jpg"];
			};
			
			case 2: {
			player setObjectTextureGlobal [0,"images\kleidung\cop_2.jpg"];
			};
			
			case 3: {
			player setObjectTextureGlobal [0,"images\kleidung\cop_3.jpg"];
			};
			
			case 4: {
			player setObjectTextureGlobal [0,"images\kleidung\cop_4.jpg"];
			};
			
			case 5: {
			player setObjectTextureGlobal [0,"images\kleidung\cop_5.jpg"];
			};
			
			case 6: {
			player setObjectTextureGlobal [0,"images\kleidung\cop_6.jpg"];
			};
			
			case 7: {
			player setObjectTextureGlobal [0,"images\kleidung\cop_7.jpg"];
			};
			
			case 8: {
			player setObjectTextureGlobal [0,"images\kleidung\cop_8.jpg"];
			};
			
		};
    if(backpack player != "") then {(unitBackpack player) setObjectTextureGlobal [0,""];};
    sleep 30;
    };
};