/*

	Show cop license to target player

*/

private["_target", "_message","_rank","_coplevel","_mediclevel","_adaclevel"];

_target = cursorTarget;

if( isNull _target) then {_target = player;};

if( !(_target isKindOf "Man") ) then {_target = player;};

if( !(alive _target) ) then {_target = player;};

if(playerSide == west) then
{
	_coplevel = call life_coplevel;
	
	switch ( _coplevel ) do
	{
		case 1: { _rank = "Anwaerter"; };
		case 2: { _rank = "Polizist"; };	
		case 3: { _rank = "Polizeimeister"; };	
		case 4: { _rank = "Polizeihauptmeister"; };
		case 5: { _rank = "Kommissar"; };
		case 6: { _rank = "Oberkommissar"; };
		case 7: { _rank = "Hauptkommissar"; };
		case 8: { _rank = "Polizeidirektor"; };
	};
	
	_message = format["<color='#FFFFFF'/><t size='2'>%1</t><br/><t size='1.5'>%2</t><br/><t size='2.5'>Polizei</t>", name player, _rank];
	
	[[player, _message],"life_fnc_copLicenseShown",_target,false] spawn life_fnc_MP;
};

if(playerSide == independent) then
{
	_mediclevel = call life_mediclevel;
	
	switch ( _mediclevel ) do
	{
		case 1: { _rank = "Assistent"; };
		case 2: { _rank = "Mediziner"; };	
		case 3: { _rank = "Arzt"; };	
		case 4: { _rank = "Oberarzt"; };
		case 5: { _rank = "Chef-Arzt"; };
	};
	_message = format["<color='#FFFFFF'/><t size='2'>%1</t><br/><t size='1.5'>%2</t><br/><t size='2.5'>Sanitaeter</t>", name player, _rank];
	
	[[player, _message],"life_fnc_copLicenseShown",_target,false] spawn life_fnc_MP;
};

if(playerSide == east) then
{
	_adaclevel = call life_adaclevel;
	
	switch ( _adaclevel ) do
	{
		case 1: { _rank = "Azubi"; };
		case 2: { _rank = "Facharbeiter"; };	
		case 3: { _rank = "Technischer Aussendienst"; };	
		case 4: { _rank = "Werkstattmeister"; };
		case 5: { _rank = "Technischer Leiter"; };
	};
	_message = format["<color='#FFFFFF'/><t size='2'>%1</t><br/><t size='1.5'>%2</t><br/><t size='2.5'>Pannenhelfer</t>", name player, _rank];
	
	[[player, _message],"life_fnc_copLicenseShown",_target,false] spawn life_fnc_MP;
};

if(playerSide == civilian) then
{
	_message = format["<color='#FFFFFF'/><t size='2'>%1</t>", name player];
	
	[[player, _message],"life_fnc_copLicenseShown",_target,false] spawn life_fnc_MP;
};

