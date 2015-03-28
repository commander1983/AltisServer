private["_veh","_veh_type","_fuelstation","_fuel_old","_fuel_new","_fuel_price","_steps","_spent_money","_fuel_min_distance"];
_fuel_price = 1500;
_steps = 100.0;
_fuel_min_distance = 7;
_fuel_price_one_step = _fuel_price / _steps;

while {true} do
{
	waitUntil {sleep 1; ((vehicle player != player) && ((driver (vehicle player)) == player) && (!isEngineOn (vehicle player)) && (fuel (vehicle player)) < 0.99 && (speed (vehicle player)) < 0.1 && count (nearestObjects [player, ["Land_fs_feed_F"], _fuel_min_distance]) > 0)};
	_veh = vehicle player;
	_veh_type = typeof _veh;
	
	_fuelstation = (nearestObjects [player, ["Land_fs_feed_F"], _fuel_min_distance]) select 0;
	
	sleep 1;
	_spent_money = 0;
	
	while {true} do
	{
		if(vehicle player == player) exitWith {};
		if((driver (vehicle player)) != player) exitWith {};
		if((fuel (vehicle player)) >= 0.99) exitWith {};
		if((speed (vehicle player)) > 0.1) exitWith {};
		if(!(alive (vehicle player))) exitWith {};
		if(isEngineOn (vehicle player)) exitWith {hint "Du musst den Motor ausschalten, bevor du beginnst zu tanken!";};
		if((player distance _fuelstation) > _fuel_min_distance) exitWith {};
		if(ja_pare < _fuel_price_one_step) exitWith {hint "Du brauchst mehr Geld um weiter zu Tanken. Voller Tank kostet 1500!"; sleep 1;};

		_fuel_old = fuel _veh;
		_fuel_new = _fuel_old + (1 / _steps);
		_veh setFuel _fuel_new;
		
		ja_pare = ja_pare - _fuel_price_one_step;
		_spent_money = _spent_money + _fuel_price_one_step;
		
		sleep 0.5;
	};

	[1,false] call SOCK_fnc_updateRequest;
};