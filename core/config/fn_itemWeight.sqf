/*
	File: fn_itemWeight.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gets the items weight and returns it.
*/
private["_item"];
_item = [_this,0,"",[""]] call BIS_fnc_param;
if(_item == "") exitWith {};

switch (_item) do
{
	case "oilu": {7};
	case "oilp": {4};
	case "heroinu": {6};
	case "heroinp": {3};
	case "cannabis": {4};
	case "marijuana": {2};
	case "apple": {1};
	case "water": {1};
	case "rabbit": {1};
	case "salema": {2};
	case "ornate": {2};
	case "mackerel": {4};
	case "tuna": {6};
	case "mullet": {4};
	case "catshark": {6};
	case "turtle": {6};
	case "fishing": {2};
	case "turtlesoup": {2};
	case "donuts": {1};
	case "coffee": {1};
	case "fuelF": {5};
	case "money": {0};
	case "pickaxe": {1};
	case "copperore": {4};
	case "ironore": {5};
	case "copper_r": {2};
	case "iron_r": {3};
	case "sand": {3};
	case "salt": {3};
	case "salt_r": {1};
	case "glass": {1};
	case "diamond": {4};
	case "diamondc": {2};
	case "cocaine": {6};
	case "cocainep": {3};
	case "spikeStrip": {10};
	case "rock": {6};
	case "cement": {3};
	case "methu": {6};
	case "methp": {3};
	case "vodka": {2};
	case "moonshine": {2};
	case "grapes": {3};
	case "goldu": {7};
	case "goldp": {4};
	case "silberu": {7};
	case "silberp": {4};
	case "uranu": {9};
	case "uranp": {5};
	case "frogs": {4};
	case "frogslsd": {2};
	case "handcuffs": {1};
	case "cerises": {1};
	case "banane": {1};
	case "sotbp": {1};
	case "pcolap": {1};
	case "maitp": {1};
	case "birne": {1};
	case "battery": {1};
	case "goldbar": {12};
	case "blastingcharge": {15};
	case "boltcutter": {5};
	case "defusekit": {2};
	case "keys": {1};
	case "painkillers": {5};
	case "storagesmall": {5};
	case "storagebig": {10};
	case "sperre": {8};
	case "warnung": {3};
	case "license": {1};
	default {1};
};
