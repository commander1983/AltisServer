#include <macro.h>
/*
	File: fn_spawnPointCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for available spawn points depending on the units side.
	
	Return:
	[Spawn Marker,Spawn Name,Image Path]
*/
private["_side","_markers"];
_side = [_this,0,civilian,[civilian]] call BIS_fnc_param;

//Spawn Marker, Spawn Name, PathToImage
switch (_side) do
{
	case west:
	{
		_markers = [
			["cop_spawn_1","Kavala","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["cop_spawn_2","Pyrgos","\a3\ui_f\data\map\MapControl\fuelstation_ca.paa"],
			["cop_spawn_3","Athira","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"],
			["cop_spawn_4","Air","\a3\ui_f\data\map\Markers\NATO\b_air.paa"],
			["cop_spawn_5","Sofia","\a3\ui_f\data\map\MapControl\fuelstation_ca.paa"]
		];
	};
	
	case civilian:
	{
		_markers = [
			["civ_spawn_1","Kavala","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_2","Pyrgos","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_3","Athira","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_4","Sofia","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
		];
		
		if(license_civ_rebel && playerSide == civilian) then {
			_markers = _markers + [
				["Rebelop_1","RebellenHQ","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"]
			];
		};
		
		if(__GETC__(life_donator) > 0) then {
			_markers = _markers + [
				["donator_market","Donator","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"]
			];
		};
		
		if(count life_houses > 0) then {
			{
				_pos = call compile format["%1",_x select 0];
				_house = nearestBuilding _pos;
				_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
				
				_markers pushBack [format["house_%1",_house getVariable "uid"],_houseName,"\a3\ui_f\data\map\MapControl\lighthouse_ca.paa"];
			} foreach life_houses;
		};	
	
	};
	
	case independent: {
		_markers = [
			["medic_spawn_1","Kavala Hospital","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
			["medic_spawn_2","Athira Air HQ","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
			["medic_spawn_3","Pygros Hospital","\a3\ui_f\data\map\MapControl\hospital_ca.paa"]
		];
	};
	
	case east: {
		_markers = [
			["adac_spawn_1","Adac Kavala","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
			["adac_spawn_2","Adac Air HQ","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
			["adac_spawn_3","Adac Pygros","\a3\ui_f\data\map\MapControl\hospital_ca.paa"]
		];
	};
};
_markers;