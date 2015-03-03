private["_dmg","_count"];

if(life_drugged_lsd < 1) then { life_drugged_lsd = 1; } else {life_drugged_lsd = life_drugged_lsd + 1;};

// Overdose
if ( life_drugged_lsd > 2) then
{
	_dmg = (damage player) + 0.5;
	life_drugged_lsd = life_drugged_lsd - 1;
	
	if (_dmg < 1) then
	{
		hint "Du erleidest Schaden wegen einer Überdosis!";
		player setFatigue 1;
		player setDamage _dmg;
	} else {
		hint "Du bist aufgrund einer Überdosis bewusstlos geworden!";
		[] spawn life_fnc_handleDownedD;
	};
} else {
	sleep 5;
	//Effekt Anfang
	player setDamage (0.1 + (damage player));
[] call life_fnc_hudUpdate;				
		
for "_i" from 0 to 300 do

		{
		
		player setVariable ["drug_lsd", true, true];
		"colorCorrections" ppEffectEnable true;
		"colorCorrections" ppEffectAdjust [1, 1, 0, [0,0,0,0.5], [random 5 - random 5,random 5 - random 5,random 5 - random 5,random 1], [random 5 - random 5,random 5 - random 5,random 5 - random 5, random 1]];
		"colorCorrections" ppEffectCommit 1;
		"chromAberration" ppEffectEnable true;
		"chromAberration" ppEffectAdjust [0.01,0.01,true];
		"chromAberration" ppEffectCommit 1;
		sleep 3;

		};
		
"colorInversion" ppEffectEnable false;
"wetDistortion" ppEffectEnable false;
"colorCorrections" ppEffectAdjust [1, 1, 0, [0.5,0.5,0.5,0], [0.5,0.5,0.5,0], [0.5,0.5,0.5,0]];
"colorCorrections" ppEffectCommit 10;
waitUntil {ppEffectCommitted "colorCorrections"};
"colorCorrections" ppEffectEnable false;
"chromAberration" ppEffectEnable false;
	//Effekt Ende
	for [{_x=0},{_x < life_drugged_lsd_duration * 4 && Alive player},{_x=_x+1}] do
	{
		if(_x % 4 == 0) then
		{
			life_hunger = life_hunger - 5;
			life_thirst = life_thirst - 10;
			[] spawn life_fnc_hudUpdate;
		};
		sleep 15;	
	};
	
	life_drugged_lsd = life_drugged_lsd - 1;

	_count = 0;
	while{life_drugged_lsd < 1 && Alive player} do 
	{
		if(life_drugged_lsd < 0 OR _count > 100) exitWith { life_drugged_lsd = -1; hint "Du bist nun nicht mehr süchtig.";};
		
		if(_count < 1) then {hint "Du bist nun erschoepft und geschwaecht aufgrund einer Überdosis!";};
		
		if(_count % 10 == 0) then
		{
			player setFatigue 1;
			player setDamage (damage player) + 0.05;	
			[] spawn life_fnc_hudUpdate;
		};
		
		_count = _count + 1;
		
		sleep 12;
	};
	
	if(life_drugged_lsd < 0 || !Alive player) then { player setVariable["drug_lsd",false,true]; life_drugged_lsd = -1; };

};