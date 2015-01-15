/*
	File: fn_virt_shops.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Config for virtual shops.
*/
private["_shop"];
_shop = _this select 0;

switch (_shop) do
{
	case "market": {["Supermarkt",["water","redgull","tbacon","pickaxe","fuelF","grapes","apple","peach","banane","cerises","birne","battery","storagesmall","storagebig"]]};
	case "coctail": {["Cocktailbar",["grapes","apple","peach","banane","cerises","birne","pcolap","sotbp","maitp"]]};
	case "wongs": {["Schildkroetendealer",["turtlesoup","turtle"]]};
	case "coffee": {["Stratis Coffee Club",["coffee","donuts"]]};
	case "heroin": {["Drogendealer",["cocainep","heroinp","methp","marijuana","frogslsd"]]};
	case "oil": {["Oel Haendler",["oilp"]]};
	case "fishmarket": {["Fischmarkt",["salema","ornate","mackerel","mullet","tuna","catshark","fishing"]]};
	case "glass": {["Glas Haendler",["glass"]]};
	case "iron": {["Kupfer / Eisen - Haendler",["iron_r","copper_r"]]};
	case "diamond": {["Diamant Haendler",["diamondc"]]};
	case "salt": {["Salz Haendler",["salt_r"]]};
	case "cop": {["Polizeiitemladen",["handcuffs","keys","donuts","coffee","spikeStrip","water","rabbit","redgull","fuelF","battery","sperre","warnung","defusekit","coppainkillers"]]};
	case "cement": {["Zement Haendler",["cement"]]};
	case "beer": {["Schnappsladen",["vodka"]]};
	case "gas": {["Tankstelle",["water","redgull","tbacon","fuelF","pickaxe"]]};
	case "juwelg": {["Juwelier",["goldp"]]};
	case "juwels": {["Juwelier",["silberp"]]};
	case "blackmarket": {["Schwarzmarkt",["moonshine","uranp"]]};
	case "rebel": {["Rebellenshop",["handcuffs","keys","pickaxe","fuelF","water","battery","redgull","tbacon","lockpick","boltcutter","blastingcharge","painkillers","pille"]]};
	case "gang": {["Gangshop",["handcuffs","keys","pickaxe","fuelF","battery","water","redgull","tbacon","lockpick","boltcutter","blastingcharge","painkillers","pille"]]};
	case "adacmed": {["Sani/Medic",["water","redgull","tbacon","fuelF","battery","lockpick","sperre","warnung"]]};
	case "gold": {["Platin ankauf",["goldbar"]]};
	case "pruefung": {["Fuehrerscheinformular",["license"]]};
	case "kristall": {["SchmuckJuwelier",["kristalle"]]};
};