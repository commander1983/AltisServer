enableSaving [false, false];

X_Server = false;
X_Client = false;
X_JIP = false;
StartProgress = false;

if(!isDedicated) then { X_Client = true;};

enableSaving[false,false];

life_versionInfo = "Altis Life RPG v3.1.4.8";

[] execVM "briefing.sqf"; //Load Briefing
onPlayerDisconnected { [_id, _name, _uid] call compile preProcessFileLineNumbers "core\functions\fn_onPlayerDisconnect.sqf" };
[] execVM "KRON_Strings.sqf";

if(isDedicated && isNil("life_market_prices")) then
{
	[] call life_fnc_marketconfiguration;
	diag_log "Market prices generated!";
	
	"life_market_prices" addPublicVariableEventHandler
	{
		diag_log format["Market prices updated! %1", _this select 1];
	};
};

StartProgress = true;


[] execVM "eigen\zlt_fastrope.sqf";
[] execVM "eigen\willkommen.sqf";
[] execVM "eigen\weather.sqf";
//[] execVM "eigen\fn_statusBar.sqf";

[] spawn
{
	sleep 60;
	[] call life_fnc_updateClothing;
};