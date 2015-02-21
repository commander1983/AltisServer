private["_dmg","_count"];

if(life_drugged_alk < 1) then { life_drugged_alk = 1; } else {life_drugged_alk = life_drugged_alk + 1;};

// Overdose
if ( life_drugged_alk > 2) then
{
	_dmg = (damage player) + 0.5;
	life_drugged_alk = life_drugged_alk - 1;
	
	if (_dmg < 1) then
	{
		hint "Du erleidest Schaden wegen einer Ueberdosis!";
		player setFatigue 1;
		player setDamage _dmg;
	} else {
		hint "Du bist aufgrund einer Ueberdosis bewusstlos geworden!";
		[] spawn life_fnc_handleDownedD;
		[player,"hicks"] call life_fnc_globalSound;
	};
} else {
	sleep 5;
	//Effekt Anfang
	//Activate ppEffects we need
"radialBlur" ppEffectEnable true;
enableCamShake true;

//Let's go for 45secs of effetcs
for "_i" from 0 to 300 do
{
    "radialBlur" ppEffectAdjust  [random 0.8,random 0.7,0.30,0.35];
    "radialBlur" ppEffectCommit 3;
    addcamShake[random 4, 2, random 5];
	"filmGrain" ppEffectEnable true;
    "filmGrain" ppEffectAdjust [0.09, 1, 2, 0.1, 1, false];
    "filmGrain" ppEffectCommit 0;
	player setVariable ["drug_alk", true, true];
	sleep 1;
};

//Stop effects
"radialBlur" ppEffectAdjust  [0,0,0,0];
"radialBlur" ppEffectCommit 5;
"filmGrain" ppEffectEnable false;
sleep 6;

//Deactivate ppEffects
"radialBlur" ppEffectEnable false;
"filmGrain" ppEffectEnable false;
resetCamShake;
	//Effekt Ende
	for [{_x=0},{_x < life_drugged_alk_duration * 4 && Alive player},{_x=_x+1}] do
	{
		if(_x % 4 == 0) then
		{
			life_thirst = life_thirst - 5;
			[] spawn life_fnc_hudUpdate;
		};
		sleep 15;	
	};
	
	life_drugged_alk = life_drugged_alk - 1;

	_count = 0;
	while{life_drugged_alk < 1 && Alive player} do 
	{
		if(life_drugged_alk < 0 OR _count > 100) exitWith { life_drugged_alk = -1; hint "Du bist nun nicht mehr suechtig.";};
		
		if(_count < 1) then {hint "Du bist nun erschoepft und geschwaecht aufgrund einer Ueberdosis!";};
		
		if(_count % 10 == 0) then
		{
			player setFatigue 1;
			player setDamage (damage player) + 0.05;	
			[] spawn life_fnc_hudUpdate;
		};
		
		_count = _count + 1;
		
		sleep 12;
	};
	
	if(life_drugged_alk < 0 || !Alive player) then { player setVariable["drug_alk",false,true]; life_drugged_alk = -1; };

};