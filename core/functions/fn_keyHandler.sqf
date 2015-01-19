#include <macro.h>
/*
	File: fn_keyHandler.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main key handler for event 'keyDown'
*/
private ["_handled","_shift","_alt","_code","_ctrl","_alt","_ctrlKey","_veh","_locked","_interactionKey","_mapKey","_interruptionKeys"];
_ctrl = _this select 0;
_code = _this select 1;
_shift = _this select 2;
_ctrlKey = _this select 3;
_alt = _this select 4;
_speed = speed cursorTarget;
_handled = false;

_interactionKey = if(count (actionKeys "User10") == 0) then {219} else {(actionKeys "User10") select 0};
_mapKey = actionKeys "ShowMap" select 0;
//hint str _code;
_interruptionKeys = [17,30,31,32]; //A,S,W,D

if(life_action_inUse) exitWith {
	if(!life_interrupted && _code in _interruptionKeys) then {life_interrupted = true;};
	_handled;
};

switch (_code) do
{	
	//Space key for Jumping
	case 57:
	{
		if(isNil "jumpActionTime") then {jumpActionTime = 0;};
		if(_shift && {animationState player != "AovrPercMrunSrasWrflDf"} && {isTouchingGround player} && {stance player == "STAND"} && {speed player > 2} && {!life_is_arrested} && {(velocity player) select 2 < 2.5} && {time - jumpActionTime > 1.5}) then {
			jumpActionTime = time; //Update the time.
			[player,true] spawn life_fnc_jumpFnc; //Local execution
			[[player,false],"life_fnc_jumpFnc",nil,FALSE] call life_fnc_MP; //Global execution 
			_handled = true;
		};
	};
	
	//Map Key	
	case _mapKey:
	{
		switch (playerSide) do 
		{
			case west: {if(!visibleMap) then {[] spawn life_fnc_copMarkers;}};
			case independent: {if(!visibleMap) then {[] spawn life_fnc_medicMarkers; [] spawn life_fnc_posMarkers;}};
			case civilian: {if(!visibleMap) then {[] spawn life_fnc_gangMarkers;}};
			case east: {if(!visibleMap) then {[] spawn life_fnc_AdacMarkers;}};
		};
	};
	
	//Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
	case _interactionKey:
	{
		if(!life_action_inUse) then {
			[] spawn 
			{
				private["_handle"];
				_handle = [] spawn life_fnc_actionKeyHandler;
				waitUntil {scriptDone _handle};
				life_action_inUse = false;
			};
		};
	};
	
	//Restraining or robbing (Shift + R)
	case 19:
	{
		if(_shift) then {_handled = true;};
		
		if(_shift && playerSide == west && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 3 && !(cursorTarget getVariable "Escorting") && !(cursorTarget getVariable "restrained") && speed cursorTarget < 1 && !(player getVariable ["restrained", false])) then
		{
				if([false,"handcuffs",1] call life_fnc_handleInv) then
				{
					[] call life_fnc_restrainAction;
				}
				else
				{
					hint "Du hast keine Handschellen dabei!";
				};
				
		};
		
		//Rebellfesseln
		if(_ctrlKey && playerSide == civilian && (license_civ_rebel) && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 3 && !(cursorTarget getVariable "Escorting") && !(cursorTarget getVariable "restrained") && speed cursorTarget < 1 && !(player getVariable ["restrained", false]) && (currentWeapon player == primaryWeapon player OR currentWeapon player == handgunWeapon player) && currentWeapon player != "") then
		{
			if([false,"handcuffs",1] call life_fnc_handleInv) then
			{
				[] call life_fnc_restrainAction;
			}
			else
			{
				hint "Du hast keine Handschellen dabei!";
			};
		};
		
		//Robbing
		if(_shift && playerSide == civilian && !isNull cursorTarget && cursorTarget isKindOf "Man" && isPlayer cursorTarget && alive cursorTarget && cursorTarget distance player < 4 && speed cursorTarget < 1) then
		{
			if((animationState cursorTarget) != "Incapacitated" && (currentWeapon player == primaryWeapon player OR currentWeapon player == handgunWeapon player) && currentWeapon player != "" && !life_knockout && !(player getVariable["restrained",false]) && !life_istazed) then
			{
				[cursorTarget] spawn life_fnc_knockoutAction;
				//player say3D "knockout";
				[player,"knockout"] call life_fnc_globalSound;
			};
			_handled = true;
		};
		
		if(playerSide == west && vehicle player != player && !life_siren2_active && ((driver vehicle player) == player)) then
        {
            [] spawn
			{
				life_siren2_active = true;
				sleep 1;
				life_siren2_active = false;
			};
			_veh = vehicle player;
			if(isNil {_veh getVariable "siren2"}) then {_veh setVariable["siren2",false,true];};
			if((_veh getVariable "siren2")) then
			{
				titleText ["== Schrecksirene AUS ==","PLAIN"];
				_veh setVariable["siren2",false,true];
			}
				else
			{
				titleText ["== Schrecksirene AN ==","PLAIN"];
				_veh setVariable["siren2",true,true];
				[[_veh],"life_fnc_copSiren2",nil,true] spawn life_fnc_MP;
			};
		};
	};
	
	//Holster / recall weapon.
	case 35:
	{
		if(_shift && !_ctrlKey && currentWeapon player != "") then {
			life_curWep_h = currentWeapon player;
			player action ["SwitchWeapon", player, player, 100];
			player switchcamera cameraView;
		};

		if(!_shift && _ctrlKey && !isNil "life_curWep_h" && {(life_curWep_h != "")}) then {
			if(life_curWep_h in [primaryWeapon player,secondaryWeapon player,handgunWeapon player]) then {
				player selectWeapon life_curWep_h;
			};
		};
	};
	
	//surrender... tab
	case 15:
	{
		if(!_alt && !_ctrlKey && !_shift) then
		{
			if (vehicle player == player && !(player getVariable ["restrained", false]) && (animationState player) != "Incapacitated" && !life_istazed && !life_action_gather && !life_knockout) then
			{
				if (player getVariable ["surrender", false]) then
				{
					player setVariable ["surrender", false, true];
				} 
				else
				{
					[] spawn life_fnc_surrender;
				};
			};
		};
	};

	//T Key (Trunk)
	case 20:
	{
		if(!_alt && !_ctrlKey) then
		{
			if(vehicle player != player && alive vehicle player) then
			{
				if((vehicle player) in life_vehicles) then
				{
					[vehicle player] call life_fnc_openInventory;
				};
			}
				else
			{
				if((cursorTarget isKindOf "Car" OR cursorTarget isKindOf "Air" OR cursorTarget isKindOf "Ship" OR cursorTarget isKindOf "House_F") && player distance cursorTarget < 7 && vehicle player == player && alive cursorTarget) then
				{
					if(cursorTarget in life_vehicles OR {!(cursorTarget getVariable ["locked",true])}) then
					{
						[cursorTarget] call life_fnc_openInventory;
					};
				};
			};
		};
	};
	//L Key?
	case 38: 
	{
		//If cop run checks for turning lights on.
		if(_shift && (playerSide == west)) then {
			if(vehicle player != player && (typeOf vehicle player) in [
			"C_Offroad_01_F",
			"O_MRAP_02_F",
			"C_SUV_01_F",
			"C_Hatchback_01_F",
			"C_Hatchback_01_sport_F",
			"B_Heli_Light_01_F",
			"I_Heli_light_03_unarmed_F",
			"I_MRAP_03_F",
			"B_Quadbike_01_F",
			"B_Heli_Transport_01_F",
			"B_Heli_Transport_03_unarmed_F"
			]) then {
				if(!isNil {vehicle player getVariable "lights"}) then {
					[vehicle player] call life_fnc_sirenLights;
					_handled = true;
				};
			};
		};
		
		if(_shift && (playerSide == independent)) then {
			if(vehicle player != player && (typeOf vehicle player) in [
			"B_Quadbike_01_F",
			"C_Offroad_01_F",
			"C_Hatchback_01_sport_F",
			"C_SUV_01_F",
			"B_Heli_Light_01_F",
			"I_Heli_light_03_unarmed_F",
			"O_Heli_Light_02_unarmed_F",
			"I_MRAP_03_F",
			"O_Heli_Transport_04_medevac_F"
			]) then {
				if(!isNil {vehicle player getVariable "lights"}) then {
					[vehicle player] call life_fnc_medicsirenLights;
					_handled = true;
				};
			};
		};
		
		if(_shift && (playerSide == east)) then {
			if(vehicle player != player && (typeOf vehicle player) in [
			"C_Offroad_01_F",
			"B_Heli_Light_01_F",
			"B_Truck_01_transport_F",
			"I_Heli_Transport_02_F",
			"I_MRAP_03_F",
			"B_Heli_Transport_03_unarmed_F",
			"O_Heli_Transport_04_F"
			]) then {
				if(!isNil {vehicle player getVariable "lights"}) then {
					[vehicle player] call life_fnc_adacsirenLights;
					_handled = true;
				};
			};
		};
	};
	//Y Player Menu
	case 21:
	{
		if(!_alt && !_ctrlKey && !dialog) then
		{
			[] call life_fnc_p_openMenu;
		};
	};
	//V Key
	case 47:
	{
		if(playerSide != west && (player getVariable "restrained") OR (player getVariable "transporting")) then {_handled = true;};
	};
    //F Key
	case 33:
    {   
		if(playerSide == west && vehicle player != player && !life_siren_active && ((driver vehicle player) == player)) then
		{
			[] spawn
			{
				life_siren_active = true;
				sleep 6.5;
				life_siren_active = false;
			};
			_veh = vehicle player;
			if(isNil {_veh getVariable "siren"}) then {_veh setVariable["siren",false,true];};
			if((_veh getVariable "siren")) then
			{
				titleText [localize "STR_MISC_SirensOFF","PLAIN"];
				_veh setVariable["siren",false,true];
			}
				else
			{
				titleText [localize "STR_MISC_SirensON","PLAIN"];
				_veh setVariable["siren",true,true];
				[[_veh],"life_fnc_copSiren",nil,true] spawn life_fnc_MP;
			};
		};
		
		if(playerSide == independent && vehicle player != player && !life_siren_active && ((driver vehicle player) == player)) then
		{
			[] spawn
			{
				life_siren_active = true;
				sleep 6.5;
				life_siren_active = false;
			};
			_veh = vehicle player;
			if(isNil {_veh getVariable "siren"}) then {_veh setVariable["siren",false,true];};
			if((_veh getVariable "siren")) then
			{
				titleText [localize "STR_MISC_SirensOFF","PLAIN"];
				_veh setVariable["siren",false,true];
			}
				else
			{
				titleText [localize "STR_MISC_SirensON","PLAIN"];
				_veh setVariable["siren",true,true];
				[[_veh],"life_fnc_medSiren",nil,true] spawn life_fnc_MP;
			};
		};

		if(_shift) then {_handled = true;};	
		if (player call life_fnc_isMedic) then 
		{
			if(_shift && _curTarget isKindOf "Man" && {!alive _curTarget} && {playerSide in [independent]}) then {
				[_curTarget] spawn life_fnc_revivePlayer;
			};
		};
	};
	
	//Q Key
    case 16:
    {    
        if((!life_action_gather) && (vehicle player == player) ) then
        {
            {
                _str = [_x] call life_fnc_varToStr;
                _val = missionNameSpace getVariable _x;
                if(_val > 0 ) then
                {
                    if( _str == "Spitzhacke" || _str == "pickaxe" ) then
                    {
                        [] spawn life_fnc_pickAxeUse;
                    };
                };
            } foreach life_inv_items;
        }
    };
	
	//U Key
	case 22:
	{
		if(!_alt && !_ctrlKey) then {
		
			if(vehicle player == player) then {
				_veh = cursorTarget;
			} else {
				_veh = vehicle player;
			};
			
			if(_veh isKindOf "House_F" && playerSide == civilian) then {
				if(_veh in life_vehicles && player distance _veh < 8) then {
					_door = [_veh] call life_fnc_nearestDoor;
					if(_door == 0) exitWith {hint localize "STR_House_Door_NotNear"};
					_locked = _veh getVariable [format["bis_disabled_Door_%1",_door],0];
					if(_locked == 0) then {
						_veh setVariable[format["bis_disabled_Door_%1",_door],1,true];
						_veh animate [format["door_%1_rot",_door],0];
						systemChat localize "STR_House_Door_Lock";
					} else {
						_veh setVariable[format["bis_disabled_Door_%1",_door],0,true];
						_veh animate [format["door_%1_rot",_door],1];
						systemChat localize "STR_House_Door_Unlock";
					};
					};
			} else {
				_locked = locked _veh;
				if(_veh in life_vehicles && player distance _veh < 8) then {
					if(_locked == 2) then {
						if(local _veh) then {
							_veh lock 0;
							
							_veh animateDoor ["door_back_R",1];
							_veh animateDoor ["door_back_L",1];
							_veh animateDoor ['door_R',1];
							_veh animateDoor ['door_L',1];
							_veh animateDoor ['Door_rear',1];
							_veh animateDoor ['Door_LM',1];
							_veh animateDoor ['Door_RM',1];
							_veh animateDoor ['Door_LF',1];
							_veh animateDoor ['Door_RF',1];
							_veh animateDoor ['Door_LB',1];
							_veh animateDoor ['Door_RB',1];
							
						} else {
							[[_veh,0],"life_fnc_lockVehicle",_veh,false] spawn life_fnc_MP;
							
							_veh animateDoor ["door_back_R",1];
							_veh animateDoor ["door_back_L",1];
							_veh animateDoor ['door_R',1];
							_veh animateDoor ['door_L',1];
							_veh animateDoor ['Door_rear',1];
							_veh animateDoor ['Door_LM',1];
							_veh animateDoor ['Door_RM',1];
							_veh animateDoor ['Door_LF',1];
							_veh animateDoor ['Door_RF',1];
							_veh animateDoor ['Door_LB',1];
							_veh animateDoor ['Door_RB',1];
						};
						hint composeText [ image "icons\unlock.paa", " Du hast dein Fahrzeug entsperrt." ];
						player say3D "car_lock";
					} else {
						if(local _veh) then {
							_veh lock 2;
							
							_veh animateDoor ["door_back_R",0];
							_veh animateDoor ["door_back_L",0];
							_veh animateDoor ['door_R',0];
							_veh animateDoor ['door_L',0];
							_veh animateDoor ['Door_rear',0];
							_veh animateDoor ['Door_LM',0];
							_veh animateDoor ['Door_RM',0];
							_veh animateDoor ['Door_LF',0];
							_veh animateDoor ['Door_RF',0];
							_veh animateDoor ['Door_LB',0];
							_veh animateDoor ['Door_RB',0];
						} else {
							[[_veh,2],"life_fnc_lockVehicle",_veh,false] spawn life_fnc_MP;
							
							_veh animateDoor ["door_back_R",0];
							_veh animateDoor ["door_back_L",0];
							_veh animateDoor ['door_R',0];
							_veh animateDoor ['door_L',0];
							_veh animateDoor ['Door_rear',0];
							_veh animateDoor ['Door_LM',0];
							_veh animateDoor ['Door_RM',0];
							_veh animateDoor ['Door_LF',0];
							_veh animateDoor ['Door_RF',0];
							_veh animateDoor ['Door_LB',0];
							_veh animateDoor ['Door_RB',0];
						};	
						hint composeText [ image "icons\lock.paa", " Du hast dein Fahrzeug gesperrt." ];
						player say3D "unlock";
					};
				};
			};
		};
	};
	
	// O, police gate opener
    case 24:
	{
		if (playerSide != civilian && vehicle player != player) then {
			[] call life_fnc_SVOpener;
		};
		
		if (playerSide != civilian && vehicle player == player) then {
			[] call life_fnc_SOpener;
		};
		
		if (!_alt && !_ctrlKey && playerSide == west) then
		{
			if(vehicle player != player) then
			{
				[] spawn life_fnc_radarext;
			}
				else 
			{
				[] spawn life_fnc_radar;
			};
		};
	};
	
	//Earplugs - END 
    case 207:
    {
         if(!_alt && !_ctrlKey && !_shift) then
    {
        [] call life_fnc_fadeSound;
        _handled = true;
    };
    };
	
	case 79:
	{
		if(_shift) then {_handled = true;};
		if (_shift && !(player getVariable "restrained") && !(vehicle player != player)) then
		{
			player playMove "AmovPercMstpSnonWnonDnon_exerciseKata";
		};
	};

	case 80:
	{
		if(_shift) then {_handled = true;};
		if (_shift && !(player getVariable "restrained") && !(vehicle player != player)) then
		{
			player playMove "AmovPercMstpSnonWnonDnon_exercisekneeBendA";
		};
	};

	case 81:
	{
		if(_shift) then {_handled = true;};
		if (_shift && !(player getVariable "restrained") && !(vehicle player != player)) then
		{
			player playMove "AmovPercMstpSnonWnonDnon_exercisekneeBendB";
		};
	};

	case 75:
	{
		if(_shift) then {_handled = true;};
		if (_shift && !(player getVariable "restrained") && !(vehicle player != player)) then
		{
			player playMove "AmovPercMstpSnonWnonDnon_exercisePushup";
		};
	};
	
	case 62:
	{
		if (_alt) then
		{
			[] call SOCK_fnc_updateRequest;
		};
	};
	
	case 15:
	{
		if (_alt) then
		{
			[] call SOCK_fnc_updateRequest;
		};
	};
	
	case 211:
	{
		if (_alt && _ctrlKey) then
		{
			[] call SOCK_fnc_updateRequest;
		};
	};
	
};

_handled;