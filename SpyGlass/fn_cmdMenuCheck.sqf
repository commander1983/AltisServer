/*
	File: fn_cmdMenucheck.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Checks to see which commandingMenu is currently active,
	if a non white-listed menu is active it will close it and report it
	to the server and active admins.
*/
private["_validMenus","_lastMenu"];
_validMenus = [
	"RscMainMenu","RscMoveHigh","#WATCH","#WATCH0","RscWatchDir","RscWatchMoveDir","#GETIN","#RscStatus","RscCallSupport","#ACTION",
	"RscCombatMode","RscFormations","RscTeam","RscSelectTeam","RscReply","#User:BIS_Menu_GroupCommunication","#CUSTOM_RADIO",
	"RscRadio","RscGroupRootMenu","RscMenuReply","RscMenuStatus","","#User:BIS_fnc_addCommMenuItem_menu","RscMenuMove","RscMenuFormations"
];

_lastMenu = "";
while {true} do
{
	waitUntil {commandingMenu != _lastMenu};
	_lastMenu = commandingMenu;
	
	if(!(commandingMenu in _validMenus)) then {
		[[profileName,getPlayerUID player,_lastMenu],"SPY_fnc_observe",false,false] call life_fnc_MP;
		[[1,format["%1 wurde von SPY-GLASS erwischt, wie er/sie versuchte das Menü:\n\n %2\n\n zu öffnen. Dieses Menü ist dem System jedoch nicht bekannt. Das heißt nicht, dass die Person hackt oder cheatet.", profileName, _lastMenu]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
		showCommandingMenu "";
	};
};