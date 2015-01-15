/*
	File: fn_processAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master handling for processing an item.
*/
private["_vendor","_type","_itemInfo","_oldItem","_oldItem2","_newItem","_cost","_upp","_hasLicense","_itemName","_oldVal","_oldVal2","_ui","_progress","_pgText","_cP","_error","_success"];
_vendor = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_type = [_this,3,"",[""]] call BIS_fnc_param;
//Error check
if(isNull _vendor OR _type == "" OR (player distance _vendor > 10)) exitWith {};

_error = false;
//unprocessed item,processed item, cost if no license,Text to display (I.e Processing  (percent) ...",processing 2Items?, (only for processing with 2) second Item.
_itemInfo = switch (_type) do
{
	case "oil": {["oilu","oilp",1000,(localize "STR_Process_Oil"),false];};
	case "diamond": {["diamond","diamondc",1000,(localize "STR_Process_Diamond"),false]};
	case "heroin": {["heroinu","heroinp",7500,(localize "STR_Process_Heroin"),false]};
	case "copper": {["copperore","copper_r",1000,(localize "STR_Process_Copper"),false]};
	case "iron": {["ironore","iron_r",1000,(localize "STR_Process_Iron"),false]};
	case "sand": {["sand","glass",1000,(localize "STR_Process_Sand"),false]};
	case "salt": {["salt","salt_r",1000,(localize "STR_Process_Salt"),false]};
	case "cocaine": {["cocaine","cocainep",10000,(localize "STR_Process_Cocaine"),false]};
	case "marijuana": {["cannabis","marijuana",7500,(localize "STR_Process_Marijuana"),false]};
	case "cement": {["rock","cement",1000,(localize "STR_Process_Cement"),false]};

	
	
	case "meth": {["methu","methp",7500,"Koche Meth",false]};
	case "grapes": {["grapes","vodka",1000,"Verarbeitet Trauben in Vodka",false]};
	case "moonshine": {["grapes","moonshine",7500,"Verarbeitet Trauben in Schwarzgebranntes",false]};
	case "gold": {["goldu","goldp",1000,"Verarbeitet Golderz in Goldbarren",false];};
	case "silber": {["silberu","silberp",1000,"Verarbeitet Silbererz in Silberbarren",false];};
	case "uran": {["uranu","uranp",10000,"Verarbeitet Uran in Uranium",false];};
	case "lsd": {["frogs","frogslsd",5000,"Verarbeitet Tryptophan in Lysergsaeurediethylamid",false];};
	case "pcola": {["banane","pcolap",100,"Mixt Pinacolada",true,"cerises"]};
	case "sotb": {["peach","sotbp",100,"Mixt Sex on the Beach",true,"birne"]};
	case "mait": {["apple","maitp",100,"Mixt Mai Tai",true,"banane"]};
	case "kristall": {["kristall","kristalle",3000,"Verwandelt Kristall",false]};
	default {[]};
};

//Error checking
if(count _itemInfo == 0) exitWith {};

//Setup vars.
_2var = _itemInfo select 4;
_oldItem = _itemInfo select 0;
_newItem = _itemInfo select 1;
_cost = _itemInfo select 2;
_upp = _itemInfo select 3;

if(_2var) then { _oldItem2 = _itemInfo select 5; };

if(_vendor in [mari_processor,coke_processor,heroin_processor]) then {
	_hasLicense = true;
} else {
	_hasLicense = missionNamespace getVariable (([_type,0] call life_fnc_licenseType) select 0);
};
 
_itemName = [([_newItem,0] call life_fnc_varHandle)] call life_fnc_varToStr;
_oldVal = missionNamespace getVariable ([_oldItem,0] call life_fnc_varHandle);

if(_2var) then { _oldVal2 = missionNamespace getVariable ([_oldItem2,0] call life_fnc_varHandle); };

if(_2var) then { 
       if(_oldVal !=_oldVal2) then {
              _error = true;
       };
};
if(_error) exitWith{hint "Bitte benutze die selbe Menge beider Früchte"};


_cost = _cost * _oldVal;
//Some more checks
if(_oldVal == 0) exitWith {};

//Setup our progress bar.
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

life_interrupted = false;
life_is_processing = true;

if(_hasLicense) then
{
	while{true} do
	{
		sleep  0.3;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vendor > 10) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	};
	player playActionNow "stop";
	
	if(player distance _vendor > 10) exitWith {hint localize "STR_Process_Stay"; 5 cutText ["","PLAIN"]; life_is_processing = false; _ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	
	if(_2var) then 
	{
		([false,_oldItem2,_oldVal2] call life_fnc_handleInv);
	};
	
	if(!([false,_oldItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false; _ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	if(!([true,_newItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [true,_oldItem,_oldVal] call life_fnc_handleInv; life_is_processing = false; _ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	5 cutText ["","PLAIN"];
	titleText[format[localize "STR_Process_Processed",_oldVal,_itemName],"PLAIN"];
	life_is_processing = false;
	
	_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];
}
	else
{
	if(ja_dzep < _cost) exitWith {hint format[localize "STR_Process_License",[_cost] call life_fnc_numberText]; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	
	while{true} do
	{		
		sleep  0.9;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vendor > 10) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	};
	player playActionNow "stop";
	
	if(player distance _vendor > 10) exitWith {hint localize "STR_Process_Stay"; 5 cutText ["","PLAIN"]; life_is_processing = false; _ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	if(ja_dzep < _cost) exitWith {hint format[localize "STR_Process_License",[_cost] call life_fnc_numberText]; 5 cutText ["","PLAIN"]; life_is_processing = false; _ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	
	
	if(_2var) then 
	{
		([false,_oldItem2,_oldVal2] call life_fnc_handleInv);
	};
	
	if(!([false,_oldItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false; _ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	if(!([true,_newItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [true,_oldItem,_oldVal] call life_fnc_handleInv; life_is_processing = false; _ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	5 cutText ["","PLAIN"];
	titleText[format[localize "STR_Process_Processed2",_oldVal,_itemName,[_cost] call life_fnc_numberText],"PLAIN"];
	
	ja_dzep = ja_dzep - _cost;
	life_is_processing = false;
	
	_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];
};	