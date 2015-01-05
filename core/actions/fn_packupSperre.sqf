/*
    File: fn_packupSperre.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Packs up a deployed wall.
*/
private["_sperre"];
_sperre = nearestObjects[getPos player,["RoadBarrier_F"],2] select 0;
if(isNil "_sperre") exitWith {};

if(([true,"sperre",1] call life_fnc_handleInv)) then
{
    titleText["Du hast die Straﬂensperre enfernt.","PLAIN"];
    player removeAction life_action_sperrePickup;
    life_action_sperrePickup = nil;
    deleteVehicle _sperre;
};