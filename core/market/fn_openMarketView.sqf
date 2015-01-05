/*

	Open pack-up dlg

*/
if(!createDialog "marketView") exitWith {hint "Failed Creating Dialog";}; //Couldn't create the menu?
if(life_battery < 2) exitWith {hint "Dein Akku ist leer!"};

if("ItemRadio" in assignedItems player) then {
	disableSerialization;
	waitUntil {!isnull (findDisplay 39500)};
	[] spawn life_fnc_refreshMarketView;
} else { 
	hint "Du hast kein Handy dabei!";
	closeDialog 0;
};


