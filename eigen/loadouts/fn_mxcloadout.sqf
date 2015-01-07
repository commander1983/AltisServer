#include <macro.h>
private ["_loadoutName","_action","_guncost"];

if(__GETC__(life_donator) == 0) exitwith {hint "Nur für Donator!";};
if(__GETC__(life_coplevel) < 3) exitwith {hint "Nur für Polizeihauptmeister oder höher!";};

if(playerSide != west) exitWith {hint "Du bist kein Polizist!";};
if (vehicle player != player) exitWith { hint "Du kannst nicht im KFZ Sachen kaufen!" };
if(!alive player) exitWith {hint"Du bist tot. Tote können nichts kaufen!";};
_guncost = 13000;
if(ja_dzep < _guncost) exitWith {hint format[localize "STR_NOTF_LO_NoCash",_guncost];};
_loadoutName = "MXC Vollausstattung";
_action = [
			format["Dein komplettes Inventar wird durch den Kauf entfernt! Die %1 wird dich %2€ kosten.",_loadoutName,[_guncost] call life_fnc_numberText],
			"Purchase Loadout",
			"Purchase",
			"No"
		] call BIS_fnc_guiMessage;
if(_action) then {
			
hint parseText format["Du kaufst die %1 fuer <t color='#8cff9b'>%2€</t>",_loadoutName,[_guncost] call life_fnc_numberText];
ja_dzep = ja_dzep - _guncost;

titleText[format["Das macht %1 bitte",[_guncost] call life_fnc_numberText],"PLAIN"];

sleep 1;
RemoveAllWeapons player;
{player removeMagazine _x;} foreach (magazines player);
removeUniform player;
removeVest player;
removeBackpack player;
removeGoggles player;
removeHeadGear player;
{
	player unassignItem _x;
	player removeItem _x;
} foreach (assignedItems player);
titleText[format["Jetzt bekommen Sie Ihre %1",_loadoutName],"PLAIN"];
sleep 3;


player addUniform "U_Rangemaster";
player addHeadgear "H_Beret_blk_POLICE";
player addgoggles "G_Aviator";
player addVest "V_TacVest_blk_POLICE";

sleep 2;

player addWeapon "hgun_P07_snds_F";
player addWeapon "arifle_MX_Black_F";
player selectWeapon "hgun_P07_snds_F";
player addMagazine "30Rnd_9x21_Mag";
player addMagazine "30Rnd_9x21_Mag";
player addItemToVest "30Rnd_65x39_caseless_mag";
player addItemToVest "30Rnd_65x39_caseless_mag";
player addItemToVest "30Rnd_65x39_caseless_mag";
player addItemToVest "30Rnd_65x39_caseless_mag";
player addItemToVest "30Rnd_65x39_caseless_mag";
player addItemToVest "30Rnd_65x39_caseless_mag";
player addItemToVest "30Rnd_65x39_caseless_mag";
player addItemToVest "30Rnd_65x39_caseless_mag";
player addItemToVest "30Rnd_65x39_caseless_mag";
player addItemToVest "30Rnd_65x39_caseless_mag";

sleep 2;

titleText ["...Rucksack nicht vergessen...","PLAIN"];
player addBackPack "B_Carryall_cbr";
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemRadio";
player assignItem "ItemRadio";
player addItem "ItemGPS";
player assignItem "ItemGPS";
player addItem "NVGoggles";
player assignItem "NVGoggles";
// Munition in Rucksack
player addItemToBackpack "30Rnd_65x39_caseless_mag";
player addItemToBackpack "30Rnd_9x21_Mag";
player addItemToBackpack "Rangefinder";
// Attachment to Weapon 
player addPrimaryWeaponItem "muzzle_snds_H";
player addPrimaryWeaponItem "optic_Hamr";


mybackpack = unitBackpack player;
mybackpack addItemCargoGlobal ["Toolkit", 1];
mybackpack addItemCargoGlobal ["FirstAidKit", 4];
/*
life_inv_coffee = life_inv_coffee + 2;
life_inv_donuts = life_inv_donuts + 10;
life_inv_spikeStrip = life_inv_spikeStrip + 1;
life_inv_handcuffs = life_inv_handcuffs + 6;
life_inv_battery = life_inv_battery + 1;
life_inv_keys = life_inv_keys + 1;
life_inv_redgull = life_inv_redgull + 10;
*/

reload player;
titleText [format["Sie sind vollständig nach der %1 ausgestattet.",_loadoutName],"PLAIN"];
} else {
			hint"Dann ein anderes Mal.";
};

[] spawn life_fnc_updateClothing;
[] call life_fnc_saveGear;