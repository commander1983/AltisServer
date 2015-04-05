#include <macro.h>
/*
	File: fn_playerTags.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Adds the tags above other players heads when close and have visible range.
*/
private["_ui","_units"];
#define iconID 78000
#define scale 0.8
_headgear = ["H_Shemag_olive","H_ShemagOpen_tan","H_ShemagOpen_khk"];
//_goggles = ["G_Balaclava_blk","G_Balaclava_lowprofile","G_Balaclava_oli","G_Balaclava_combat"];

if(visibleMap OR {!alive player} OR {dialog}) exitWith {
	500 cutText["","PLAIN"];
};

_ui = uiNamespace getVariable ["Life_HUD_nameTags",displayNull];
if(isNull _ui) then {
	500 cutRsc["Life_HUD_nameTags","PLAIN"];
	_ui = uiNamespace getVariable ["Life_HUD_nameTags",displayNull];
};

_units = nearestObjects[(visiblePosition player),["Man","Land_Pallet_MilBoxes_F","Land_Sink_F"], 50];
_units = _units - [player];

{
	private["_name", "_text", "_icon", "_hasName"];
	_name = _x getVariable ["realname", name _x];
	_hasName = if(!isNil {(_x getVariable "realname")}) then {true} else {false};

	_idc = _ui displayCtrl (iconID + _forEachIndex);

	if(!(lineIntersects [eyePos player, eyePos _x, player, _x]) && {!isNil {_x getVariable "realname"}}) then {
		_pos = switch(typeOf _x) do {
			case "Land_Pallet_MilBoxes_F": {[visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 1.5]};
			case "Land_Sink_F": {[visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 2]};
			default {[visiblePosition _x select 0, visiblePosition _x select 1, ((_x modelToWorld (_x selectionPosition "head")) select 2)+.5]};
		};

		_sPos = worldToScreen _pos;
		_distance = _pos distance player;

		if(count _sPos > 1 && {_distance < 12}) then {
			_text = "";
			_icon = "";

			switch (true) do {
				//My Group
				case (_x in (units grpPlayer) && playerSide == civilian): {
					_text = format["<t color='#009CFF'>%1</t>", _name];
				};

				//Dead Players
				case (!alive _x): {
					_text = format["<t color='#000000'>Tot| %1</t>", _name];
				};
				
				//Maskiert
				case ((headgear _x) in _headgear): {
					_text = format["<t color='#000000'>Maskiert</t>"];
				};
			/*	case ((goggles _x) in _goggles): {
					_text = format["<t color='#000000'>Maskiert</t>"];
				};
			*/
				
				//Cops
				case(_x getVariable["coplevel", 0] > 0) : {
					switch (_x getVariable["coplevel", 0]) do {
						case (1) : {_icon = "a3\UI_F\data\GUI\Cfg\Ranks\private_gs.paa"; _text = format["<t color='#00C628'><img image='%2' size='1'></img>Anwaerter| %1</t>", _name, _icon];};
						case (2) : {_icon = "a3\UI_F\data\GUI\Cfg\Ranks\corporal_gs.paa"; _text = format["<t color='#00C628'><img image='%2' size='1'></img>Polizist| %1</t>", _name, _icon];};
						case (3) : {_icon = "a3\UI_F\data\GUI\Cfg\Ranks\sergeant_gs.paa"; _text = format["<t color='#00C628'><img image='%2' size='1'></img>Polizeimeister| %1</t>", _name, _icon];};
						case (4) : {_icon = "a3\UI_F\data\GUI\Cfg\Ranks\lieutenant_gs.paa"; _text = format["<t color='#00C628'><img image='%2' size='1'></img>Polizeihauptmeister| %1</t>", _name, _icon];};
						case (5) : {_icon = "a3\UI_F\data\GUI\Cfg\Ranks\captain_gs.paa"; _text = format["<t color='#00C628'><img image='%2' size='1'></img>Kommissar| %1</t>", _name, _icon];}; 
						case (6) : {_icon = "a3\UI_F\data\GUI\Cfg\Ranks\major_gs.paa"; _text = format["<t color='#00C628'><img image='%2' size='1'></img>Oberkommissar| %1</t>", _name, _icon];};
						case (7) : {_icon = "a3\UI_F\data\GUI\Cfg\Ranks\colonel_gs.paa"; _text = format["<t color='#00C628'><img image='%2' size='1'></img>Hauptkommissar| %1</t>", _name, _icon];};
						case (8) : {_icon = "a3\UI_F\data\GUI\Cfg\Ranks\general_gs.paa"; _text = format["<t color='#00C628'><img image='%2' size='1'></img>Polizeidirektor| %1</t>", _name, _icon];};
						default {};
					};
				};

				//Medics
				case(_x getVariable["medlevel", 0] > 0): {
					switch (_x getVariable["medlevel", 0]) do {
						case (1) : {_icon = "a3\UI_F\data\GUI\Cfg\Ranks\private_gs.paa"; _text = format["<t color='#C80C0D'><img image='%2' size='1'></img>Assistent| %1</t>", _name, _icon];};
						case (2) : {_icon = "a3\UI_F\data\GUI\Cfg\Ranks\corporal_gs.paa"; _text = format["<t color='#C80C0D'><img image='%2' size='1'></img>Mediziner| %1</t>", _name, _icon];};
						case (3) : {_icon = "a3\UI_F\data\GUI\Cfg\Ranks\sergeant_gs.paa"; _text = format["<t color='#C80C0D'><img image='%2' size='1'></img>Arzt| %1</t>", _name, _icon];};
						case (4) : {_icon = "a3\UI_F\data\GUI\Cfg\Ranks\lieutenant_gs.paa"; _text = format["<t color='#C80C0D'><img image='%2' size='1'></img>Oberarzt| %1</t>", _name, _icon];};
						case (5) : {_icon = "a3\UI_F\data\GUI\Cfg\Ranks\captain_gs.paa"; _text = format["<t color='#C80C0D'><img image='%2' size='1'></img>Chef-Arzt| %1</t>", _name, _icon];}; 
						default {};
					};
				};
			
				//Adac
				case(_x getVariable["adaclevel", 0] > 0): {
					switch (_x getVariable["adaclevel", 0]) do {
						case (1) : {_icon = "a3\UI_F\data\GUI\Cfg\Ranks\private_gs.paa"; _text = format["<t color='#BBAB0E'><img image='%2' size='1'></img>Azubi| %1</t>", _name, _icon];};
						case (2) : {_icon = "a3\UI_F\data\GUI\Cfg\Ranks\corporal_gs.paa"; _text = format["<t color='#BBAB0E'><img image='%2' size='1'></img>Facharbeiter| %1</t>", _name, _icon];};
						case (3) : {_icon = "a3\UI_F\data\GUI\Cfg\Ranks\sergeant_gs.paa"; _text = format["<t color='#BBAB0E'><img image='%2' size='1'></img>Technischer Aussendienst| %1</t>", _name, _icon];};
						case (4) : {_icon = "a3\UI_F\data\GUI\Cfg\Ranks\lieutenant_gs.paa"; _text = format["<t color='#BBAB0E'><img image='%2' size='1'></img>Werkstattmeister| %1</t>", _name, _icon];};
						case (5) : {_icon = "a3\UI_F\data\GUI\Cfg\Ranks\captain_gs.paa"; _text = format["<t color='#BBAB0E'><img image='%2' size='1'></img>Technischer Leiter| %1</t>", _name, _icon];}; 
						default {};
					};
				};

				//Others
				default {
					//Others with gang
					if(!isNil {(group _x) getVariable "gang_name"}) then {
						_groupname = (group _x) getVariable ["gang_name",""];
						_text = format["<t color='#B6B6B6'>%1</t><br/><t size='0.8' color='#B6B6B6'>%2</t>", _name, _groupname];
					//Normaly Civilians
					} else {
						_text = format["<t color='#FFFFFF'>%1</t>", _name];
					};
				};
			};

			_idc ctrlSetStructuredText parseText _text;
			_idc ctrlSetPosition [_sPos select 0, _sPos select 1, 0.4, 0.65];
			_idc ctrlSetScale scale;
			_idc ctrlSetFade 0;
			_idc ctrlCommit 0;
			_idc ctrlShow true;
		} else {
			_idc ctrlShow false;
		};
	} else {
		_idc ctrlShow false;
	};
} foreach _units;