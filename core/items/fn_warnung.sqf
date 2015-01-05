/*
    File: fn_mauer.sqf
    Author: OLLI aka Hauklotz
    
    Description:
    Holt das Item aus dem Inventar und setzt es auf der Map.
*/
private["_position","_warnung"];
_warnung = createVehicle ["RoadCone_F", [0,0,0], [], 0, "NONE"];
_warnung attachTo[player,[0,5.5,0.2]];
_warnung setDir 90;
_warnung setVariable["item","warnungDeployed",true];

life_action_warnungDeploy = player addAction["<t color='#00FF00'>Pylone Aufstellen</t>",{if(!isNull life_warnung) then {detach life_warnung; life_warnung = ObjNull;}; player removeAction life_action_warnungDeploy; life_action_warnungDeploy = nil;},"",999,false,false,"",'!isNull life_warnung'];
life_warnung = _warnung;
waitUntil {isNull life_warnung};
if(!isNil "life_action_warnungDeploy") then {player removeAction life_action_warnungDeploy;};
if(isNull _warnung) exitWith {life_warnung = ObjNull;};
_warnung setPos [(getPos _warnung select 0),(getPos _warnung select 1),0];
_warnung allowDamage false;