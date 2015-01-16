/*
	File: fn_vehicleColorStr.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for color strings depending on their index location.
*/
private["_vehicle","_color","_index"];
_vehicle = [_this,0,"",[""]] call BIS_fnc_param;
_index = [_this,1,-1,[0]] call BIS_fnc_param;
_color = "";

switch (_vehicle) do
{
	case "B_Quadbike_01_F" :
	{
		switch (_index) do
		{
			case 0: {_color = "Staiy Gruen";};
			case 1: {_color = "Polizei";};
			case 2: {_color = "Braun";};
			case 3: {_color = "Digi Desert";};
			case 4: {_color = "Schwarz";};
			case 5: {_color = "Blau";};
			case 6: {_color = "Rot";};
			case 7: {_color = "Weiss";};
			case 8: {_color = "Digi Gruen";};
			case 9: {_color = "Rebel Camo";};
			case 10: {_color = "Sanitaeter";};
			case 11: {_color = "Pannenhilfe"};
		};
	};

	case "C_Offroad_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Rot";};
			case 1: {_color = "Gelb";};
			case 2: {_color = "Weiss";};
			case 3: {_color = "Blau";};
			case 4: {_color = "Dunkelrot";};
			case 5: {_color = "Blau / Weiss";};
			case 6: {_color = "Sanitaeter";};
			case 7: {_color = "Pannenhilfe";};
			case 8: {_color = "Polizei";};
			case 9: {_color = "Hugo";};
			case 10: {_color = "PinkKitty";};
			case 11: {_color = "Colt"};
			case 12: {_color = "Donator P"};
			case 13: {_color = "Rot";};
			case 14: {_color = "Gelb";};
			case 15: {_color = "Weiss";};
			case 16: {_color = "Blau";};
			case 17: {_color = "Dunkelrot";};
			case 18: {_color = "Blau / Weiss";};
		};
	};
	
	case "C_Hatchback_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Beige";};
			case 1: {_color = "Gruen";};
			case 2: {_color = "Blau";};
			case 3: {_color = "Dunkel Blau";};
			case 4: {_color = "Gelb";};
			case 5: {_color = "Weiss";};
			case 6: {_color = "Grau";};
			case 7: {_color = "Schwarz";};
			case 8: {_color = "PinkKitty";};
			case 9: {_color = "Racing";};
			case 10: {_color = "Kapow";};
			case 11: {_color = "Polizei";};
			case 12: {_color = "Donator P"};
		};
	};
	
	case "C_Hatchback_01_sport_F":
	{
		switch(_index) do
		{
			case 0: {_color = "Rot";};
			case 1: {_color = "Dunkel Blau";};
			case 2: {_color = "Orange";};
			case 3: {_color = "Tan";};
			case 4: {_color = "Gruen";};
			case 5: {_color = "Polizei";};
			case 6: {_color = "PinkKitty";};
			case 7: {_color = "Racing";};
			case 8: {_color = "Kapow";};
			case 9: {_color = "Notarzt"};
			case 10: {_color = "Donator P"};
		};
	};
	
	case "C_SUV_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Dunkel Rot";};
			case 1: {_color = "Silver";};
			case 2: {_color = "Orange";};
			case 3: {_color = "Polizei";};
			case 4: {_color = "Carbon/Blau";};
			case 5: {_color = "Gruen/Rebelle";};
			case 6: {_color = "PinkKitty"};
			case 7: {_color = "Donator P"};
			case 8: {_color = "Fahrschule"};
			case 9: {_color = "Notarzt"};
		};
	};
	
	case "C_Van_01_transport_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Weiss";};
			case 1: {_color = "Rot";};
			case 2: {_color = "Mr Slushy";};
			case 3: {_color = "Sand";};
			case 4: {_color = "Braun";};
			case 5: {_color = "Gruen/Sand";};
			case 6: {_color = "Gruen/Braun";};
			case 7: {_color = "Grau/Sand"};
		};
	};
	
	case "C_Van_01_box_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Weiss";};
			case 1: {_color = "Rot";};
			case 2: {_color = "Mr Slushy";};
			case 3: {_color = "Sand";};
			case 4: {_color = "Braun";};
			case 5: {_color = "Gruen/Sand";};
			case 6: {_color = "Gruen/Braun";};
			case 7: {_color = "Grau/Sand"};
		};
	};

	case "B_MRAP_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Camo"};
			case 1: {_color = "Schwarz"};
		};
	};
	
	case "O_MRAP_02_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Polizei"};
		};
	};
	
	case "I_MRAP_03_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Polizei"};
			case 1: {_color = "Pannenhilfe"};
			case 2: {_color = "Sanitaeter"};
		};
	};
	
	case "I_Truck_02_box_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Orange/Blau";};
			case 1: {_color = "Schwarz/Weiss";};
			case 2: {_color = "BROfrost"};
		};
	};
	
	case "I_Truck_02_covered_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Orange/Blau";};
			case 1: {_color = "Schwarz/Weiss";};
			case 2: {_color = "BROfrost"};
		};
	};
	
	case "I_Truck_02_transport_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Orange/Blau";};
			case 1: {_color = "Schwarz/Weiss";};
			case 2: {_color = "BROfrost"};
		};
	};
	
	case "B_Truck_01_transport_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Pannenhilfe"};
		};
	};
	
	case "B_Heli_Light_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Polizei";};
			case 1: {_color = "Blueline";};
			case 2: {_color = "Rot/Weiss";};
			case 3: {_color = "Blau/Weiss";};
			case 4: {_color = "Grau Orange";};
			case 5: {_color = "Blau/Grau";};
			case 6: {_color = "Schatten";};
			case 7: {_color = "Gruen/Weiss";};
			case 8: {_color = "Weiss/Orange";};
			case 9: {_color = "Redline";};
			case 10: {_color = "Rot/Schwarz";};
			case 11: {_color = "Tiger";};
			case 12: {_color = "Wellen";};
			case 13: {_color = "Gruen";};
			case 14: {_color = "Gruen Camo";};
			case 15: {_color = "Schwarz";};
			case 16: {_color = "Sanitaeter";};
			case 17: {_color = "Pannenhilfe"};
			case 18: {_color = "Donator P"};
		};
	};
	
	case "I_Heli_Transport_02_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Schwarz/Weiss";};
			case 1: {_color = "Gruen/Weiss";};
			case 2: {_color = "Green Camo";};
			case 3: {_color = "Pannenhilfe"};
		};
	};
	
	case "O_Heli_Light_02_unarmed_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Schwarz";};
			case 1: {_color = "Weiss / Blau";};
			case 2: {_color = "Digi Gruen";};
			case 3: {_color = "Desert Digi";};
			case 4: {_color = "Sanitaeter"};
		};
	};
	
	case "I_Heli_light_03_unarmed_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Polizei"};
		};
	};
	
	case "C_Heli_Light_01_civil_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Blau"};
			case 1: {_color = "Digi"};
			case 2: {_color = "Elliptical"};
			case 3: {_color = "Furios"};
			case 4: {_color = "Grau"};
			case 5: {_color = "Jeans"};
			case 6: {_color = "Light"};
			case 7: {_color = "Schatten"};
			case 8: {_color = "Sheriff"};
			case 9: {_color = "Speedy"};
			case 10: {_color = "Sunn"};
			case 11: {_color = "Vrana"};
			case 12: {_color = "Wasp"};
			case 13: {_color = "Wellen"};
		};
	};
};

_color;