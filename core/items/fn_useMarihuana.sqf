private["_dmg","_count"];

life_drugged = life_drugged_weed;
life_drugged_duration = life_drugged_weed_duration;

if(life_drugged < 1) then { life_drugged = 1; } else {life_drugged = life_drugged + 1;};

// Overdose
if ( life_drugged > 2) then
{
	_dmg = (damage player) + 0.3;
	life_drugged = life_drugged - 1;
	
	if (_dmg < 0.9) then
	{
		hint "Du erleidest Schaden wegen einer Ueberdosis!";
		player setFatigue 1;
		player setDamage _dmg;
	} else {
		hint "Du bist aufgrund einer Ueberdosis bewusstlos geworden!";
		[] spawn life_fnc_handleDownedD;
	};
} else {
	sleep 5;
	//Effekt Anfang
	//Activate ppEffects we need
"chromAberration" ppEffectEnable true;
"radialBlur" ppEffectEnable true;
enableCamShake true;

//Let's go for 45secs of effetcs
for "_i" from 0 to 300 do
{
    "chromAberration" ppEffectAdjust [random 0.25,random 0.25,true];
    "chromAberration" ppEffectCommit 1;   
    "radialBlur" ppEffectAdjust  [random 0.02,random 0.02,0.15,0.15];
    "radialBlur" ppEffectCommit 1;
    addcamShake[random 3, 1, random 3];
	player setVariable ["drug_weed", true, true];
    sleep 1;
};

//Stop effects
"chromAberration" ppEffectAdjust [0,0,true];
"chromAberration" ppEffectCommit 5;
"radialBlur" ppEffectAdjust  [0,0,0,0];
"radialBlur" ppEffectCommit 5;
sleep 6;


//Deactivate ppEffects
"chromAberration" ppEffectEnable false;
"radialBlur" ppEffectEnable false;
resetCamShake;
	//Effekt Ende
	for [{_x=0},{_x < life_drugged_duration * 4 && Alive player},{_x=_x+1}] do
	{
		if(_x % 4 == 0) then
		{
			life_hunger = life_hunger - 5;
			[] spawn life_fnc_hudUpdate;
		};
		sleep 15;	
	};
	
	life_drugged = life_drugged - 1;

	_count = 0;
	while{life_drugged < 1 && Alive player} do 
	{
		if(life_drugged < 0 OR _count > 100) exitWith { life_drugged = -1; hint "Du bist nun nicht mehr suechtig.";};
		
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
	
	if(life_drugged < 0 || !Alive player) then { player setVariable["drug_weed",false,true]; life_drugged = -1; };

};