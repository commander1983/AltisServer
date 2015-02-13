if("ItemRadio" in assignedItems cursorTarget) then {
	cursorTarget removeweapon "ItemRadio";
	player addItemToBackpack "ItemRadio";
	hint "Du hast der Person das Handy abgenommen!";
} else { 
	hint "Die Person hatte kein Handy dabei!";
};