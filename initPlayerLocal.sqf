/*
	File: initPlayerLocal.sqf
	
	Description:
	Starts the initialization of the player.
*/
"BIS_fnc_MP_packet" addPublicVariableEventHandler {_this call life_fnc_MPexec};
if(!hasInterface) exitWith {}; //This is a headless client, he doesn't need to do anything but keep being headless..
#define __CONST__(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)})
__CONST__(BIS_fnc_endMission,BIS_fnc_endMission);
[] execVM "core\init.sqf";

//Execute JIP code.
if((_this select 1)) then {
	[] execVM "core\jip.sqf";
};

enableRadio false; 
enableSentences false;

pb_positionen = [[13604.8,12210.9,0.00157547],[13580.8,12196.4,3.2701],[13653.8,12116.8,0.00129938],[13652.7,12310.1,0.00283813],[13620.5,12313.6,0.00133324],[13636.7,12086.2,0.00116634],[13552.7,11985.6,0.00161707],[13501.2,11929.2,0.00183177],[13412.3,11789.1,0.00102019],[13334.6,11714.8,-0.000901699],[13185.4,11691.9,0.000966549],[13274.5,11838.1,0.00133038],[13335.2,11923.4,0.000934601],[13427.8,12045.4,0.00226641],[13431.3,12051.9,-0.00135517],[13451.3,12081.2,0.00277138],[13462,12123.1,0.00107551],];
joinmode = 0;