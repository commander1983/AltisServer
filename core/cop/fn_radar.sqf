/*
	File: fn_radar.sqf
	Author: Silly Aussie kid named Jaydon
	
	Description:
	Looks like weird but radar?
*/
if(playerSide != west) exitWith {};
private ["_speed","_vehicle"];
_vehicle = cursorTarget;
_speed = round speed _vehicle;

if((_vehicle isKindOf "Car") && (currentWeapon player) == "hgun_P07_snds_F") then
{
	switch (true) do 
	{
		case ((_speed > 15 && _speed <= 50)) : 
		{	
			hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>" +(localize "STR_Cop_Radar")+ "<br/><t color='#33CC33'><t align='center'><t size='1'>" +(localize "STR_Cop_VehSpeed"),round  _speed];
		};
		
		case ((_speed > 51 && _speed <= 125)) : 
		{	
			hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>" +(localize "STR_Cop_Radar")+ "<br/><t color='#E0CC14'><t align='center'><t size='1'>" +(localize "STR_Cop_VehSpeed"),round  _speed];
		};
		
		case ((_speed > 126 && _speed <= 200)) : 
		{	
			hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>" +(localize "STR_Cop_Radar")+ "<br/><t color='#EE7711'><t align='center'><t size='1'>" +(localize "STR_Cop_VehSpeed"),round  _speed];
		};
		case ((_speed > 201)) : 
		{	
			hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>" +(localize "STR_Cop_Radar")+ "<br/><t color='#FF0000'><t align='center'><t size='1'>" +(localize "STR_Cop_VehSpeed") + " -Desync",round  _speed];
		};
	};
};