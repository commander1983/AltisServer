/*
	File: fn_licensePrice.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Returns the license price.
*/
private["_type"];
_type = [_this,0,"",[""]] call BIS_fnc_param;
if(_type == "") exitWith {-1};

switch (_type) do
{
	case "driver": {1000};
	case "boat": {1200};
	case "pilot": {25000};
	case "gun": {25000};
	case "dive": {2000};
	case "oil": {20000};
	case "cair": {15000};
	case "swat": {35000};
	case "cg": {8000};
	case "heroin": {200000};
	case "marijuana": {125000};
	case "medmarijuana": {1500};
	case "gang": {250000};
	case "rebel": {200000};
	case "truck": {8000};
	case "diamond": {40000};
	case "salt": {10000};
	case "cocaine": {225000};
	case "sand": {10000};
	case "iron": {10000};
	case "copper": {5000};
	case "cement": {5000};
	case "meth": {100000};
	case "grapes": {7000};
	case "moonshine": {150000};
	case "gold": {30000};
	case "silber": {15000};
	case "uran": {250000};
	case "lsd": {215000};
	case "pcola": {1000};
	case "sotb": {1000};
	case "mait": {1000};
	case "home": {175000};
	case "kristall": {50000};
};