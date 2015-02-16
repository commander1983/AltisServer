/*
	File: fn_robPerson.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Getting tired of adding descriptions...
*/
private["_robber"];
_robber = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _robber) exitWith {}; //No one to return it to?
if(currentWeapon _robber == "") exitWith {[[4,format["Du kannst keine Person ohne eine Waffe in der Hand zu tragen, ausrauben!"]],"life_fnc_broadcast",_robber,false] spawn life_fnc_MP;};
if(ja_dzep > 0) then
{
	[[ja_dzep],"life_fnc_robReceive",_robber,false] spawn life_fnc_MP;
	[[getPlayerUID _robber,_robber getVariable["realname",name _robber],"211"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
	[[1,"STR_NOTF_Robbed",true,[_robber getVariable["realname",name _robber],profileName,[ja_dzep] call life_fnc_numberText]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
	ja_dzep = 0;
}
	else
{
	[[2,"STR_NOTF_RobFail",true,[profileName]],"life_fnc_broadcast",_robber,false] spawn life_fnc_MP;
};

[] call SOCK_fnc_updateRequest;