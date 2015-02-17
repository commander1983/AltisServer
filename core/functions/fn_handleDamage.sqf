private["_unit","_damage","_source","_projectile"];
_unit = _this select 0;
_damage = _this select 2;
_source = _this select 3;
_projectile = _this select 4;

if(isNil _unit) exitWith {};
if!(alive _unit) exitWith {};

//Handle the tazer first (Top-Priority).

if(!isNull _source) then {
	if(_source != _unit) then {
		if(_projectile == "B_9x21_Ball") then {
			if(side _source == west) then {
				if (playerSide == west) then {
					_damage = 0.5;
				} else {
					_damage = 0;
					if(_unit distance _source < 110) then {
						if(!life_istazed) then {
							[_unit,_source] spawn life_fnc_tazed;
						};
					};
				};
			};
		};
	};
};

//rubber bullets
if(!isNull _source) then {
	if(_source != _unit) then {
		_curMag = currentMagazine _source;
		_curWeapon = currentWeapon _source;
		if (_curMag in ["30Rnd_556x45_Stanag_Tracer_Red"] && _curWeapon in ["arifle_SDAR_F"] && _projectile in ["B_556x45_Ball_Tracer_Red"]) then {	
			if(_unit distance _source < 75) then {
				_damage false;
				[_unit,_source] spawn life_fnc_handleDowned;
			} else {
				_damage = 0.5;
			};
		};
	};
};

[] call life_fnc_hudUpdate;
_damage;