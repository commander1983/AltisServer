/*
File: fn_gatherkristall.sqf

Description:
Kristall
*/
private["_sum"];
_sum = ["kristall",1,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;

if(_sum > 0) then
{
life_action_in_use = true;
titleText["Verwandelt Kristall","PLAIN"];
titleFadeOut 5;
sleep 5;
if(([true,"kristall",1] call life_fnc_handleInv)) then

};

life_action_in_use = false;