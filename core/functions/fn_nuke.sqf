_isCalledByPlayer = [_this,0,0,[0]] call BIS_fnc_param;

if (_isCalledByPlayer!=1) then {
	sleep 520;
};
	[] spawn {
		playSound "Alarm";
		hintSilent parseText"<t size='1.1'>Nuke Detonation In</t><br/><br/><t size='2'>5</t>";
		sleep 1;
		playSound "Alarm";
		hintSilent parseText"<t size='1.1'>Nuke Detonation In</t><br/><br/><t size='2'>4</t>";
		sleep 1;
		playSound "Alarm";
		hintSilent parseText"<t size='1.1'>Nuke Detonation In</t><br/><br/><t size='2'>3</t>";
		sleep 1;
		playSound "Alarm";
		hintSilent parseText"<t size='1.1'>Nuke Detonation In</t><br/><br/><t size='2'>2</t>";
		sleep 1;
		playSound "Alarm";
		hintSilent parseText"<t size='1.1'>Nuke Detonation In</t><br/><br/><t size='2'>1</t>";
		sleep 1;
		playSound "Alarm";
		hintSilent "";
		sleep 1;
		
		nukepos = [22141.7,14451,0.00146222];
		mdh_nuke_destruction_zone	= 1;
		mdh_nuke_camshake			= 1;
		mdh_nuke_ash				= 1;
		mdh_nuke_colorcorrection	= 1;
		mdh_nuke_removecorrection	= 1;
		mdh_nuke_removeash 			= 1;


		_Cone = "#particlesource" createVehicle nukepos;
		_Cone setParticleParams [["A3\Data_F\ParticleEffects\Universal\universal.p3d", 16, 7, 48], "", "Billboard", 1, 10, [0, 0, 0],
						[0, 0, 0], 0, 1.275, 1, 0, [40,80], [[0.25, 0.25, 0.25, 0], [0.25, 0.25, 0.25, 0.5], 
						[0.25, 0.25, 0.25, 0.5], [0.25, 0.25, 0.25, 0.05], [0.25, 0.25, 0.25, 0]], [0.25], 0.1, 1, "", "", nukepos];
		_Cone setParticleRandom [2, [1, 1, 30], [1, 1, 30], 0, 0, [0, 0, 0, 0.1], 0, 0];
		_Cone setParticleCircle [10, [-10, -10, 20]];
		_Cone setDropInterval 0.005;

		_top = "#particlesource" createVehicle nukepos;
		_top setParticleParams [["A3\Data_F\ParticleEffects\Universal\universal.p3d", 16, 3, 48, 0], "", "Billboard", 1, 20, [0, 0, 0],
						[0, 0, 60], 0, 1.7, 1, 0, [60,80,100], [[1, 1, 1, -10],[1, 1, 1, -7],[1, 1, 1, -4],[1, 1, 1, -0.5],[1, 1, 1, 0]], [0.05], 1, 1, "", "", nukepos];
		_top setParticleRandom [0, [75, 75, 15], [17, 17, 10], 0, 0, [0, 0, 0, 0], 0, 0, 360];
		_top setDropInterval 0.002;

		_top2 = "#particlesource" createVehicle nukepos;
		_top2 setParticleParams [["A3\Data_F\ParticleEffects\Universal\universal.p3d", 16, 3, 112, 0], "", "Billboard", 1, 20, [0, 0, 0],
						[0, 0, 60], 0, 1.7, 1, 0, [60,80,100], [[1, 1, 1, 0.5],[1, 1, 1, 0]], [0.07], 1, 1, "", "", nukepos];
		_top2 setParticleRandom [0, [75, 75, 15], [17, 17, 10], 0, 0, [0, 0, 0, 0], 0, 0, 360];
		_top2 setDropInterval 0.002;

		_smoke = "#particlesource" createVehicle nukepos;
		_smoke setParticleParams [["A3\Data_F\ParticleEffects\Universal\universal.p3d", 16, 7, 48, 1], "", "Billboard", 1, 25, [0, 0, 0],
						[0, 0, 60], 0, 1.7, 1, 0, [40,15,120], 
						[[1, 1, 1, 0.4],[1, 1, 1, 0.7],[1, 1, 1, 0.7],[1, 1, 1, 0.7],[1, 1, 1, 0.7],[1, 1, 1, 0.7],[1, 1, 1, 0.7],[1, 1, 1, 0]]
						, [0.5, 0.1], 1, 1, "", "", nukepos];
		_smoke setParticleRandom [0, [10, 10, 15], [15, 15, 7], 0, 0, [0, 0, 0, 0], 0, 0, 360];
		_smoke setDropInterval 0.002;

		[] spawn {
			playSound "Earthquake_04";
			sleep 5;
			playSound "Earthquake_04";
			sleep 5;
			playSound "Earthquake_04";
			sleep 5;
			playSound "Earthquake_04";
			sleep 5;
			playSound "Earthquake_04";
			sleep 5;
			playSound "Earthquake_04";
			sleep 5;
		};
		_Wave = "#particlesource" createVehicle nukepos;
		_Wave setParticleParams [["A3\Data_F\ParticleEffects\Universal\universal.p3d", 16, 7, 48], "", "Billboard", 1, 20, [0, 0, 0],
						[0, 0, 0], 0, 1.5, 1, 0, [50, 100], [[0.1, 0.1, 0.1, 0.5], 
						[0.5, 0.5, 0.5, 0.5], [1, 1, 1, 0.3], [1, 1, 1, 0]], [1,0.5], 0.1, 1, "", "", nukepos];
		_Wave setParticleRandom [2, [20, 20, 20], [5, 5, 0], 0, 0, [0, 0, 0, 0.1], 0, 0];
		_Wave setParticleCircle [50, [-80, -80, 2.5]];
		_Wave setDropInterval 0.0002;


		_light = "#lightpoint" createVehicle [((nukepos select 0)),(nukepos select 1),((nukepos select 2)+500)];
		_light setLightAmbient[1500, 1200, 1000];
		_light setLightColor[1500, 1200, 1000];
		_light setLightBrightness 100000.0;


		if (mdh_nuke_colorcorrection > 0) then
		{
			[] spawn {
				"colorCorrections" ppEffectAdjust [2, 30, 0, [0.0, 0.0, 0.0, 0.0], [0.8*2, 0.5*2, 0.0, 0.7], [0.9, 0.9, 0.9, 0.0]];
				"colorCorrections" ppEffectCommit 0;
				"colorCorrections" ppEffectAdjust [1, 0.8, -0.001, [0.0, 0.0, 0.0, 0.0], [0.8*2, 0.5*2, 0.0, 0.7], [0.9, 0.9, 0.9, 0.0]];  
				"colorCorrections" ppEffectCommit 3;
				"colorCorrections" ppEffectEnable true;
				"filmGrain" ppEffectEnable true; 
				"filmGrain" ppEffectAdjust [0.02, 1, 1, 0.1, 1, false];
				"filmGrain" ppEffectCommit 5;
			};
		}
		else
		{
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
		};
		
		player spawn {
			enableCamShake true;
			addCamShake [10, 70, 25];
			sleep 70;
			enableCamShake false;
		};
		if(mdh_nuke_ash > 0) then {
			[] spawn {
				sleep 20;
				[] spawn {
					_pos = position player;
					_parray = [
						["A3\Data_F\ParticleEffects\Universal\Universal", 16, 12, 8, 1],
						"",
						"Billboard",
						1,
						4,
						[0,0,0],
						[0,0,0],
						1,
						0.000001,
						0,
						1.4,
						[0.05,0.05],
						[[0.1,0.1,0.1,1]],
						[0,1],
						0.2,
						1.2,
						"",
						"",
						vehicle player
					];
					mdh_ash = "#particlesource" createVehicle _pos;  
					mdh_ash setParticleParams _parray;
					mdh_ash setParticleRandom [0, [10, 10, 7], [0, 0, 0], 0, 0.01, [0, 0, 0, 0.1], 0, 0];
					mdh_ash setParticleCircle [0.0, [0, 0, 0]];
					mdh_ash setDropInterval 0.01;
				};
			};
		};
		if (mdh_nuke_destruction_zone > 0) then
		{
			{_x setdamage 1} forEach (nearestObjects [(nukepos), [], mdh_nuke_destruction_zone]);
		};


		_Wave setDropInterval 0.001;
		deletevehicle _top;
		deletevehicle _top2;

		sleep 4.5;

		_i = 0;
		while {_i < 100} do
		{
			_light setLightBrightness 100.0 - _i;
			_i = _i + 1;
			sleep 0.1;
		};
		deleteVehicle _light;

		sleep 2;

		_smoke setParticleParams [["A3\Data_F\ParticleEffects\Universal\universal.p3d", 16, 7, 48, 1], "", "Billboard", 1, 25, [0, 0, 0],
						[0, 0, 45], 0, 1.7, 1, 0, [40,25,80], 
						[[1, 1, 1, 0.2],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0]]
						, [0.5, 0.1], 1, 1, "", "", nukepos];

		_Cone setDropInterval 0.01;
		_smoke setDropInterval 0.006;
		_Wave setDropInterval 0.001;

		sleep 2;

		_smoke setParticleParams [["A3\Data_F\ParticleEffects\Universal\universal.p3d", 16, 7, 48, 1], "", "Billboard", 1, 25, [0, 0, 0],
						[0, 0, 30], 0, 1.7, 1, 0, [40,25,80], 
						[[1, 1, 1, 0.2],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0]]
						, [0.5, 0.1], 1, 1, "", "", nukepos];
		_smoke setDropInterval 0.012;
		_Cone setDropInterval 0.02;
		_Wave setDropInterval 0.01;

		sleep 15;
		deleteVehicle _Wave;
		deleteVehicle _Cone;
		deleteVehicle _smoke;
		[] spawn {
			if(mdh_nuke_removecorrection > 0) then {
				sleep 25;
				"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 1],  [1, 1, 1, 0.0]];
				"colorCorrections" ppEffectCommit 0;
				"filmGrain" ppEffectEnable false;
				"filmGrain" ppEffectCommit 0;
			};
		};
		if(mdh_nuke_removeash > 0) then {
			sleep 25;
			deletevehicle mdh_ash;
		};
	};	