/*
	File: fn_useItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main function for item effects and functionality through the player menu.
*/
private["_item"];
disableSerialization;
if((lbCurSel 2005) == -1) exitWith {hint localize "STR_ISTR_SelectItemFirst";};
_item = lbData[2005,(lbCurSel 2005)];
if(player getVariable ["restrained", true] && _item != "pille") exitWith {hint "Du kannst kein Items (ausgenommen: Zyankalikapsel) verwenden während du gefesselt bist.";};
if(player getVariable ["surrender", false] && _item != "pille") exitWith {hint "Du kannst kein Items (ausgenommen: Zyankalikapsel) verwenden während du dich ergibst.";};

switch (true) do
{
	case (_item == "water" or _item == "coffee"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			life_thirst = 100;
			player setFatigue 0;
		};
	};
	
	case (_item == "boltcutter"): 
	{
		[cursorTarget] spawn life_fnc_boltcutter;
		closeDialog 0;
	};
	
	case (_item == "blastingcharge"): 
	{
		player reveal fed_bank;
		(group player) reveal fed_bank;
		[cursorTarget] spawn life_fnc_blastingCharge;
	};
	
	case (_item == "defusekit"): 
	{
		[cursorTarget] spawn life_fnc_defuseKit;
	};
	
	case (_item == "redgull"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			life_thirst = 100;
			player setFatigue 0;
			[] spawn
			{
				life_redgull_effect = time;
				titleText[localize "STR_ISTR_RedGullEffect","PLAIN"];
				player enableFatigue false;
				waitUntil {!alive player OR ((time - life_redgull_effect) > (3 * 60))};
				player enableFatigue true;
				titleText["Die Wirkung des Energy-Drinks hat nachgelassen.", "PLAIN"];
			};
		};
	};
	
	case (_item == "spikeStrip"):
	{
		if(!isNull life_spikestrip) exitWith {hint localize "STR_ISTR_SpikesDeployment"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_spikeStrip;
		};
	};
	
	case (_item == "sperre"):
	{
		if(!isNull life_sperre) exitWith {hint "Du stellst bereits eine Straßensperre auf!"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_sperre;
		};
	};
	
	case (_item == "warnung"):
	{
		if(!isNull life_warnung) exitWith {hint "Du stellst bereits eine Pylone auf!"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_warnung;
		};
	};
	
	case (_item == "fuelF"):
	{
		if(vehicle player != player) exitWith {hint localize "STR_ISTR_RefuelInVehicle"};
		[] spawn life_fnc_jerryRefuel;
	};
	
	case (_item == "marijuana"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_useMarihuana;
		};
	};
	
	case (_item == "heroinp"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_useHeroin;
		};
	};
	
	case (_item == "cocainep"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_useKokain;
		};
	};
	
	case (_item == "frogslsd"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_useLSD;
		};
	};
	
	case (_item == "methp"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_useMeth;
		};
	};
	
	case (_item == "uranp"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_useUran;
		};
	};
	
	case (_item == "moonshine"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_useMoon;
		};
	};
	
	case (_item == "vodka"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_useAlkohol;
		};
	};
	
	case (_item == "lockpick"):
	{
		[] spawn life_fnc_lockpick;
	};
	
	case (_item in ["apple","rabbit","salema","ornate","mackerel","tuna","mullet","catshark","turtle","turtlesoup","donuts","tbacon","peach"]):
	{
		[_item] call life_fnc_eatFood;
	};
	
	case "fishing":
	{
		[] spawn fnc_fishing;
	};
	
	case (_item == "pickaxe"):
	{
		hint "Du kannst die Spitzhacke benutzen indem du  Q  drückst.";
	};
	
	case (_item == "battery"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			life_battery = 100;
			hint "Du hast deine Handybatterie gegen eine aufgeladene ausgetauscht.";
		};
	};
	
	case (_item == "painkillers"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			player setDamage 0;
		};
	};
	
	case (_item == "coppainkillers"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			player setDamage 0;
		};
	};
	
	case (_item == "pille"):									   
	{															  
		if(([false,_item,1] call life_fnc_handleInv)) then		  
		{	
			[]spawn life_fnc_pille							  						
		};												   
	};
	
	case (_item in ["storagesmall","storagebig"]): {
		[_item] call life_fnc_storageBox;
	};
	
	case (_item == "license"):
	{
		if(playerside == civilian) then
		{
			if(license_civ_driver && license_civ_truck) then
			{
				if(([false,_item,1] call life_fnc_handleInv)) then
				{
					license_civ_permanent = true;
				};
			} else {
				hint "Du benötigst einen Führerschein B und Führerschein C um dieses Formular ausfüllen zu können.";
			};
		} else {
			hint "Das Formular können nur Zivilisten ausfüllen!";
		};
	};
	
	default
	{
		hint localize "STR_ISTR_NotUsable";
	};
};
	
[] call life_fnc_p_updateMenu;
[] call life_fnc_hudUpdate;