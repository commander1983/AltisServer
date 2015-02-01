#include <macro.h>
/*
	File: fn_weaponShopCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for the weapon shops.
	
	Return:
	String: Close the menu
	Array: 
	[Shop Name,
	[ //Array of items to add to the store
		[classname,Custom Name (set nil for default),price]
	]]
*/
private["_shop"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {closeDialog 0}; //Bad shop type passed.

switch(_shop) do
{
	case "med_basic":
	{
		switch (true) do 
		{
			case (playerSide != independent): {"Du bist kein Sanitaeter"};
			default {
				["Sani Shop",
					[
						["ItemGPS",nil,100],
						["Binocular",nil,150],
						["ToolKit",nil,500],
						["FirstAidKit",nil,250],
						["Medikit",nil,10000],
						["NVGoggles",nil,1200],
						["Rangefinder",nil,1200],
						["ItemRadio","Handy",500]
					]
				];
			};
		};
	};
	
	case "adac_basic":
	{
		switch (true) do 
		{
			case (playerSide != east): {"Du bist kein Pannendienst"};
			default {
				["ADAC Shop",
					[
						["ItemGPS",nil,100],
						["Binocular",nil,150],
						["ToolKit",nil,10000],
						["FirstAidKit",nil,500],
						["NVGoggles",nil,1200],
						["Rangefinder",nil,1200],
						["ItemRadio","Handy",500]
					]
				];
			};
		};
	};
	
	case "rebel":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Du bist kein Zivilist!"};
			case (!license_civ_rebel): {"Du hast kein Rebellentraining!"};
			default
			{
				["Mohammed's Jihadi Shop",
					[
						["arifle_SDAR_F",nil,20000],
						["arifle_TRG20_F",nil,25000],
						["arifle_Mk20_F",nil,25000],
						["30Rnd_556x45_Stanag",nil,300],
						["arifle_Katiba_F",nil,80000],
						["30Rnd_65x39_caseless_green",nil,275],
						["LMG_Mk200_F",nil,200000],
						["200Rnd_65x39_cased_Box",nil,5000],
						["srifle_DMR_01_F",nil,150000],
						["10Rnd_762x51_Mag",nil,1000],
						["30Rnd_556x45_Stanag_Tracer_Red","Gummipatronen",500],
						["optic_Aco",nil,3500],
						["optic_ACO_grn",nil,3500],
						["optic_ACO_grn_smg",nil,3500],
						["optic_Holosight_smg",nil,5000],
						["optic_Holosight",nil,5000],
						["optic_Arco",nil,7500],
						["optic_MRCO",nil,7500],
						["optic_Hamr",nil,7500],
						["optic_SOS",nil,10000],
						["optic_DMS",nil,10000],
						["acc_flashlight",nil,1000],
						["ItemGPS",nil,100],
						["ToolKit",nil,2500],
						["FirstAidKit",nil,1000],
						["NVGoggles",nil,10000],
						["Rangefinder",nil,10000],
						["ItemRadio","Handy",500]
					]
				];
			};
		};
	};
	
	case "gang":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Du bist kein Zivilist!"};
			case (license_civ_rebel):
			{
				["Mohammed's Jihadi Shop",
					[
						["arifle_SDAR_F",nil,20000],
						["arifle_TRG20_F",nil,25000],
						["arifle_Mk20_F",nil,25000],
						["30Rnd_556x45_Stanag",nil,300],
						["arifle_Katiba_F",nil,80000],
						["30Rnd_65x39_caseless_green",nil,275],
						["LMG_Mk200_F",nil,200000],
						["200Rnd_65x39_cased_Box",nil,5000],
						["srifle_DMR_01_F",nil,150000],
						["10Rnd_762x51_Mag",nil,1000],
						["30Rnd_556x45_Stanag_Tracer_Red","Gummipatronen",500],
						["optic_Aco",nil,3500],
						["optic_ACO_grn",nil,3500],
						["optic_ACO_grn_smg",nil,3500],
						["optic_Holosight_smg",nil,5000],
						["optic_Holosight",nil,5000],
						["optic_Arco",nil,7500],
						["optic_MRCO",nil,7500],
						["optic_Hamr",nil,7500],
						["optic_SOS",nil,10000],
						["optic_DMS",nil,10000],
						["acc_flashlight",nil,1000],
						["ItemGPS",nil,100],
						["ToolKit",nil,2500],
						["FirstAidKit",nil,1000],
						["NVGoggles",nil,10000],
						["Rangefinder",nil,10000],
						["ItemRadio","Handy",500]
					]
				];
			};
			
			case (!license_civ_rebel):
			{
				["Hideout Armament",
					[
						["arifle_SDAR_F",nil,20000],
						["20Rnd_556x45_UW_mag","Unterwasser",125],
						["30Rnd_556x45_Stanag",nil,300],
						["hgun_PDW2000_F",nil,20000],
						["hgun_Rook40_F",nil,7500],
						["16Rnd_9x21_Mag",nil,75],
						["30Rnd_9x21_Mag",nil,125],
						["hgun_ACPC2_F",nil,10000],
						["9Rnd_45ACP_Mag",nil,75],
						["optic_Aco_smg",nil,2500],
						["optic_ACO_grn_smg",nil,2500],
						["V_Rangemaster_belt",nil,2500]
					]
				];
			};
		};
	};
	
	case "gun":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Du bist kein Polizist!"};
			case (!license_civ_gun): {"Du hast keinen Waffenschein!"};
			default
			{
				["Billy Joe's Firearms",
					[
						["arifle_SDAR_F",nil,20000],
						["20Rnd_556x45_UW_mag","Unterwasser",125],
						["30Rnd_556x45_Stanag",nil,300],
						["hgun_PDW2000_F",nil,20000],
						["hgun_Rook40_F",nil,7500],
						["16Rnd_9x21_Mag",nil,75],
						["30Rnd_9x21_Mag",nil,125],
						["hgun_ACPC2_F",nil,10000],
						["9Rnd_45ACP_Mag",nil,75],
						["optic_Aco_smg",nil,2500],
						["optic_ACO_grn_smg",nil,2500],
						["V_Rangemaster_belt",nil,2500]
					]
				];
			};
		};
	};
	
	case "genstore":
	{
		["Werkzeugladen",
			[
				["Binocular",nil,150],
				["ItemGPS",nil,250],
				["ToolKit",nil,2500],
				["FirstAidKit",nil,1000],
				["NVGoggles",nil,10000],
				["Rangefinder",nil,10000],
				["ItemRadio","Handy",500]
			]
		];
	};
	
	case "gasstore":
	{
		["Tankstellenladen",
			[
				["ToolKit",nil,3500],
				["FirstAidKit",nil,1500],
				["ItemRadio","Handy",1000]
			]
		];
	};
	
	case "donator":
	{
		switch(true) do
		{
			case (__GETC__(life_donator) == 0): {"Du bist kein Donator!"};
			
			case (__GETC__(life_donator) == 1):
			{
				["Donator Shop",
				[
					["SMG_01_F",nil,25000],
					["30Rnd_45ACP_Mag_SMG_01_tracer_green",nil,500],
					["hgun_Pistol_heavy_02_Yorris_F",nil,12500],
					["6Rnd_45ACP_Cylinder",nil,100],
					["NVGoggles_OPFOR","NV Schwarz",8000],
					["NVGoggles_INDEP","NV Gruen",8000],
					["Rangefinder",nil,8000],
					["U_B_Protagonist_VR","Bootcamp",1500],
					["G_Balaclava_blk",nil,25],
					["G_Balaclava_lowprofile",nil,20],
					["G_Balaclava_oli",nil,20],
					["G_Balaclava_combat",nil,20],
					["G_Bandanna_aviator",nil,20],
					["G_Bandanna_beast",nil,20],
					["G_Bandanna_tan",nil,10],
					["G_Bandanna_sport",nil,100],
					["G_Bandanna_blk",nil,30],
					["ItemGPS",nil,100],
					["G_Bandanna_oli",nil,55],
					["G_Bandanna_shades",nil,55],
					["optic_Aco",nil,3500],
					["optic_ACO_grn",nil,3500],
					["optic_ACO_grn_smg",nil,3500],
					["optic_Holosight_smg",nil,5000],
					["optic_Holosight",nil,5000],
					["optic_Arco",nil,7500],
					["optic_MRCO",nil,7500],
					["optic_Hamr",nil,7500],
					["optic_SOS",nil,10000],
					["optic_DMS",nil,10000],
					["ToolKit",nil,2000],
					["FirstAidKit",nil,800]
				]
				];
			};
		};
	};
	
	case "copdonator":
	{
		switch(true) do
		{
			case (playerSide != west): {"Du bist kein Polizist"};
			case (__GETC__(life_donator) == 0): {"Du bist kein Donator!"};
			case (__GETC__(life_coplevel) == 1):
			{
				["Cop Donator Shop",
					[
						["H_Watchcap_blk","Beanie",50],
						["NVGoggles_OPFOR","NV Schwarz",800],
						["NVGoggles_INDEP","NV Gruen",800],
						["Rangefinder",nil,800],
						["ItemGPS",nil,100],
						["ToolKit",nil,500],
						["FirstAidKit",nil,250]
					]
				];
			};
			
			case (__GETC__(life_coplevel) == 2):
			{
				["Cop Donator Shop",
					[
						["H_Watchcap_blk","Beanie",50],
						["NVGoggles_OPFOR","NV Schwarz",800],
						["NVGoggles_INDEP","NV Gruen",800],
						["Rangefinder",nil,800],
						["ItemGPS",nil,100],
						["ToolKit",nil,500],
						["FirstAidKit",nil,250]
					]
				];
			};
			
			case (__GETC__(life_coplevel) == 3):
			{
				["Cop Donator Shop",
					[
						["H_Watchcap_blk","Beanie",50],
						["NVGoggles_OPFOR","NV Schwarz",800],
						["NVGoggles_INDEP","NV Gruen",800],
						["Rangefinder",nil,800],
						["ItemGPS",nil,100],
						["ToolKit",nil,500],
						["FirstAidKit",nil,250],
						["arifle_MXC_F",nil,5000],
						["arifle_MX_F",nil,5000],
						["30Rnd_65x39_caseless_mag",nil,100]
					]
				];
			};
			
			case (__GETC__(life_coplevel) == 4):
			{
				["Cop Donator Shop",
					[
						["H_Watchcap_blk","Beanie",50],
						["NVGoggles_OPFOR","NV Schwarz",800],
						["NVGoggles_INDEP","NV Gruen",800],
						["Rangefinder",nil,800],
						["ItemGPS",nil,100],
						["ToolKit",nil,500],
						["FirstAidKit",nil,250],
						["arifle_MXC_F",nil,5000],
						["arifle_MX_F",nil,5000],
						["arifle_MXM_F",nil,5000],
						["30Rnd_65x39_caseless_mag",nil,100]
					]
				];
			};
			
			case (__GETC__(life_coplevel) == 5):
			{
				["Cop Donator Shop",
					[
						["H_Watchcap_blk","Beanie",50],
						["NVGoggles_OPFOR","NV Schwarz",800],
						["NVGoggles_INDEP","NV Gruen",800],
						["Rangefinder",nil,800],
						["ItemGPS",nil,100],
						["ToolKit",nil,500],
						["FirstAidKit",nil,250],
						["arifle_MXC_F",nil,5000],
						["arifle_MX_F",nil,5000],
						["arifle_MXM_F",nil,5000],
						["arifle_MX_SW_F",nil,5000],
						["30Rnd_65x39_caseless_mag",nil,100],
						["100Rnd_65x39_caseless_mag_Tracer",nil,100]
					]
				];
			};
			
			case (__GETC__(life_coplevel) > 5):
			{
				["Cop Donator Shop",
					[
						["H_Watchcap_blk","Beanie",50],
						["NVGoggles_OPFOR","NV Schwarz",800],
						["NVGoggles_INDEP","NV Gruen",800],
						["Rangefinder",nil,800],
						["ItemGPS",nil,100],
						["ToolKit",nil,500],
						["FirstAidKit",nil,250],
						["arifle_MXC_F",nil,5000],
						["arifle_MX_F",nil,5000],
						["arifle_MXM_F",nil,5000],
						["arifle_MX_SW_F",nil,5000],
						["30Rnd_65x39_caseless_mag",nil,100],
						["100Rnd_65x39_caseless_mag_Tracer",nil,100]
					]
				];
			};
		};
	};

	case "cop_basic":
	{
		switch(true) do
		{
			case (playerSide != west): {"Du bist kein Polizist"};
			case (__GETC__(life_coplevel) == 0): {"Du bist nicht berechtigt den Polizeishop zu Benutzen!"};
			case (__GETC__(life_coplevel) == 1):
			{
				["Anwaerter",
					[
						["hgun_P07_snds_F","Taserpistole",1000],
						["16Rnd_9x21_Mag",nil,50],
						["Rangefinder",nil,1000],
						["ItemGPS",nil,100],
						["ToolKit",nil,500],
						["FirstAidKit",nil,250],
						["NVGoggles",nil,1000],
						["ItemRadio","Handy",250]
					]
				];
			};
			
			case (__GETC__(life_coplevel) == 2):
			{
				["Polizist",
					[
						["hgun_P07_snds_F","Taserpistole",1000],
						["16Rnd_9x21_Mag",nil,50],
						["SMG_02_F","Tasergewehr",2500],
						["30Rnd_9x21_Mag",nil,75],
						["Binocular",nil,100],
						["ItemGPS",nil,100],
						["ToolKit",nil,500],
						["FirstAidKit",nil,250],
						["NVGoggles",nil,1000],
						["muzzle_snds_L",nil,500],
						["acc_flashlight",nil,500],
						["optic_ACO_smg",nil,500],
						["optic_ACO_grn_smg",nil,500],
						["optic_Holosight_smg",nil,750],
						["Rangefinder",nil,1000],
						["ItemRadio","Handy",250]
					]
				];
			};
			
			case (__GETC__(life_coplevel) == 3):
			{
				["Polizeimeister",
					[
						["arifle_MXC_Black_F",nil,5000],
						["arifle_MX_Black_F",nil,5000],
						["30Rnd_65x39_caseless_mag",nil,100],	
						["hgun_P07_snds_F","Taserpistole",1000],
						["16Rnd_9x21_Mag",nil,50],
						["SMG_02_F","Tasergewehr",2500],
						["30Rnd_9x21_Mag",nil,75],
						["Binocular",nil,100],
						["ItemGPS",nil,100],
						["ToolKit",nil,500],
						["FirstAidKit",nil,250],
						["NVGoggles",nil,1000],
						["muzzle_snds_H",nil,500],
						["acc_flashlight",nil,500],
						["optic_Arco",nil,1000],
						["optic_Hamr",nil,1000],
						["optic_ACO_grn",nil,500],
						["optic_ACO_grn_smg",nil,500],
						["optic_Holosight",nil,750],
						["optic_Holosight_smg",nil,750],
						["optic_MRCO",nil,1000],
						["optic_SOS",nil,1000],
						["optic_DMS",nil,1000],
						["Rangefinder",nil,1000],
						["ItemRadio","Handy",250]
					]
				];
			};
			
			case (__GETC__(life_coplevel) == 4):
			{
				["Polizeihauptmeister",
					[
						["arifle_MXM_Black_F",nil,5000],
						["arifle_MXC_Black_F",nil,5000],
						["30Rnd_65x39_caseless_mag",nil,100],
						["arifle_MX_Black_F",nil,5000],
						["hgun_P07_snds_F","Taserpistole",1000],
						["16Rnd_9x21_Mag",nil,50],
						["SMG_02_F","Tasergewehr",2500],
						["30Rnd_9x21_Mag",nil,75],
						["Binocular",nil,100],
						["ItemGPS",nil,100],
						["ToolKit",nil,500],
						["FirstAidKit",nil,250],
						["NVGoggles",nil,1000],
						["HandGrenade_Stone","Flashbang",500],
						["muzzle_snds_H",nil,500],
						["acc_flashlight",nil,500],
						["optic_Arco",nil,1000],
						["optic_Hamr",nil,1000],
						["optic_ACO_grn",nil,500],
						["optic_ACO_grn_smg",nil,500],
						["optic_Holosight",nil,750],
						["optic_Holosight_smg",nil,750],
						["optic_MRCO",nil,1000],
						["optic_SOS",nil,1000],
						["optic_DMS",nil,1000],
						["Rangefinder",nil,1000],
						["ItemRadio","Handy",250]
					]
				];
			};
			
			case (__GETC__(life_coplevel) == 5):
			{
				["Kommissar",
					[
						["arifle_MX_SW_Black_F",nil,5000],
						["100Rnd_65x39_caseless_mag_Tracer",nil,100],
						["arifle_MXM_Black_F",nil,5000],
						["arifle_MXC_Black_F",nil,5000],
						["arifle_MX_Black_F",nil,5000],
						["30Rnd_65x39_caseless_mag",nil,100],
						["hgun_P07_snds_F","Taserpistole",1000],
						["16Rnd_9x21_Mag",nil,50],
						["SMG_02_F","Tasergewehr",2500],
						["30Rnd_9x21_Mag",nil,75],
						["Binocular",nil,100],
						["ItemGPS",nil,100],
						["ToolKit",nil,500],
						["FirstAidKit",nil,250],
						["NVGoggles",nil,1000],
						["HandGrenade_Stone","Flashbang",500],
						["muzzle_snds_H",nil,500],
						["acc_flashlight",nil,500],
						["optic_Arco",nil,1000],
						["optic_Hamr",nil,1000],
						["optic_ACO_grn",nil,500],
						["optic_ACO_grn_smg",nil,500],
						["optic_Holosight",nil,750],
						["optic_Holosight_smg",nil,750],
						["optic_MRCO",nil,1000],
						["optic_SOS",nil,1000],
						["optic_DMS",nil,1000],
						["Rangefinder",nil,1000],
						["ItemRadio","Handy",250]
					]
				];
			};
			case (__GETC__(life_coplevel) == 6):
			{
				["Oberkommissar",
					[
						["srifle_EBR_F",nil,5000],
						["20Rnd_762x51_Mag",nil,100],
						["arifle_MX_SW_Black_F",nil,5000],
						["100Rnd_65x39_caseless_mag_Tracer",nil,100],
						["arifle_MXM_Black_F",nil,5000],
						["arifle_MXC_Black_F",nil,5000],
						["arifle_MX_Black_F",nil,5000],
						["30Rnd_65x39_caseless_mag",nil,100],
						["hgun_P07_snds_F","Taserpistole",1000],
						["16Rnd_9x21_Mag",nil,50],
						["SMG_02_F","Tasergewehr",2500],
						["30Rnd_9x21_Mag",nil,75],
						["Binocular",nil,100],
						["ItemGPS",nil,100],
						["ToolKit",nil,500],
						["FirstAidKit",nil,250],
						["NVGoggles",nil,1000],
						["HandGrenade_Stone","Flashbang",500],
						["muzzle_snds_H",nil,500],
						["muzzle_snds_B",nil,500],
						["acc_flashlight",nil,500],
						["optic_Arco",nil,1000],
						["optic_Hamr",nil,1000],
						["optic_ACO_grn",nil,500],
						["optic_ACO_grn_smg",nil,500],
						["optic_Holosight",nil,750],
						["optic_Holosight_smg",nil,750],
						["optic_MRCO",nil,1000],
						["optic_SOS",nil,1000],
						["optic_DMS",nil,1000],
						["Rangefinder",nil,1000],
						["ItemRadio","Handy",250],
						["B_UavTerminal",nil,2500],
						["B_UAV_01_backpack_F",nil,5000]
					]
				];
			};
			
			case (__GETC__(life_coplevel) == 7):
			{
				["Hauptkommissar",
					[	
						["srifle_EBR_F",nil,5000],
						["20Rnd_762x51_Mag",nil,100],
						["arifle_MX_SW_Black_F",nil,5000],
						["100Rnd_65x39_caseless_mag_Tracer",nil,100],
						["arifle_MXM_Black_F",nil,5000],
						["arifle_MXC_Black_F",nil,5000],
						["arifle_MX_Black_F",nil,5000],
						["30Rnd_65x39_caseless_mag",nil,100],
						["hgun_P07_snds_F","Taserpistole",1000],
						["16Rnd_9x21_Mag",nil,50],
						["SMG_02_F","Tasergewehr",2500],
						["30Rnd_9x21_Mag",nil,75],
						["Binocular",nil,100],
						["ItemGPS",nil,100],
						["ToolKit",nil,500],
						["FirstAidKit",nil,250],
						["NVGoggles",nil,1000],
						["HandGrenade_Stone","Flashbang",500],
						["muzzle_snds_H",nil,500],
						["muzzle_snds_B",nil,500],
						["acc_flashlight",nil,500],
						["optic_Arco",nil,1000],
						["optic_Hamr",nil,1000],
						["optic_ACO_grn",nil,500],
						["optic_ACO_grn_smg",nil,500],
						["optic_Holosight",nil,750],
						["optic_Holosight_smg",nil,750],
						["optic_MRCO",nil,1000],
						["optic_SOS",nil,1000],
						["optic_DMS",nil,1000],
						["Rangefinder",nil,1000],
						["ItemRadio","Handy",250],
						["B_UavTerminal",nil,2500],
						["B_UAV_01_backpack_F",nil,5000]
					]
				];
			};
			
			case (__GETC__(life_coplevel) == 8):
			{
				["Polizeidirektor",
					[
						["srifle_EBR_F",nil,5000],
						["20Rnd_762x51_Mag",nil,100],
						["arifle_MX_SW_Black_F",nil,5000],
						["100Rnd_65x39_caseless_mag_Tracer",nil,100],
						["arifle_MXM_Black_F",nil,5000],
						["arifle_MXC_Black_F",nil,5000],
						["arifle_MX_Black_F",nil,5000],
						["30Rnd_65x39_caseless_mag",nil,100],
						["hgun_P07_snds_F","Taserpistole",1000],
						["16Rnd_9x21_Mag",nil,50],
						["SMG_02_F","Tasergewehr",2500],
						["30Rnd_9x21_Mag",nil,75],
						["Binocular",nil,100],
						["srifle_GM6_F",nil,100],
						["5Rnd_127x108_APDS_Mag",nil,100],
						["ItemGPS",nil,100],
						["ToolKit",nil,500],
						["FirstAidKit",nil,250],
						["NVGoggles",nil,1000],
						["HandGrenade_Stone","Flashbang",500],
						["muzzle_snds_H",nil,500],
						["muzzle_snds_B",nil,500],
						["acc_flashlight",nil,500],
						["optic_Arco",nil,1000],
						["optic_Hamr",nil,1000],
						["optic_ACO_grn",nil,500],
						["optic_ACO_grn_smg",nil,500],
						["optic_Holosight",nil,750],
						["optic_Holosight_smg",nil,750],
						["optic_MRCO",nil,1000],
						["optic_SOS",nil,1000],
						["optic_DMS",nil,1000],
						["Rangefinder",nil,1000],
						["ItemRadio","Handy",250],
						["B_UavTerminal",nil,2500],
						["B_UAV_01_backpack_F",nil,5000]
					]
				];
			};
		};
	};
};
