/*
	File: welcomecredits.sqf
	Author: HellsGateGaming.com
	Date: 14/12/2013
	Description:
	Creates an intro on the bottom-right hand corner of the screen.
*/

_onScreenTime = 15;

sleep 8; //Wait in seconds before the credits start after player is in-game
 
_role1 = "Herzlich Willkommen auf dem";
_role1names = ["StaiyLite","Altis Life Server"];
_role2 = "Admins";
_role2names = ["Staiy","Snerz","Spoilty","mantis","bekoo","Murphy"];
_role3 = "Webseite/ Teamspeak";
_role3names = ["www.staiylite.de","TeamSpeakIP: ts.staiylite.de"];
_role4 = "Aktuelle Neuerungen/ ChangeLog";
_role4names = ["Cop Shop Änderung","Neues Ausbruchsystem","Neue Map","Weitere Infos und ChangeLog: www.staiylite.de"];

{
sleep 2;
_memberFunction = _x select 0;
_memberNames = _x select 1;
_finalText = format ["<t size='0.6' color='#C31319' align='right'>%1<br /></t>", _memberFunction];
_finalText = _finalText + "<t size='0.85' color='#FFFFFF' align='right'>";
{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
_finalText = _finalText + "</t>";
_onScreenTime + (((count _memberNames) - 1) * 0.9);
[
_finalText,
[safezoneX + safezoneW - 0.8,0.50], //DEFAULT: 0.5,0.35
[safezoneY + safezoneH - 0.8,0.7], //DEFAULT: 0.8,0.7
_onScreenTime,
0.5
] spawn BIS_fnc_dynamicText;
sleep (_onScreenTime);
} forEach [

[_role1, _role1names],
[_role2, _role2names],
[_role3, _role3names],
[_role4, _role4names]
];