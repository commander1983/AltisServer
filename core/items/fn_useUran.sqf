//Close inventory
closeDialog 0;

//Little hint then wait a little before starting moonshine effects
hint "Hast du das wirklich getan?";
sleep 5;

//Activate ppEffects we need
[] spawn life_fnc_handleDownedD;