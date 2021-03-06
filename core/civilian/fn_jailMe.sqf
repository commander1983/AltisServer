/*
	File: fn_jailMe.sqf
	Author Bryan "Tonic" Boardwine
	
	Description:
	Once word is received by the server the rest of the jail execution is completed.
*/
private["_ret","_bad","_time","_bail","_esc","_countDown","_time"];
_ret = [_this,0,[],[[]]] call BIS_fnc_param;
_bad = [_this,1,false,[false]] call BIS_fnc_param;
_time = [_this,2,15,[0]] call BIS_fnc_param; //##80

_time = time + (_time * 60); //x Minutes

//if(_bad) then { _time = time + 1100; } else { _time = time + (15 * 60); }; //##80 (time loaded from DB)

if(count _ret > 0) then { life_bail_amount = _time * 350; } else { life_bail_amount = _time * 350;};
_esc = false;
_bail = false;

if(_time <= 0) then { _time = time + (15 * 60); hintC "BITTE EINEM ADMIN MELDEN: JAIL_FALLBACK_15 Zeit ist zero bzw. NULL"; };

[_bad,_time] spawn
{
	life_canpay_bail = false;
	if(_this select 0) then
	{
		//sleep (10 * 60);
		//50% of time
		sleep ( (_this select 1) * 0.5 );
	}
		else
	{
		//sleep (5 * 60);
		//20% of time
		sleep ( (_this select 1) * 0.2 );
	};
	life_canpay_bail = nil;
};

while {true} do
{
	if((round(_time - time)) > 0) then
	{
		_countDown = if(round (_time - time) > 60) then {format["%1 Minute(n)",round(round(_time - time) / 60)]} else {format["%1 Sekunde(n)",round(_time - time)]};
		if(isNil "life_canpay_bail") then
		{
			hintSilent parseText format["<t align='center' size='1.3'>Verbleibende Haftzeit</t><t color='#FF0000' size='2.3' align='center'><br/>%1</t><br/><br/><br/><br/><t align='center' size='1.3'>Kautionspreis</t><br/><t color='#00CCFF' size='2.3' align='center'>%2€</t>",_countDown,[life_bail_amount] call life_fnc_numberText];
		}
		else
		{
			hintSilent parseText format["<t align='center' size='1.3'>Verbleibende Haftzeit</t><t color='#FF0000' size='2.3' align='center'><br/>%1</t>",_countDown];
		};
		
	};
	
	if(player distance (getMarkerPos "jail_marker") > 100) exitWith
	{
		_esc = true;
	};
	
	if(life_bail_paid) exitWith
	{
		_bail = true;
	};
	
	if((round(_time - time)) < 1) exitWith {hint ""};
	if(!alive player && ((round(_time - time)) > 0)) exitWith
	{
	
	};
	sleep 1;
};


switch (true) do
{
	case (_bail) :
	{
		life_is_arrested = false;
		life_bail_paid = false;
		hint parseText format ["<t align='center' size='1.5' color='#00cc00'>Kaution Bezahlt</t><br/>Da du deine Kaution bezahlt hast bist du nun wieder auf freiem Fuß. Die Gefängnisleitung hofft, dass du dich gebessert hast. Verhalte dich also anständig!"];
		serv_wanted_remove = [player];
		player setPos (getMarkerPos "jail_release");
		[[getPlayerUID player],"life_fnc_wantedRemove",false,false] spawn life_fnc_MP;
		removeUniform player;
		player removeItemFromBackpack "U_I_HeliPilotCoveralls";
		player addUniform "U_C_Poloshirt_blue";
		[5] call SOCK_fnc_updatePartial;
		sleep 2;
		[] call SOCK_fnc_updateRequest;
	};
	
	case (_esc) :
	{
		life_is_arrested = false;
		hint localize "STR_Jail_EscapeSelf";
		[[0,"STR_Jail_EscapeNOTF",true,[profileName]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
		[[getPlayerUID player,profileName,"901"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
		[5] call SOCK_fnc_updatePartial;
		sleep 2;
		[] call SOCK_fnc_updateRequest;
	};
	
	case (alive player && !_esc && !_bail) :
	{
		life_is_arrested = false;
		hint parseText format ["<t align='center' size='1.5' color='#00cc00'>Freigelassen</t><br/>Du hast deine Zeit abgesessen und bist nun wieder auf freiem Fuß. Die Gefängnisleitung hofft, dass du dich gebessert hast. Verhalte dich also anständig!"];
		[[getPlayerUID player],"life_fnc_wantedRemove",false,false] spawn life_fnc_MP;
		player setPos (getMarkerPos "jail_release");
		removeUniform player;
		player removeItemFromBackpack "U_I_HeliPilotCoveralls";
		player addUniform "U_C_Poloshirt_blue";
		[5] call SOCK_fnc_updatePartial;
		sleep 2;
		[] call SOCK_fnc_updateRequest;
	};
};