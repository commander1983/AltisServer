/*
    Sending robbery-request to server 
*/
private["_shop","_robber"];
_shop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_robber = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param; 
_action = [_this,2] call BIS_fnc_param;

if(playersNumber west < 3) exitWith { hint "In der Kasse befindet sich kein Geld."};//This line has been commented out, but can be set so that you can limit the ability to robb based on cops online.
if(isNull _shop OR isNull _robber) exitWith {};
if(side _robber != civilian) exitWith { hint "Du bist ein Beamter!" };// We do not want anyone but civilianz to rob the stations.
if(vehicle player != _robber) exitWith { hint "Raus aus dem Fahrzeug du Pussy!" };
if(currentWeapon _robber == "") exitWith { hint "Haha, du machst mir keine Angst! Hau bloss ab sonst setzt es was!" };//is he trying to rob without a weapon? Lets taunt him a bit!
if(currentWeapon _robber == "Rangefinder") exitWith { hint "Willst du'n Passfoto oder warum schauste so dämlich??";};
if(_robber distance _shop > 3) exitWith { hint "Du bist zu weit weg!" };
[[_shop,_robber,_action],"TON_fnc_robShops",false,false] spawn life_fnc_MP;//now we send the info to the server to be processed further there.