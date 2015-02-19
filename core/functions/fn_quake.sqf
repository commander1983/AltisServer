_isCalledByPlayer = [_this,0,0,[0]] call BIS_fnc_param;

if (_isCalledByPlayer!=1) then {
	sleep 120;
};

[] spawn {
				"dynamicBlur" ppEffectEnable true;
				"dynamicBlur" ppEffectAdjust [1];
				"dynamicBlur" ppEffectCommit 1;

				"colorCorrections" ppEffectEnable true;
				"colorCorrections" ppEffectAdjust [0.8, 15, 0, [0.5, 0.5, 0.5, 0], [0.0, 0.0, 0.6, 2],[0.3, 0.3, 0.3, 0.1]];"colorCorrections" ppEffectCommit 0.4;
				 
				"dynamicBlur" ppEffectAdjust [0.5];
				"dynamicBlur" ppEffectCommit 3;

				0 setOvercast 0;
				sleep 0.1;

				_xHandle = []spawn
				{
					Sleep 1;
					"colorCorrections" ppEffectAdjust [1.0, 0.5, 0, [0.5, 0.5, 0.5, 0], [1.0, 1.0, 0.8, 0.4],[0.3, 0.3, 0.3, 0.1]];
					"colorCorrections" ppEffectCommit 2;
				};


				"dynamicBlur" ppEffectAdjust [2];
				"dynamicBlur" ppEffectCommit 1;

				"dynamicBlur" ppEffectAdjust [0.5];
				"dynamicBlur" ppEffectCommit 4;

				sleep 4.5;

				"colorCorrections" ppEffectAdjust [1, 1, 0, [0.5, 0.5, 0.5, 0], [1.0, 1.0, 0.8, 0.4],[0.3, 0.3, 0.3, 0.1]];"colorCorrections" ppEffectCommit 1; "colorCorrections" ppEffectEnable TRUE;
				"dynamicBlur" ppEffectAdjust [0];
				"dynamicBlur" ppEffectCommit 1;
};
//[{hint 'Bekoo Verified';},"BIS_fnc_Spawn",true,false] call BIS_fnc_MP;
sleep 5;
[{2 setfog [0.02, 0.1, 80];2 setovercast 0.5; 360 setRain 1; setdate [2010, 6, 1, 3, 0];oneachframe {skiptime 0.003};},"BIS_fnc_Spawn",true,false] call BIS_fnc_MP; //ON
sleep 5;
[] spawn {
		_pos = screenToWorld [0.5,0.5];
		_bolt = "LightningBolt" createVehicle _pos;
		_light = "#lightpoint" createVehicle _pos;
		_light setposatl [_pos select 0,_pos select 1,(_pos select 2) + 10];
		_light setLightDayLight true;
		_light setLightBrightness 300;
		_light setLightAmbient [0.05, 0.05, 0.1];
		_light setlightcolor [1, 1, 2];

		sleep 0.1;
		_light setLightBrightness 0;
		sleep (random 0.1);

		_class = ["lightning1_F","lightning2_F"] call bis_Fnc_selectrandom;
		_lightning = _class createVehicle _pos;
		
		
		_duration = if (isnull cursortarget) then {(3 + random 1)} else {1};

		for "_i" from 0 to _duration do {
			_time = time + 0.1;
			_light setLightBrightness (100 + random 100);
			waituntil {
				time > _time
			};
		};
		
		deletevehicle _lightning;
		deletevehicle _light;
};
sleep 5;
[] spawn {
		_pos = screenToWorld [0.5,0.5];
		_bolt = "LightningBolt" createVehicle _pos;
		_light = "#lightpoint" createVehicle _pos;
		_light setposatl [_pos select 0,_pos select 1,(_pos select 2) + 10];
		_light setLightDayLight true;
		_light setLightBrightness 300;
		_light setLightAmbient [0.05, 0.05, 0.1];
		_light setlightcolor [1, 1, 2];

		sleep 0.1;
		_light setLightBrightness 0;
		sleep (random 0.1);

		_class = ["lightning1_F","lightning2_F"] call bis_Fnc_selectrandom;
		_lightning = _class createVehicle _pos;
		
		
		_duration = if (isnull cursortarget) then {(3 + random 1)} else {1};

		for "_i" from 0 to _duration do {
			_time = time + 0.1;
			_light setLightBrightness (100 + random 100);
			waituntil {
				time > _time
			};
		};
		
		deletevehicle _lightning;
		deletevehicle _light;
	};
sleep 30;
[] spawn {
				"dynamicBlur" ppEffectEnable true;
				"dynamicBlur" ppEffectAdjust [1];
				"dynamicBlur" ppEffectCommit 1;

				"colorCorrections" ppEffectEnable true;
				"colorCorrections" ppEffectAdjust [0.8, 15, 0, [0.5, 0.5, 0.5, 0], [0.0, 0.0, 0.6, 2],[0.3, 0.3, 0.3, 0.1]];"colorCorrections" ppEffectCommit 0.4;
				 
				"dynamicBlur" ppEffectAdjust [0.5];
				"dynamicBlur" ppEffectCommit 3;

				0 setOvercast 0;
				sleep 0.1;

				_xHandle = []spawn
				{
					Sleep 1;
					"colorCorrections" ppEffectAdjust [1.0, 0.5, 0, [0.5, 0.5, 0.5, 0], [1.0, 1.0, 0.8, 0.4],[0.3, 0.3, 0.3, 0.1]];
					"colorCorrections" ppEffectCommit 2;
				};


				"dynamicBlur" ppEffectAdjust [2];
				"dynamicBlur" ppEffectCommit 1;

				"dynamicBlur" ppEffectAdjust [0.5];
				"dynamicBlur" ppEffectCommit 4;

				sleep 4.5;

				"colorCorrections" ppEffectAdjust [1, 1, 0, [0.5, 0.5, 0.5, 0], [1.0, 1.0, 0.8, 0.4],[0.3, 0.3, 0.3, 0.1]];"colorCorrections" ppEffectCommit 1; "colorCorrections" ppEffectEnable TRUE;
				"dynamicBlur" ppEffectAdjust [0];
				"dynamicBlur" ppEffectCommit 1;
};
[{2 setfog [0, 0, 0];2 setovercast 1;},"BIS_fnc_Spawn",true,false] call BIS_fnc_MP; //WEATHER OFF
sleep 25;
				"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 1],  [1, 1, 1, 0.0]];
				"colorCorrections" ppEffectCommit 0;
				"filmGrain" ppEffectEnable false;
				"filmGrain" ppEffectCommit 0;
sleep 60;
//[] execVM "core\functions\fn_nuke.sqf";
[{oneachframe {skiptime 0};},"BIS_fnc_Spawn",true,false] call BIS_fnc_MP; //TIME OFF