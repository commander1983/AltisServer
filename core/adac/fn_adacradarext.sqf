private ["_speed","_meters","_vehicle", "_targets", "_validtargets", "_data", "_owners", "_ownerschecked", "_targetveh", "_vehicleName"];
if((playerSide != east) OR  !(vehicle player != player)) exitWith {};
_vehicle = vehicle player;
if(isNull _vehicle) exitWith {};
if(!((typeOf _vehicle) in ["B_Quadbike_01_F","C_Hatchback_01_sport_F","C_Offroad_01_F","B_Truck_01_transport_F","C_SUV_01_F","B_Heli_Light_01_F","I_Heli_light_03_unarmed_F","I_MRAP_03_F","O_MRAP_02_F","C_Hatchback_01_F","B_Heli_Transport_01_F","B_Heli_Transport_03_unarmed_F","O_Heli_Transport_04_F"])) exitWith {}; 
if(count (crew (_vehicle)) == 0) exitWith {};
if(!alive _vehicle) exitWith {};

_targets = nearestObjects [_vehicle, ["Car","Air"], 300];
_validtargets = [];
{if (alive _x) then {_validtargets set [(count _validtargets),_x];};} foreach _targets;

if(count _validtargets < 2) exitWith {hint parseText "<t color='#ffffff'><t size='2'>Fahrzeugradar</t></t><br/><t color='#33CC33'><t size='1'>:: Nichts in Reichweite ::</t></t>"};

_targetveh = (_validtargets select 1); //take the 2nd item in the array - the first seems to be our own body or car(for some mad reason)

_speed = round speed (_targetveh);

_meters= player distance _targetveh;

_owners = _targetveh getVariable "vehicle_info_owners";

if(isNil {_owners}) then
{ 
	_data = "<t color='#ff0000'><t size='1'>! Keine Besitzer !<br/>(Cheat???)</t></t><br/>";
}
else
{
	_ownerschecked = [_owners] call life_fnc_vehicleOwners;
	
	if(_ownerschecked == "any<br/>") then
	{
		_data = "<t color='#FFD700'><t size='1'>Keine!<br/>(Bug???)</t></t><br/>";
	}
		else
	{
		_data = format["<t color='#ffffff'><t size='1'>%1</t></t><br/>", _ownerschecked];
	};
};

_vehicleName = getText(configFile >> "CfgVehicles" >> (typeOf _targetveh) >> "displayName");

_data = format["<t color='#ffffff'><t size='2'>Fahrzeugradar</t></t><br/><t color='#FF0000'><t size='1'>Typ: %1</t></t><br/><t color='#FFD700'><t size='1.5'>Besitzer:</t></t><br/>%2<br/>", _vehicleName, _data];

switch (true) do 
{
	case (_speed >= 10): 
	{	
		_data = _data + format["<t color='#ffffff'><t size='1.5'><t align='center'>In Bewegung:<br/><t color='#33CC33'><t align='center'><t size='1'>Ja",round _speed];
	};
	/*
	case (_speed <= 10): 
	{	
		_data = _data + format["<t color='#ffffff'><t size='1.5'><t align='center'>In Bewegung:<br/><t color='#FF0000'><t align='center'><t size='1'>Nein<br/><br/><t color='#ffffff'><t size='1.5'><t align='center'>Entfernung:<br/><t color='#33CC33'><t align='center'><t size='1'>%2m",round _speed, round _meters];
	};
	*/
	case (_speed <= 10 && (_meters > 0 && _meters <= 100)): 
	{	
		_data = _data + format["<t color='#ffffff'><t size='1.5'><t align='center'>In Bewegung:<br/><t color='#FF0000'><t align='center'><t size='1'>Nein<br/><br/><t color='#ffffff'><t size='1.5'><t align='center'>Entfernung:<br/><t color='#33CC33'><t align='center'><t size='1'>%2m",round _speed, round _meters];
	};
	
	case (_speed <= 10 && (_meters > 100 && _meters <= 200)): 
	{	
		_data = _data + format["<t color='#ffffff'><t size='1.5'><t align='center'>In Bewegung:<br/><t color='#FF0000'><t align='center'><t size='1'>Nein<br/><br/><t color='#ffffff'><t size='1.5'><t align='center'>Entfernung:<br/><t color='#EE7711'><t align='center'><t size='1'>%2m",round _speed, round _meters];
	};
	
	case (_speed <= 10 && (_meters > 200 && _meters <= 300)): 
	{	
		_data = _data + format["<t color='#ffffff'><t size='1.5'><t align='center'>In Bewegung:<br/><t color='#FF0000'><t align='center'><t size='1'>Nein<br/><br/><t color='#ffffff'><t size='1.5'><t align='center'>Entfernung:<br/><t color='#FF0000'><t align='center'><t size='1'>%2m",round _speed, round _meters];
	};
};

hint parseText _data;