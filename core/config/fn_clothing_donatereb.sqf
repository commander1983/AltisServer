/*
	File: fn_clothing_reb.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for Reb shop.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Donator Mohammed's Shop"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
			["U_B_survival_uniform",nil,2000],
			["U_I_CombatUniform_tshirt",nil,3000],
			["U_IG_Guerilla1_1",nil,1250],
			["U_I_G_Story_Protagonist_F",nil,2000],
			["U_I_G_resistanceLeader_F",nil,3000],
			["U_O_SpecopsUniform_ocamo",nil,4000],
			["U_O_PilotCoveralls",nil,3500],
			["U_IG_leader","Guerilla Leader",4000]
		];
	};
	
	//Hats
	case 1:
	{
		[
			["G_Balaclava_blk",nil,25],
			["G_Balaclava_lowprofile",nil,20],
			["G_Balaclava_oli",nil,20],
			["G_Balaclava_combat",nil,20],
			["H_ShemagOpen_tan",nil,850],
			["H_Shemag_olive",nil,850],
			["H_ShemagOpen_khk",nil,800],
			["H_HelmetO_ocamo",nil,2500],
			["H_MilCap_oucamo",nil,1200],
			["H_Bandanna_camo",nil,650],
			["H_Beret_grn",nil,650],
			["H_Beret_ocamo",nil,650],
			["H_Beret_02",nil,650]
		];
	};
	
	//Glasses
	case 2:
	{
		[
			["G_Shades_Black",nil,25],
			["G_Shades_Blue",nil,20],
			["G_Sport_Blackred",nil,20],
			["G_Sport_Checkered",nil,20],
			["G_Sport_Blackyellow",nil,20],
			["G_Sport_BlackWhite",nil,20],
			["G_Squares",nil,10],
			["G_Aviator",nil,100],
			["G_Lowprofile",nil,30],
			["G_Combat",nil,55]
		];
	};
	
	//Vest
	case 3:
	{
		[
			["V_TacVest_khk",nil,12500],
			["V_TacVestIR_blk",nil,12500],
			["V_BandollierB_cbr",nil,4500],
			["V_BandollierB_blk",nil,4500],
			["V_HarnessO_brn",nil,7500],
			["V_HarnessO_gry",nil,7500]
		];
	};
	
	//Backpacks
	case 4:
	{
		[
			["B_AssaultPack_cbr",nil,250],
			["B_Kitbag_mcamo",nil,450],
			["B_TacticalPack_oli",nil,350],
			["B_FieldPack_ocamo",nil,300],
			["B_Bergen_sgg",nil,450],
			["B_Kitbag_cbr",nil,450],
			["B_Carryall_oli",nil,500]
		];
	};
};