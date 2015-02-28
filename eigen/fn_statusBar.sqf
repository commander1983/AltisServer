waitUntil {!(isNull (findDisplay 46))};
disableSerialization;

_rscLayer = "osefStatusBar" call BIS_fnc_rscLayer;
_rscLayer cutRsc["osefStatusBar","PLAIN"];
systemChat format["Willkommen auf dem Server", _rscLayer];

[] spawn {
	sleep 5;
	_counter = 360;
	_timeSinceLastUpdate = 0;
	while {true} do
	{
		sleep 5;
		_counter = _counter - 1;
		((uiNamespace getVariable "osefStatusBar")displayCtrl 1000)ctrlSetText format[
														"Teamspeak: ts.staiylite.de | Polizei: %1 | Pannenhilfe: %4 | Sanitäter: %3 | Zivilisten: %2 | Position: %5"
			,  west countSide playableUnits, civilian countSide playableUnits, independent countSide playableUnits, east countSide playableUnits, mapGridPosition player, _counter
																					];
	}; 
};