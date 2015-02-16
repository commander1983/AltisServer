/*
	File: fn_progressBaren.sqf
	Author: Herman "Mordin" Othelius
	Template: Tonics crap :P
	Description: Should pop up a progressbar :)
*/
private["_cpRate","_title","_progressBar","_titleText","_cp","_ui","_object"];
_object = _this Select 0;  
//Setup the progress bar
_cpRate = 0.0010;
disableSerialization;
_title = "Breche das Gefängnis auf";

life_action_inUse = true;

//Setup the progress bar
disableSerialization;
_title = "Breche das Gefängnis auf";
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

while {true} do
{
	if(animationState player != "AinvPknlMstpsnonWnonDnon_medic_1" ) then {
	player action ["SwitchWeapon", player, player, 100];   //EDIT
	player playMove "AinvPknlMstpsnonWnonDnon_medic_1"; //Durée action 6.5 secondes
	player playActionNow "stop";
	player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
	player playActionNow "stop";
	player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
	};
	sleep 0.195;
	if(isNull _ui) then {
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNamespace getVariable "life_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + _cpRate;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(life_istazed) exitWith {}; //Tazed
	if(life_interrupted) exitWith {};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player OR life_istazed) exitWith {life_action_inUse = false;};
if((player getVariable["restrained",false])) exitWith {life_action_inUse = false;};
if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
life_action_inUse = false;

_object setPos (getMarkerPos "jail_breakout");

if (playerSide == civilian) then {
[[getPlayerUID player,profileName,"902"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
else 
hint "Hoffentlich hast du das richtige getan!";
};