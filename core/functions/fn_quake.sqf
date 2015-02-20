_isCalledByPlayer = [_this,0,0,[0]] call BIS_fnc_param;
/*
if (_isCalledByPlayer!=1) then {
	sleep 120;
};
*/
playMusic "Track11_StageB_stealth";

					sleep 5;
					hintSilent parseText "<t size=""1.1"">EARTHQUAKE THREAT LEVEL</t><br/><t color=""#40FF00"" t size=""2"">LOW</t>";
					sleep 5;
					mood = ppEffectCreate["colorCorrections", 1501];
					mood ppEffectEnable true;
					mood ppEffectAdjust[1, 1, 0, [0, 0, 0, -0.31], [1.9, 1.9, 1.73, 0.7], [0.2, 1.1, -1.5, 1.64]];
					mood ppEffectCommit 2;

					mood = ppEffectCreate["colorCorrections", 1501];
					mood ppEffectEnable true;
					mood ppEffectAdjust[1, 1, 0, [0.0, 0.0, 0.0, 0.0], [0.8 * 2, 0.5 * 2, 0.0, 0.7], [0.9, 0.9, 0.9, 0.0]];
					mood ppEffectCommit 2;
					
					mood = ppEffectCreate["colorCorrections", 1501];
					mood ppEffectEnable true;
					mood ppEffectAdjust[1, 0.21, 0, [0.1, 0, 0, 0], [3.59, 3.49, 3.78, 0.83], [-0.31, 0.08, 3.79, 5]];
					mood ppEffectCommit 2;
					sleep 11;
					playSound "Alarm";
					hintSilent parseText "<t size=""1.1"">EARTHQUAKE THREAT LEVEL</t><br/><t color =""#FFFF00"" t size = ""2"">MODERATE</t>";
					sleep 10;
					playSound "Earthquake_01";
					enablecamshake true;
					addCamShake [7, 11, 10];
					sleep 11;
					playSound "Alarm";
					hintSilent parseText "<t size=""1.1"">EARTHQUAKE THREAT LEVEL</t><br/><t color = ""#FF8000"" t size = ""2"">CRITICAL</t>";
					sleep 10;
					playSound "Earthquake_04";
					enableCamShake true;
					sleep 1;
					addCamShake[10, 12, 15];
					sleep 10;
					playSound "Alarm";
					hintSilent parseText "<t size=""1.1"">EARTHQUAKE THREAT LEVEL</t><br/><t color = ""#FF0000"" t size = ""2"">SEVERE</t>";
					sleep 10;
					playSound "Alarm";
					sleep 1;
					playSound "Alarm";
					sleep 1;
					playSound "Earthquake_04";
					playSound "Alarm";
					sleep 1;
					playSound "Alarm";
					sleep 1;
					playSound "Alarm";
					sleep 5;
					playSound "Earthquake_04";
					addCamShake [10, 20, 20];
					sleep 6;
					playSound "Earthquake_04";
					sleep 30;
					playMusic "";
					enableCamShake false;
					sleep 10;