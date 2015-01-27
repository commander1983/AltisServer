/*
	File: fn_respawned.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sets the player up if he/she used the respawn option.
*/
private["_pic","_killer"];

_killer = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
//Reset our weight and other stuff
life_use_atm = TRUE;
life_hunger = 100;
life_thirst = 100;
life_battery = 100;
life_carryWeight = 0;
ja_dzep = 0; //Make sure we don't get our cash back.
life_respawned = false;
player playMove "amovpercmstpsnonwnondnon";

life_corpse setVariable["Revive",nil,TRUE];
life_corpse setVariable["name",nil,TRUE];
life_corpse setVariable["Reviving",nil,TRUE];
player setVariable["Revive",nil,TRUE];
player setVariable["name",nil,TRUE];
player setVariable["Reviving",nil,TRUE];

//Load gear for a 'new life'
switch(playerSide) do
{
	case west: {[] spawn life_fnc_copDefault;};
	case civilian: {
		[] spawn life_fnc_civLoadout;
	};
	case independent: {
		[] spawn life_fnc_medicLoadout;
	};
	case east:
	{
		[] spawn life_fnc_adacLoadout;
	};
};

//Cleanup of weapon containers near the body & hide it.
if(!isNull life_corpse) then {
	private["_containers"];
	life_corpse setVariable["Revive",TRUE,TRUE];
	_containers = nearestObjects[life_corpse,["WeaponHolderSimulated"],5];
	{deleteVehicle _x;} foreach _containers; //Delete the containers.
	hideBody life_corpse;
};

//Destroy our camera...
life_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy life_deathCamera;

//Bad boy
if(life_is_arrested) exitWith {
	hint localize "STR_Jail_Suicide";
	life_is_arrested = false;
	[player,TRUE] spawn life_fnc_jail;
	[] call SOCK_fnc_updateRequest;
};

//Johnny law got me but didn't let the EMS revive me, reward them half the bounty.
if(!isNil "life_copRecieve") then {
	[[getPlayerUID player,player,life_copRecieve,true],"life_fnc_wantedBounty",false,false] spawn life_fnc_MP;
	[[getPlayerUID player],"life_fnc_wantedRemove",false,false] spawn life_fnc_MP;
	life_copRecieve = nil;
};

//So I guess a fellow gang member, cop or myself killed myself so get me off that Altis Most Wanted
/*
if(life_removeWanted) then {
	if(side _killer == west) then {
		[[getPlayerUID player],"life_fnc_wantedRemove",false,false] spawn life_fnc_MP;
	};
};*/

[] call SOCK_fnc_updateRequest;
[] call life_fnc_hudUpdate; //Request update of hud.
[] call life_fnc_updateClothing;