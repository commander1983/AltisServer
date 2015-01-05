_chance = random(2); //calling a random number between 0-100. 
if(_chance > 1) then {
	[[0,format["- %1 wird nun elendig an Zyankali verenden!!!",player getVariable["realname",name player]]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
	enableCamShake true;
	addCamShake [10, 45, 10];
	player setDamage (0.2 + (damage player));
	sleep 3;
	player setDamage (0.2 + (damage player));   
	sleep 3;
	player setDamage (0.2 + (damage player));
	sleep 3;
	player setDamage (0.2 + (damage player));
	sleep 3;
	player setDamage (0.2 + (damage player));
	sleep 3;
	resetCamShake;
	player setDamage (0.2 + (damage player));
	sleep 3;
	player setDamage (0.2 + (damage player));
	sleep 3;
	player setDamage (0.2 + (damage player));
	sleep 3;
	player setDamage (0.2 + (damage player));
	sleep 3;
	player setDamage (0.2 + (damage player));
	sleep 3;
	
	closeDialog 0; 
	life_respawned = true; 
	[] call life_fnc_spawnMenu;
	
} else {
	[[0,format["Hmm... ein Kaugummi mit Wassermelonengeschmack. Moment?! Das war gar keine Zyankalikapsel!!",player getVariable["realname",name player]]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
};