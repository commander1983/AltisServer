/*
	File: fn_licenseType.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Returns the short-var of the license name to a long var and display name.
*/
private["_type","_ret","_var","_mode"];
_type = [_this,0,"",[""]] call BIS_fnc_param;
_mode = [_this,1,-1,[0]] call BIS_fnc_param;
if(_type == "" OR _mode == -1) exitWith {[]};

switch (_mode) do
{
	case 0:
	{
		switch (_type) do
		{
			case "driver": {_var = "license_civ_driver"};
			case "boat": {_var = "license_civ_boat"};
			case "pilot": {_var = "license_civ_air"};
			case "gun": {_var = "license_civ_gun"};
			case "dive": {_var = "license_civ_dive"};
			case "oil": {_var = "license_civ_oil"};
			case "cair": {_var = "license_cop_air"};
			case "swat": {_var = "license_cop_swat"};
			case "cg": {_var = "license_cop_cg"};
			case "heroin": {_var = "license_civ_heroin"};
			case "marijuana": {_var = "license_civ_marijuana"};
			case "medmarijuana": {_var = "license_civ_medmarijuana"};
			case "gang": {_var = "license_civ_gang"};
			case "rebel": {_var = "license_civ_rebel"};
			case "truck":{_var = "license_civ_truck"};
			case "diamond": {_var = "license_civ_diamond"};
			case "salt": {_var = "license_civ_salt"};
			case "cocaine": {_var = "license_civ_coke"};
			case "sand": {_var = "license_civ_sand"};
			case "iron": {_var = "license_civ_iron"};
			case "copper": {_var = "license_civ_copper"};
			case "cement": {_var = "license_civ_cement"};
			case "meth": {_var = "license_civ_meth"};
			case "grapes": {_var = "license_civ_grapes"};
			case "moonshine": {_var = "license_civ_moonshine"};
			case "gold": {_var = "license_civ_gold"};
			case "silber": {_var = "license_civ_silber"};
			case "uran": {_var = "license_civ_uran"};
			case "special": {_var = "license_civ_special"};
			case "lsd": {_var = "license_civ_lsd"};
			case "mait": {_var = "license_civ_mait"};
			case "sotb": {_var = "license_civ_sotb"};
			case "pcola": {_var = "license_civ_pcola"};
			case "home": {_var = "license_civ_home"};
			case "permanent": {_var = "license_civ_permanent"};
			default {_var = ""};
		};
	};
	
	case 1:
	{
		switch (_type) do
		{
			case "license_civ_driver": {_var = "driver"};
			case "license_civ_boat": {_var = "boat"};
			case "license_civ_air": {_var = "pilot"};
			case "license_civ_gun": {_var = "gun"};
			case "license_civ_dive": {_var = "dive"};
			case "license_civ_oil": {_var = "oil"};
			case "license_cop_air": {_var = "cair"};
			case "license_cop_swat": {_var = "swat"};
			case "license_cop_cg": {_var = "cg"};
			case "license_civ_heroin": {_var = "heroin"};
			case "license_civ_marijuana": {_var = "marijuana"};
			case "license_civ_medmarijuana": {_var = "medmarijuana"};
			case "license_civ_gang": {_var = "gang"};
			case "license_civ_rebel": {_var = "rebel"};
			case "license_civ_truck":{_var = "truck"};
			case "license_civ_diamond": {_var = "diamond"};
			case "license_civ_salt": {_var = "salt"};
			case "license_civ_coke": {_var = "cocaine"};
			case "license_civ_sand": {_var = "sand"};
			case "license_civ_iron": {_var = "iron"};
			case "license_civ_copper": {_var = "copper"};
			case "license_civ_cement": {_var = "cement"};
			case "license_civ_meth": {_var = "meth"};
			case "license_civ_grapes": {_var = "grapes"};
			case "license_civ_moonshine": {_var = "moonshine"};
			case "license_civ_gold": {_var = "gold"};
			case "license_civ_silber": {_var = "silber"};
			case "license_civ_uran": {_var = "uran"};
			case "license_civ_lsd": {_var = "lsd"};
			case "license_civ_mait": {_var = "mait"};
			case "license_civ_sotb": {_var = "sotb"};
			case "license_civ_pcola": {_var = "pcola"};
			case "license_civ_home": {_var = "home"};
			case "license_civ_permanent": {_var = "permanent"};
			default {_var = ""};
		};
	};
};

_ret = [_var,(if(_var != "") then {([_var] call life_fnc_varToStr)})];
_ret;