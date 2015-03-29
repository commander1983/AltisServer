private["_unit","_damage","_source","_projectile"];
_unit = _this select 0;
_damage = _this select 2;
_source = _this select 3;
_projectile = _this select 4;

if!(alive _unit) exitWith {_damage;};

//Handle the tazer first (Top-Priority).
if(!isNull _source) then {
	if(_source != _unit) then {
		_curWep = currentWeapon _source;
		if(_projectile == "B_9x21_Ball") then {
			if(side _source == west && playerSide != west) then {
				private["_distance","_isVehicle","_isQuad"];
				_distance = 110;
				_isVehicle = if(vehicle player != player) then {true} else {false};
				_isQuad = if(_isVehicle) then {if(typeOf (vehicle player) == "B_Quadbike_01_F") then {true} else {false}} else {false};
				
				_damage = getDammage player;
				if(_unit distance _source < _distance) then {
					if(!life_istazed && !(_unit getVariable["restrained",false])) then {
						if(_isVehicle && _isQuad) then {
							player action ["Eject",vehicle player];
							player action ["GetOut",vehicle player];
							[_unit,_source] spawn life_fnc_tazed;
						} else {
							[_unit,_source] spawn life_fnc_tazed;
						};
					};
				};
			};
			
			//Temp fix for super tasers on cops.
			if(playerSide == west && side _source == west) then {
				_damage = getDammage player;
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
			private["_distance","_isVehicle","_isQuad"];
				_distance = 75;
				_isVehicle = if(vehicle player != player) then {true} else {false};
				_isQuad = if(_isVehicle) then {if(typeOf (vehicle player) == "B_Quadbike_01_F") then {true} else {false}} else {false};
				
				_damage = getDammage player;
				if(_unit distance _source < _distance) then {
					if(!life_istazed && !(_unit getVariable["restrained",false])) then {
						if(_isVehicle && _isQuad) then {
							player action ["Eject",vehicle player];
							player action ["GetOut",vehicle player];
							[_unit,_source] spawn life_fnc_handleDowned;
						} else {
							[_unit,_source] spawn life_fnc_handleDowned;
						};
					};
				};	
			};
		};
	};

//anti vdm
if (vehicle _unit == _unit) then {

		if ( _source isKindOf "Air" OR _source isKindOf "Car" OR _source isKindOf "Ship" ) then {
			_damage = getDammage player;
			player setDammage 0.8;
			[[player,"amovppnemstpsraswrfldnon"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
		} else {	
			_isVehicle = vehicle _source;
		if (_isVehicle isKindOf "Air" OR _isVehicle isKindOf "Car" OR _isVehicle isKindOf "Ship") then  {
			_damage = getDammage player;
			player setDammage 0.8;
			[[player,"amovppnemstpsraswrfldnon"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
			[[2],"life_fnc_removeLicenses",_source,FALSE] spawn life_fnc_MP;
			/*if(side _source == civilian && (!life_antiVDM_noWanted)) then {
				[] spawn {
					life_antiVDM_noWanted = true;			// Timer - mal schauen ob's geht
					sleep (3 * 5);	// 15 Sekunden
					life_antiVDM_noWanted = false;
				};
				[[getPlayerUID _source,name _source,"666"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
			};	*/
		};
	};
};

[] call life_fnc_hudUpdate;
_damage;