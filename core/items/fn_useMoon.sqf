private["_dmg","_count"];

if(life_drugged_moon < 1) then { life_drugged_moon = 1; } else {life_drugged_moon = life_drugged_moon + 1;};

// Overdose
if ( life_drugged_moon > 2) then
{
	_dmg = (damage player) + 0.3;
	life_drugged_moon = life_drugged_moon - 1;
	
	if (_dmg < 0.9) then
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
"chromAberration" ppEffectEnable true;
"radialBlur" ppEffectEnable true;
enableCamShake true;

//Let's go for 120secs of effetcs
for "_i" from 0 to 300 do
{
    "chromAberration" ppEffectAdjust [random 0.05,random 0.05,true];
    "chromAberration" ppEffectCommit 1;   
    "radialBlur" ppEffectAdjust  [random 0.02,random 0.02,0.01,0.01];
    "radialBlur" ppEffectCommit 1;
     addcamShake[random 4, 2, random 5];
	player setVariable ["drug_moon", true, true];
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
	for [{_x=0},{_x < life_drugged_moon_duration * 4 && Alive player},{_x=_x+1}] do
	{
		if(_x % 4 == 0) then
		{
			life_thirst = life_thirst - 5;
			[] spawn life_fnc_hudUpdate;
		};
		sleep 15;	
	};
	
	life_drugged_moon = life_drugged_moon - 1;

	_count = 0;
	while{life_drugged_moon < 1 && Alive player} do 
	{
		if(life_drugged_moon < 0 OR _count > 100) exitWith { life_drugged_moon = -1; hint "Du bist nun nicht mehr suechtig.";};
		
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
	
	if(life_drugged_moon < 0 || !Alive player) then { player setVariable["drug_moon",false,true]; life_drugged_moon = -1; };

};