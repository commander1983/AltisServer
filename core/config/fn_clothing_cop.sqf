#include <macro.h>
/*
	File: fn_clothing_cop.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master config file for Cop clothing store.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"APD Kleidungs-Shop"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		if(__GETC__(life_coplevel) == 1) then
		{
			_ret pushBack ["U_Rangemaster","Anwaerter",1000];
		};
		if(__GETC__(life_coplevel) == 2) then
		{
			_ret pushBack ["U_Rangemaster","Polizist",1000];
		};
		if(__GETC__(life_coplevel) == 3) then
		{
			_ret pushBack ["U_Rangemaster","Polizeimeister",1000];
		};
		if(__GETC__(life_coplevel) == 4) then
		{
			_ret pushBack ["U_Rangemaster","Polizeihauptmeister",1000];
		};
		if(__GETC__(life_coplevel) == 5) then
		{
			_ret pushBack ["U_Rangemaster","Kommissar",1000];
		};
		if(__GETC__(life_coplevel) == 6) then
		{
			_ret pushBack ["U_Rangemaster","Oberkommissar",1000];
		};
		if(__GETC__(life_coplevel) == 7) then
		{
			_ret pushBack ["U_Rangemaster","Hauptkommissar",1000];
		};
		if(__GETC__(life_coplevel) == 8) then
		{
			_ret pushBack ["U_Rangemaster","Polizeidirektor",1000];
		};
	};
	
	//Hats
	case 1:
	{
		_ret pushBack ["H_Beret_blk_POLICE",nil,50];
	};
	
	//Glasses
	case 2:
	{
		if(__GETC__(life_coplevel) > 4) then
		{
			_ret pushBack ["G_Aviator",nil,150];
		};
	};
	
	//Vest
	case 3:
	{
		if(__GETC__(life_coplevel) < 3) then
		{
			_ret pushBack ["V_Rangemaster_belt",nil,1000];
		};
		if(__GETC__(life_coplevel) > 2) then
		{
			_ret pushBack ["V_TacVest_blk_POLICE","Polizeiweste",2500];
		};

		
	};
	
	//Backpacks
	case 4:
	{
		_ret pushBack ["B_Carryall_cbr",nil,500];
	};
};

_ret;