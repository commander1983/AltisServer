/*
    File: fn_packupWarnung.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Packs up a deployed wall.
*/
private["_warnung"];
_warnung = nearestObjects[getPos player,["RoadCone_F"],1] select 0;
if(isNil "_warnung") exitWith {};

if(([true,"warnung",1] call life_fnc_handleInv)) then
{
    titleText["Du hast die Pylone aufgehoben.","PLAIN"];
    player removeAction life_action_warnungPickup;
    life_action_warnungPickup = nil;
    deleteVehicle _warnung;
};