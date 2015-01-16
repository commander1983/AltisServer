/*
	File: fn_vehicleColorCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for vehicle colors.
*/
private["_vehicle","_ret","_path"];
_vehicle = [_this,0,"",[""]] call BIS_fnc_param;
if(_vehicle == "") exitWith {[]};
_ret = [];

switch (_vehicle) do
{
	case "B_Quadbike_01_F":
	{
		_path = "\A3\Soft_F\Quadbike_01\Data\";
		_path2 = "\A3\Soft_F_beta\Quadbike_01\Data\";
		_path3 = "\A3\Soft_F_bootcamp\Quadbike_01\Data\";
		_ret = 
		[
			["images\vehicles\civ_quad.jpg","civ"],
			["images\vehicles\cop\cop_quad.jpg","cop"],
			[_path + "quadbike_01_co.paa","civ"],
			[_path + "quadbike_01_opfor_co.paa","reb"],
			[_path2 + "quadbike_01_civ_black_co.paa","civ"],
			[_path2 + "quadbike_01_civ_blue_co.paa","civ"],
			[_path2 + "quadbike_01_civ_red_co.paa","civ"],
			[_path2 + "quadbike_01_civ_white_co.paa","civ"],
			[_path2 + "quadbike_01_indp_co.paa","reb"],
			[_path3 + "quadbike_01_indp_hunter_co.paa","reb"],
			["images\vehicles\med_quadbike.jpg","med"],
			["images\vehicles\adac_quadbike.jpg","adac"]
		];
	};
	
	case "C_Offroad_01_F":
	{
		_path = "\A3\soft_F\Offroad_01\Data\";
		_ret = 
		[
			[_path + "offroad_01_ext_co.paa","civ"],
			[_path + "offroad_01_ext_BASE01_CO.paa","civ"],
			[_path + "offroad_01_ext_BASE02_CO.paa","civ"],
			[_path + "offroad_01_ext_BASE03_CO.paa","civ"],
			[_path + "offroad_01_ext_BASE04_CO.paa","civ"],
			[_path + "offroad_01_ext_BASE05_CO.paa","civ"],
			["images\vehicles\med_offroad.jpg","med"],
			["images\vehicles\adac_offroad.jpg","adac"],
			["images\vehicles\cop\cop_offroad.jpg","cop"],
			["images\vehicles\civ_offroad_hugo.jpg","donate"],
			["images\vehicles\civ_offroad_pink.jpg","donate"],
			["images\vehicles\civ_offroad_colt.jpg","donate"],
			["images\vehicles\cop\cop_offroader_d.jpg","donatecop"],
			[_path + "offroad_01_ext_co.paa","donate"],
			[_path + "offroad_01_ext_BASE01_CO.paa","donate"],
			[_path + "offroad_01_ext_BASE02_CO.paa","donate"],
			[_path + "offroad_01_ext_BASE03_CO.paa","donate"],
			[_path + "offroad_01_ext_BASE04_CO.paa","donate"],
			[_path + "offroad_01_ext_BASE05_CO.paa","donate"]
		];
	};
	
	case "C_Hatchback_01_F":
	{
		_path = "\a3\soft_f_gamma\Hatchback_01\data\";
		_ret =
		[
			[_path + "hatchback_01_ext_base01_co.paa","civ"],
			[_path + "hatchback_01_ext_base02_co.paa","civ"],
			[_path + "hatchback_01_ext_base03_co.paa","civ"],
			[_path + "hatchback_01_ext_base04_co.paa","civ"],
			[_path + "hatchback_01_ext_base06_co.paa","civ"],
			[_path + "hatchback_01_ext_base07_co.paa","civ"],
			[_path + "hatchback_01_ext_base08_co.paa","civ"],
			[_path + "hatchback_01_ext_base09_co.paa","civ"],
			["images\vehicles\civ_hatchback_pink.jpg","donate"],
			["images\vehicles\civ_hatchback_racing.jpg","donate"],
			["images\vehicles\civ_hatchback_kapow.jpg","donate"],
			["images\vehicles\cop\cop_hatchback.jpg","cop"],
			["images\vehicles\cop\cop_hatchback_d.jpg","donatecop"]
		];
	};
	
	case "C_Hatchback_01_sport_F":
	{
		_path = "\a3\soft_f_gamma\Hatchback_01\data\";
		_ret =
		[
			[_path + "hatchback_01_ext_sport01_co.paa","civ"],
			[_path + "hatchback_01_ext_sport02_co.paa","civ"],
			[_path + "hatchback_01_ext_sport03_co.paa","civ"],
			[_path + "hatchback_01_ext_sport05_co.paa","civ"],
			[_path + "hatchback_01_ext_sport06_co.paa","civ"],
			["images\vehicles\cop\cop_hatchback.jpg","cop"],
			["images\vehicles\civ_hatchback_pink.jpg","donate"],
			["images\vehicles\civ_hatchback_racing.jpg","donate"],
			["images\vehicles\civ_hatchback_kapow.jpg","donate"],
			["images\vehicles\med_hatchback.jpg","med"],
			["images\vehicles\cop\cop_hatchback_d.jpg","donatecop"]
		];
	};
	
	case "C_SUV_01_F":
	{
		_path = "\a3\soft_f_gamma\SUV_01\Data\";
		_ret =
		[
			[_path + "suv_01_ext_co.paa","civ"],
			[_path + "suv_01_ext_03_co.paa","civ"],
			[_path + "suv_01_ext_04_co.paa","civ"],
			["images\vehicles\cop\cop_suv.jpg","cop"],
			["images\vehicles\civ_suv.jpg","donate"],
			["images\vehicles\civ_suv_rebelle.jpg","donate"],
			["images\vehicles\civ_suv_pink.jpg","donate"],
			["images\vehicles\cop\cop_suv_d.jpg","donatecop"],
			["images\vehicles\civ_suv.jpg","adac"],
			["images\vehicles\med_suv.jpg","med"]
		];
	};
	
	case "C_Van_01_transport_F":
	{
		_path = "\a3\soft_f_gamma\Van_01\Data\";
		_path2 = "\a3\soft_f_bootcamp\Van_01\Data\";
		_ret = 
		[
			[_path + "van_01_ext_co.paa","civ"],
			[_path + "van_01_ext_red_co.paa","civ"],
			["images\vehicles\civ_box1.jpg","civ","images\vehicles\civ_box.jpg"],
			[_path2 + "van_01_ext_ig_02_co.paa","donate"],
			[_path2 + "van_01_ext_ig_03_co.paa","donate"],
			[_path2 + "van_01_ext_ig_04_co.paa","donate"],
			[_path2 + "van_01_ext_ig_05_co.paa","donate"],
			[_path2 + "van_01_ext_ig_08_co.paa","donate"]
		];
	};
	
	case "C_Van_01_box_F":
	{
		_path = "\a3\soft_f_gamma\Van_01\Data\";
		_path2 = "\a3\soft_f_bootcamp\Van_01\Data\";
		_ret = 
		[
			[_path + "van_01_ext_co.paa","civ"],
			[_path + "van_01_ext_red_co.paa","civ"],
			["images\vehicles\civ_box1.jpg","civ","images\vehicles\civ_box.jpg"],
			[_path2 + "van_01_ext_ig_02_co.paa","donate"],
			[_path2 + "van_01_ext_ig_03_co.paa","donate"],
			[_path2 + "van_01_ext_ig_04_co.paa","donate"],
			[_path2 + "van_01_ext_ig_05_co.paa","donate"],
			[_path2 + "van_01_ext_ig_08_co.paa","donate"]
		];
	};
	
	case "B_MRAP_01_F":
	{
		_ret = 
		[
			["images\vehicles\reb_hunter1.jpg","reb"],
			["\a3\soft_f\MRAP_01\Data\mrap_01_base_co.paa","reb"]
		];
	};
	
	case "O_MRAP_02_F":
	{
		_ret = 
		[
			["images\vehicles\cop\cop_ifrit1.jpg","cop","images\vehicles\cop\cop_ifrit2.jpg"]
		];
	};
	
	case "I_MRAP_03_F":
	{
		_ret = 
		[
			["images\vehicles\cop\cop_strider.jpg","cop"],
			["images\vehicles\adac_strider.jpg","donatoradac"],
			["images\vehicles\med_strider.jpg","donatormed"]
		];
	};
	
	
	
	case "I_Truck_02_covered_F":
	{
		_ret = 
		[
			["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","civ","#(argb,8,8,3)color(0.047,0.322,0.875,1)"],
			["#(argb,8,8,3)color(1,1,1,1)","donate","#(argb,8,8,3)color(0,0,0,1)"],
			["images\vehicles\zamak_1.jpg","civ","images\vehicles\zamak_2.jpg"]
		];
	};
	
	case "I_Truck_02_transport_F":
	{
		_ret = 
		[
			["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","civ","#(argb,8,8,3)color(0.047,0.322,0.875,1)"],
			["#(argb,8,8,3)color(1,1,1,1)","donate","#(argb,8,8,3)color(0,0,0,1)"],
			["images\vehicles\zamak_1.jpg","civ","images\vehicles\zamak_2.jpg"]
		];
	};
	
	case "I_Truck_02_box_F":
	{
		_ret = 
		[
			["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","civ","#(argb,8,8,3)color(0.047,0.322,0.875,1)"],
			["#(argb,8,8,3)color(1,1,1,1)","donate","#(argb,8,8,3)color(0,0,0,1)"],
			["images\vehicles\zamak_1.jpg","civ","images\vehicles\zamak_3.jpg"]
		];
	};
	
	case "B_Truck_01_transport_F":
	{
		_ret =
		[
			["images\vehicles\adac_hemtt_1.jpg","adac","images\vehicles\adac_hemtt_2.jpg"]
		];
	};
	
	case "B_Heli_Light_01_F":
	{
		_path = "\a3\air_f\Heli_Light_01\Data\Skins\";
		_path2 = "\a3\air_f\Heli_Light_01\Data\";
		_ret = 
		[
			["images\vehicles\cop\cop_hummingbird.jpg","cop"],
			[_path + "heli_light_01_ext_blueline_co.paa","civ"],
			[_path + "heli_light_01_ext_elliptical_co.paa","civ"],
			[_path + "heli_light_01_ext_furious_co.paa","donate"],
			[_path + "heli_light_01_ext_graywatcher_co.paa","civ"],
			[_path + "heli_light_01_ext_jeans_co.paa","civ"],
			[_path + "heli_light_01_ext_shadow_co.paa","civ"],
			[_path + "heli_light_01_ext_sheriff_co.paa","civ"],
			[_path + "heli_light_01_ext_speedy_co.paa","civ"],
			[_path + "heli_light_01_ext_sunset_co.paa","civ"],
			[_path + "heli_light_01_ext_vrana_co.paa","civ"],
			[_path + "heli_light_01_ext_wasp_co.paa","civ"],
			[_path + "heli_light_01_ext_wave_co.paa","civ"],
			[_path2 + "heli_light_01_ext_blufor_co.paa","reb"],
			[_path2 + "heli_light_01_ext_indp_co.paa","reb"],
			[_path2 + "heli_light_01_ext_ion_co.paa","reb"],
			["images\vehicles\med_hummingbird.jpg","med"],
			["images\vehicles\adac_hummingbird.jpg","adac"],
			["images\vehicles\cop\cop_hummingbird_d.jpg","donatecop"]
		];
	};
	
	case "O_Heli_Light_02_unarmed_F":
	{
		_path = "\a3\air_f\Heli_Light_02\Data\";
		_ret = 
		[
			[_path + "heli_light_02_ext_co.paa","civ"],
			[_path + "heli_light_02_ext_civilian_co.paa","civ"],
			[_path + "heli_light_02_ext_indp_co.paa","reb"],
			[_path + "heli_light_02_ext_opfor_co.paa","donate"],
			["images\vehicles\med_orca.jpg","med"]
		];
	};
	
	case "I_Heli_Transport_02_F":
	{
		_path = "\a3\air_f_beta\Heli_Transport_02\Data\Skins\";
		_path2 = "\a3\air_f_beta\Heli_Transport_02\Data\";
		_ret =
		[
			[_path + "heli_transport_02_1_ion_co.paa","donate",_path + "heli_transport_02_2_ion_co.paa",_path + "heli_transport_02_3_ion_co.paa"],
			[_path + "heli_transport_02_1_dahoman_co.paa","donate",_path + "heli_transport_02_2_dahoman_co.paa",_path + "heli_transport_02_3_dahoman_co.paa"],
			[_path2 + "heli_transport_02_1_indp_co.paa","donate",_path2 + "heli_transport_02_2_indp_co.paa",_path2 + "heli_transport_02_3_indp_co.paa"],
			["images\vehicles\adac_moh_1.jpg","adac","images\vehicles\adac_moh_2.jpg","images\vehicles\adac_moh_3.jpg"]
		];
	};
	
	case "I_Heli_light_03_unarmed_F":
	{
		_ret =
		[
			["images\vehicles\cop\cop_hellcat.jpg","cop"]
		];
	};
	
	case "C_Heli_Light_01_civil_F":
	{
		_ret = [
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_graywatcher_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_light_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_shadow_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sheriff_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wasp_coxt_wasp_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa","civ"]
		];
	};
};

_ret;