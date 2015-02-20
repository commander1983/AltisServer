#include <macro.h>
/*
	File: fn_setupActions.sqf
	
	Description:
	Master addAction file handler for all client-based actions.
*/
switch (playerSide) do
{
    case west:
    {
		// nano EMP Little Bird
		//life_actions = life_actions + [player addAction["<t color='#FF0000'>EMP Operator Konsole öffnen</t>",life_fnc_openEmpMenu,[],8,false,false,"",'[_this] call life_fnc_isEmpOperator']];
		//Drugtest
		life_actions = [player addAction["Drogen und Alkoholtest",life_fnc_drugtestAction,cursorTarget,0,false,true,"",' !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && animationState cursorTarget == "AmovPercMstpSnonWnonDnon_Ease" && (cursorTarget getVariable ["restrained",false]) && (side cursorTarget == civilian) && player distance cursorTarget < 2.5 && !(cursorTarget getVariable "Escorting") ']];
		
		//Seize Objects
        life_actions = life_actions + [player addAction["Objekte vom Boden entfernen",life_fnc_seizeObjects,cursorTarget,0,false,false,"",'count(nearestObjects [player,["weaponholder"],3])>0']];
		
		life_actions = life_actions + [player addAction["<t color='#FF0000'>Pylone aufheben</t>",life_fnc_packupwarnung,"",0,false,false,"",' _warnung = nearestObjects[getPos player,["RoadCone_F"],1] select 0; !isNil "_warnung" && !isNil {(_warnung getVariable "item")}']];
		
		life_actions = life_actions + [player addAction["<t color='#FF0000'>Straßensperre entfernen</t>",life_fnc_packupsperre,"",0,false,false,"",' _sperre = nearestObjects[getPos player,["RoadBarrier_F"],2] select 0; !isNil "_sperre" && !isNil {(_sperre getVariable "item")}']];
	
		life_actions = life_actions + [player addAction["<t color='#FFFFFF'>Polizeimarke zeigen</t>",life_fnc_copShowLicense,"",1,false,true,"",' playerSide == west && !isNull cursorTarget && player distance cursorTarget < 3.5 && cursorTarget isKindOf "Man" ']];
	};
	
    case civilian:
    {
		//Drop fishing net
		life_actions = [player addAction["Werfe Fischernetz",life_fnc_dropFishingNet,"",0,false,false,"",'
		(surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "Ship") && life_carryWeight < life_maxWeight && speed (vehicle player) < 2 && speed (vehicle player) > -1 && !life_net_dropped ']];
		//Rob person
		life_actions = life_actions + [player addAction["Person ausrauben",life_fnc_robAction,"",0,false,false,"",'
		!isNull cursorTarget && player distance cursorTarget < 3.5 && isPlayer cursorTarget && animationState cursorTarget == "Incapacitated" || animationState cursorTarget == "amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon"  && !(cursorTarget getVariable["robbed",FALSE]) ']];
	
		life_actions = life_actions + [player addAction["<t color='#FFFFFF'>Ausweis zeigen</t>",life_fnc_copShowLicense,"",1,false,true,"",' playerSide == civilian &&  !isNull cursorTarget && player distance cursorTarget < 3.5 && cursorTarget isKindOf "Man" ']];
	};
	
	case east:
	{
		life_actions = life_actions + [player addAction["<t color='#FF0000'>Pylone aufheben</t>",life_fnc_packupwarnung,"",0,false,false,"",' _warnung = nearestObjects[getPos player,["RoadCone_F"],1] select 0; !isNil "_warnung" && !isNil {(_warnung getVariable "item")}']];
		
		life_actions = life_actions + [player addAction["<t color='#FF0000'>Straßensperre entfernen</t>",life_fnc_packupsperre,"",0,false,false,"",' _sperre = nearestObjects[getPos player,["RoadBarrier_F"],2] select 0; !isNil "_sperre" && !isNil {(_sperre getVariable "item")}']];
	
		life_actions = life_actions + [player addAction["<t color='#FFFFFF'>Dienstmarke zeigen</t>",life_fnc_copShowLicense,"",1,false,true,"",' playerSide == east &&  !isNull cursorTarget && player distance cursorTarget < 3.5 && cursorTarget isKindOf "Man" ']];
	};
	
	case independent:
	{
		life_actions = life_actions + [player addAction["<t color='#FF0000'>Pylone aufheben</t>",life_fnc_packupwarnung,"",0,false,false,"",' _warnung = nearestObjects[getPos player,["RoadCone_F"],1] select 0; !isNil "_warnung" && !isNil {(_warnung getVariable "item")}']];
		
		life_actions = life_actions + [player addAction["<t color='#FF0000'>Straßensperre entfernen</t>",life_fnc_packupsperre,"",0,false,false,"",' _sperre = nearestObjects[getPos player,["RoadBarrier_F"],2] select 0; !isNil "_sperre" && !isNil {(_sperre getVariable "item")}']];
		
		life_actions = life_actions + [player addAction["<t color='#FFFFFF'>Dienstmarke zeigen</t>",life_fnc_copShowLicense,"",1,false,true,"",' playerSide == independent &&  !isNull cursorTarget && player distance cursorTarget < 3.5 && cursorTarget isKindOf "Man" ']];
	};
};