#include <macro.h>
/*
	File:
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration list / array for buyable vehicles & prices and their shop.
*/
private["_shop","_return"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {[]};
_return = [];
switch (_shop) do
{
	case "kart_shop":
	{
		_return = [
			["C_Kart_01_F",10000],
			["C_Kart_01_Blu_F",10000],
			["C_Kart_01_Fuel_F",10000],
			["C_Kart_01_Red_F",10000],
			["C_Kart_01_Vrana_F",10000]
		];
	};
	
	case "adac_shop":
	{	
		if(__GETC__(life_adaclevel) > 0) then
		{
			_return pushBack ["B_Quadbike_01_F",1000];
			_return pushBack ["C_Offroad_01_F",5000];
		};
		
		if(__GETC__(life_adaclevel) > 3) then
		{
			_return pushBack ["C_SUV_01_F",7500];
		};

		if(__GETC__(life_adaclevel) > 2) then
		{
			_return pushBack ["B_Truck_01_transport_F",15000];
		};
	};
	
	case "adac_air_hs": 
	{
		if(__GETC__(life_adaclevel) > 1) then
		{
			_return pushBack ["B_Heli_Light_01_F",50000];
		};
		
		if(__GETC__(life_adaclevel) > 3) then
		{
			_return pushBack ["I_Heli_Transport_02_F",100000];
			_return pushBack ["B_Heli_Transport_03_unarmed_F",100000];
			_return pushBack ["O_Heli_Transport_04_F",100000];
		};
	};
	
	case "med_shop":
	{
		if(__GETC__(life_mediclevel) > 0) then
		{
			_return pushBack ["B_Quadbike_01_F",1000];
			_return pushBack ["C_Offroad_01_F",5000];
		};
		
		if(__GETC__(life_mediclevel) > 1) then
		{
			_return pushBack ["C_Hatchback_01_sport_F",2500];
		};

		if(__GETC__(life_mediclevel) > 2) then
		{
			_return pushBack ["C_SUV_01_F",2500];
		};
	};
	
	case "med_air_hs": 
	{
		if(__GETC__(life_mediclevel) > 1) then
		{
			_return pushBack ["B_Heli_Light_01_F",50000];
		};
		
		if(__GETC__(life_mediclevel) > 3) then
		{
			_return pushBack ["O_Heli_Light_02_unarmed_F",75000];
		};
	};
	
	
	case "civ_car":
	{
		_return = 
		[
			["B_Quadbike_01_F",1000],
			["C_Hatchback_01_F",6000],
			["C_Hatchback_01_sport_F",40000],
			["C_Offroad_01_F",8000],
			["C_SUV_01_F",15000],
			["C_Van_01_transport_F",22500]
		];
	};
	
	case "civ_truck":
	{
		_return =
		[
			["C_Van_01_box_F",30000],
			["I_Truck_02_transport_F",65000],
			["I_Truck_02_covered_F",75000],
			["I_Truck_02_box_F",95000],
			["B_Truck_01_covered_F",300000],
			["B_Truck_01_box_F",500000]
		];	
	};
	
	
	case "reb_car":
	{
		_return =
		[
			["B_Quadbike_01_F",1000],
			["B_G_Offroad_01_F",40000],
			["B_G_Offroad_01_armed_F",2000000],
			["B_MRAP_01_F",650000],
			["B_Heli_Light_01_F",900000],
			["O_Heli_Light_02_unarmed_F",2050000],
			["O_Heli_Transport_04_covered_F",2250000]
			
		];
	};
	
	case "civ_air":
	{
		_return =
		[
			["B_Heli_Light_01_F",850000],
			["C_Heli_Light_01_civil_F",860000],
			["O_Heli_Light_02_unarmed_F",2000000]
		];
	};
	
	case "civ_ship":
	{
		_return =
		[
			["C_Rubberboat",5000],
			["C_Boat_Civil_01_F",22000]
		];
	};
	
	case "cop_car":
	{
		if(__GETC__(life_coplevel) > 0) then
		{
			_return pushBack ["B_Quadbike_01_F",1000];
		};
		if(__GETC__(life_coplevel) > 1) then
		{
			_return pushBack ["C_Hatchback_01_F",2500];
		};
		if(__GETC__(life_coplevel) > 2) then
		{
			_return pushBack ["C_Offroad_01_F",3500];
		};
		if(__GETC__(life_coplevel) > 3) then
		{
			_return pushBack ["C_SUV_01_F",9000];
		};
		if(__GETC__(life_coplevel) > 4) then
		{
			_return pushBack ["C_Hatchback_01_sport_F",12500];
		};
		if(__GETC__(life_coplevel) > 5) then
		{
			_return pushBack ["O_MRAP_02_F",35000];
		};
		if(__GETC__(life_coplevel) > 6) then
		{
			_return pushBack ["I_MRAP_03_F",50000];
		};
	};
	
	case "cop_air":
	{
		if(__GETC__(life_coplevel) > 2) then
		{
			_return pushBack ["B_Heli_Light_01_F",20000];
		};
	
		if(__GETC__(life_coplevel) > 4) then
		{
			_return pushBack ["I_Heli_light_03_unarmed_F",35000];
			
		};
		
		if(__GETC__(life_coplevel) > 5) then
		{
			_return pushBack ["B_Heli_Transport_03_unarmed_F",90000];
			_return pushBack ["B_Heli_Transport_01_F",100000];
		};
		
	};

	case "cop_ship":
	{
		_return pushBack ["B_Boat_Transport_01_F",1500];
		_return pushBack ["C_Boat_Civil_01_police_F",2500];
	};
	
	case "donator_1":
	{
		if(__GETC__(life_donator) > 0) then
		{			
			_return pushBack ["B_Quadbike_01_F",800];
			_return pushBack ["C_Hatchback_01_F",4800];
			_return pushBack ["C_Hatchback_01_sport_F",32000];
			_return pushBack ["C_Offroad_01_F",6400];
			_return pushBack ["C_SUV_01_F",12000];
			_return pushBack ["C_Van_01_transport_F",18000];
			_return pushBack ["C_Van_01_box_F",24000];
			_return pushBack ["I_Truck_02_transport_F",52000];
			_return pushBack ["I_Truck_02_covered_F",60000];
			_return pushBack ["I_Truck_02_box_F",76000];
			_return pushBack ["B_Truck_01_transport_F",200000];
			_return pushBack ["B_Truck_01_covered_F",240000];
			_return pushBack ["B_Truck_01_box_F",400000];
			_return pushBack ["O_Truck_03_transport_F",200000];
			_return pushBack ["O_Truck_03_device_F",450000];
			_return pushBack ["O_Truck_03_fuel_F",400000];
			_return pushBack ["O_Truck_03_covered_F",240000];
			_return pushBack ["O_Truck_03_repair_F",400000];
			_return pushBack ["B_Heli_Light_01_F",680000];
			_return pushBack ["C_Heli_Light_01_civil_F",688000];
			_return pushBack ["O_Heli_Light_02_unarmed_F",1600000];
			_return pushBack ["I_Heli_Transport_02_F",1600000];
			_return pushBack ["O_Heli_Transport_04_covered_F",1800000];
		}; 
	};
	
	case "donator_cop":
	{
		if(__GETC__(life_donator) > 0) then
		{
			if(__GETC__(life_coplevel) > 1) then
			{
				_return pushBack ["C_Hatchback_01_F",2500];
			};
			
			if(__GETC__(life_coplevel) > 2) then
			{
				_return pushBack ["C_Offroad_01_F",3500];
				_return pushBack ["B_Heli_Light_01_F",20000];
			};
			if(__GETC__(life_coplevel) > 3) then
			{
				_return pushBack ["C_SUV_01_F",9000];
			};
			if(__GETC__(life_coplevel) > 4) then
			{
				_return pushBack ["C_Hatchback_01_sport_F",12500];
			};
		};
	};
	
	case "med_donator":
	{
		if(__GETC__(life_donator) > 0) then
		{
			if(__GETC__(life_mediclevel) > 2) then
			{
				_return pushBack ["I_MRAP_03_F",40000];
			};
		};
	};
	
	case "adac_donator":
	{
		if(__GETC__(life_donator) > 0) then
		{
			if(__GETC__(life_adaclevel) > 2) then
			{
				_return pushBack ["I_MRAP_03_F",40000];
			};
		};
	};
	
	case "donator_2":
	{
		if(__GETC__(life_donator) > 0) then
		{			
			_return pushBack ["I_SDV_01_F",7500];
		}; 
	};
};

_return;
