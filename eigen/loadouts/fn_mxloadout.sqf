#include <macro.h>
private ["_loadoutName","_action","_guncost"];

if(__GETC__(life_donator) == 0) exitwith {hint "Nur fuer Donator";};
if(__GETC__(life_coplevel) < 3) exitwith {hint "Nur fuer Polizeimeister oder hoeher";};

if(playerSide != west) exitWith {hint "Nur für Polizisten";};
if (vehicle player != player) exitWith { hint "Raus aus dem Fahrzeug" };
if(!alive player) exitWith {hint"Du bist tot, tote können nix kaufen!";};
_guncost = 25000;
if(ja_dzep < _guncost) exitWith {hint format[localize "STR_NOTF_LO_NoCash",_guncost];};
_loadoutName = "MX Vollausstattung";
_action = [
			format["Dir wird dein komplettes Gear entzogen was du derzeit dabei hast! :%1: Es wird dich %2€ kosten",_loadoutName,[_guncost] call life_fnc_numberText],
			"Purchase Loadout",
			"Purchase",
			"No"
		] call BIS_fnc_guiMessage;
if(_action) then {
			
hint parseText format["Du kaufst die %1 fuer <t color='#8cff9b'>%2€</t>",_loadoutName,[_guncost] call life_fnc_numberText];
ja_dzep = ja_dzep - _guncost;

titleText[format["Das macht %1 bitte...",[_guncost] call life_fnc_numberText],"PLAIN"];

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
titleText[format["Jetzt bekommen Sie Ihre %1 ...",_loadoutName],"PLAIN"];
sleep 3;


player addUniform "U_Rangemaster";
player addHeadgear "H_Beret_blk_POLICE";
player addgoggles "G_Aviator";
player addVest "V_TacVest_blk_POLICE";

player addWeapon "hgun_P07_snds_F";
player addWeapon "arifle_MX_Black_F";
player selectWeapon "hgun_P07_snds_F";
player addMagazine "30Rnd_9x21_Mag";
player addMagazine "30Rnd_9x21_Mag";
player addMagazine "30Rnd_9x21_Mag";
player addMagazine "30Rnd_9x21_Mag";
player addMagazine "30Rnd_65x39_caseless_mag";
player addMagazine "30Rnd_65x39_caseless_mag";
player addMagazine "30Rnd_65x39_caseless_mag";
player addMagazine "30Rnd_65x39_caseless_mag";
player addMagazine "30Rnd_65x39_caseless_mag";
player addMagazine "30Rnd_65x39_caseless_mag";
player addMagazine "30Rnd_65x39_caseless_mag";
player addMagazine "30Rnd_65x39_caseless_mag";
player addMagazine "30Rnd_65x39_caseless_mag";

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
player addItem "Rangefinder";
player assignItem "Rangefinder";
player addItemToBackpack "muzzle_snds_H";
player addItemToBackpack "optic_Hamr";


mybackpack = unitBackpack player;
mybackpack addItemCargoGlobal ["Toolkit", 2];
mybackpack addItemCargoGlobal ["FirstAidKit", 4];
//you can also y-inv items too like this
life_inv_coffee = life_inv_coffee + 4;
life_inv_donuts = life_inv_donuts + 2;
life_inv_spikeStrip = life_inv_spikeStrip + 1;
life_inv_handcuffs = life_inv_handcuffs + 4;
life_inv_battery = life_inv_battery + 1;
life_inv_keys = life_inv_keys + 1;
life_inv_sperre = life_inv_sperre + 2;
life_inv_warnung = life_inv_warnung +2;
life_inv_redgull = life_inv_redgull + 6;

reload player;
titleText [format["Hier, ihre %1",_loadoutName],"PLAIN"];
} else {
			hint"Dann ein anderes mal...";
};

[] spawn life_fnc_updateClothing;
[] call life_fnc_saveGear;