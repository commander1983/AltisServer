/*
	File:
*/
private["_packet","_array","_flag"];
_packet = [getPlayerUID player,(profileName),playerSide,ja_dzep,ja_pare];
_array = [];
_flag = switch(playerSide) do {case west: {"cop"}; case civilian: {"civ"}; case independent: {"med"}; case east: {"adac"};};
{
	if(_x select 1 == _flag) then
	{
		_array pushBack [_x select 0,(missionNamespace getVariable (_x select 0))];
	};
} foreach life_licenses;

_packet pushBack _array;
switch (playerSide) do {
	case west: {
		[] call life_fnc_saveGear;
		_packet pushBack cop_gear;
	};
	case civilian: {
		[] call life_fnc_civFetchGear;
		_packet pushBack civ_gear;
		_packet pushBack life_is_arrested;
	};
	case independent: {
		[] call life_fnc_medicSaveGear;
		_packet pushBack med_gear;
	};
	case east:
	{
		[] call life_fnc_adacsaveGear;
		_packet pushBack adac_gear;
	};
};

[_packet,"DB_fnc_updateRequest",false,false] spawn life_fnc_MP;