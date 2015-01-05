if("ItemRadio" in assignedItems cursorTarget) then {
	cursorTarget removeweapon "ItemRadio";
	player addItemToBackpack "ItemRadio";
} else { 
	hint "Die Person hatte kein Handy dabei!";
};