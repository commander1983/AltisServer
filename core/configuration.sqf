#include <macro.h>
/*
	Master Life Configuration File
	This file is to setup variables for the client, there are still other configuration files in the system

*****************************
****** Backend Variables *****
*****************************
*/
nn_last_vehicles = [];
nn_empInUse = false;
life_query_time = time;
life_action_delay = time;
life_trunk_vehicle = Objnull;
life_session_completed = false;
life_garage_store = false;
life_session_tries = 0;
life_net_dropped = false;
life_hit_explosive = false;
life_siren_active = false;
life_siren2_active = false;
life_clothing_filter = 0;
life_clothing_uniform = -1;
life_redgull_effect = time;
life_is_processing = false;
life_bail_paid = false;
life_impound_inuse = false;
life_action_inUse = false;
life_spikestrip = ObjNull;
life_sperre = ObjNull;
life_warnung = ObjNull;
life_knockout = false;
life_interrupted = false;
life_respawned = false;
life_action_gather = false;
life_bet = false;
life_removeWanted = false;
Life_request_timer = false;
life_channel_send = true;
life_fadeSound = false;
life_god = false; //Add this
life_frozen = false; //And this
life_markers = false; //Finally this

//Revive constant variables.
__CONST__(life_revive_cops,FALSE); //Set to false if you don't want cops to be able to revive downed players.
__CONST__(life_revive_fee,3000); //Fee for players to pay when revived.
life_respawn_timer = .5; //Scaled in minutes

//House Limit
__CONST__(life_houseLimit,5); //Maximum amount of houses a player can buy (TODO: Make Tiered licenses).

//Gang related stuff?
__CONST__(life_gangPrice,250000); //Price for creating a gang (They're all persistent so keep it high to avoid 345345345 gangs).
__CONST__(life_gangUpgradeBase,50000); //MASDASDASD
__CONST__(life_gangUpgradeMultipler,3.5); //BLAH

//Uniform price (0),Hat Price (1),Glasses Price (2),Vest Price (3),Backpack Price (4)
life_clothing_purchase = [-1,-1,-1,-1,-1];
/*
*****************************
****** Weight Variables *****
*****************************
*/
life_maxWeight = 30; //Identifies the max carrying weight (gets adjusted throughout game when wearing different types of clothing).
life_maxWeightT = 30; //Static variable representing the players max carrying weight on start.
life_carryWeight = 0; //Represents the players current inventory weight (MUST START AT 0).

/*
*****************************
****** Life Variables *******
*****************************
*/
life_net_dropped = false;
life_hit_explosive = false;
life_siren_active = false;
life_bank_fail = false;
life_use_atm = true;
life_is_arrested = false;
life_delivery_in_progress = false;
life_action_in_use = false;
life_thirst = 100;
life_hunger = 100;
life_battery = 100;
__CONST__(life_paycheck_period,5); //Five minutes
ja_dzep = 0;
__CONST__(life_impound_car,2500);
__CONST__(life_impound_boat,1250);
__CONST__(life_impound_air,3750);
life_istazed = false;
life_isdowned = false;
life_my_gang = ObjNull;
life_smartphoneTarget = ObjNull;
life_vehicles = [];
bank_robber = [];
switch (playerSide) do
{
	case west: 
	{
		ja_pare = 5000;
		life_paycheck = 750;
	};
	case civilian: 
	{
		ja_pare = 5000;
		life_paycheck = 250;
	};
	
	case independent: {
		ja_pare = 5000;
		life_paycheck = 0;
	};
	
	case east:
	{
		ja_pare = 5000;
		life_paycheck = 3000;
	};
};

/*
	Master Array of items?
*/

life_vShop_rentalOnly = ["B_Heli_Transport_01_F","B_G_Offroad_01_armed_F"];
__CONST__(life_vShop_rentalOnly,life_vShop_rentalOnly);

life_inv_items = 
[
	"life_inv_oilu",
	"life_inv_oilp",
	"life_inv_heroinu",
	"life_inv_heroinp",
	"life_inv_cannabis",
	"life_inv_marijuana",
	"life_inv_apple",
	"life_inv_rabbit",
	"life_inv_salema",
	"life_inv_ornate",
	"life_inv_mackerel",
	"life_inv_tuna",
	"life_inv_mullet",
	"life_inv_catshark",
	"life_inv_turtle",
	"life_inv_fishingpoles",
	"life_inv_water",
	"life_inv_donuts",
	"life_inv_turtlesoup",
	"life_inv_coffee",
	"life_inv_fuelF",
	"life_inv_pickaxe",
	"life_inv_copperore",
	"life_inv_ironore",
	"life_inv_ironr",
	"life_inv_copperr",
	"life_inv_sand",
	"life_inv_salt",
	"life_inv_saltr",
	"life_inv_glass",
	"life_inv_tbacon",
	"life_inv_lockpick",
	"life_inv_redgull",
	"life_inv_peach",
	"life_inv_diamond",
	"life_inv_coke",
	"life_inv_cokep",
	"life_inv_diamondr",
	"life_inv_spikeStrip",
	"life_inv_rock",
	"life_inv_cement",
	"life_inv_goldbar",
	"life_inv_blastingcharge",
	"life_inv_boltcutter",
	"life_inv_defusekit",
	"life_inv_methu",
	"life_inv_methp",
	"life_inv_moonshine",
	"life_inv_vodka",
	"life_inv_grapes",
	"life_inv_goldu",
	"life_inv_goldp",
	"life_inv_silberu",
	"life_inv_silberp",
	"life_inv_uranu",
	"life_inv_uranp",
	"life_inv_frogs",
    "life_inv_frogslsd",
	"life_inv_handcuffs",
	"life_inv_cerises",
	"life_inv_banane",
	"life_inv_pcolap",
	"life_inv_sotbp",
	"life_inv_maitp",
	"life_inv_birne",
	"life_inv_pille",
	"life_inv_battery",
	"life_inv_keys",
	"life_inv_painkillers",
	"life_inv_coppainkillers",
	"life_inv_storagesmall",
	"life_inv_storagebig",
	"life_inv_warnung",
	"life_inv_sperre",
	"life_inv_license",
	"life_inv_kristall",
	"life_inv_kristalle"
	
];

//Setup variable inv vars.
{missionNamespace setVariable[_x,0];} foreach life_inv_items;
//Licenses [license var, civ/cop]
life_licenses =
[
	["license_cop_air","cop"],
	["license_cop_swat","cop"],
	["license_cop_cg","cop"],
	["license_civ_driver","civ"],
	["license_civ_air","civ"],
	["license_civ_heroin","civ"],
	["license_civ_marijuana","civ"],
	["license_civ_gang","civ"],
	["license_civ_boat","civ"],
	["license_civ_kristall","civ"],
	["license_civ_oil","civ"],
	["license_civ_dive","civ"],
	["license_civ_truck","civ"],
	["license_civ_gun","civ"],
	["license_civ_rebel","civ"],
	["license_civ_coke","civ"],
	["license_civ_diamond","civ"],
	["license_civ_copper","civ"],
	["license_civ_iron","civ"],
	["license_civ_sand","civ"],
	["license_civ_salt","civ"],
	["license_civ_cement","civ"],
	["license_civ_meth","civ"],
	["license_civ_grapes","civ"],
	["license_civ_moonshine","civ"],
	["license_civ_gold","civ"],
	["license_civ_silber","civ"],
	["license_civ_uran","civ"],
	["license_civ_lsd","civ"],
	["license_civ_pcola","civ"],
	["license_civ_sotb","civ"],
	["license_civ_mait","civ"],
	["license_civ_home","civ"],
	["license_civ_permanent","civ"]
];

//Setup License Variables
{missionNamespace setVariable[(_x select 0),false];} foreach life_licenses;

life_dp_points = ["dp_1","dp_2","dp_3","dp_4","dp_5","dp_6","dp_7","dp_8","dp_9","dp_10","dp_11","dp_12","dp_13","dp_14","dp_15","dp_15","dp_16","dp_17","dp_18","dp_19","dp_20","dp_21","dp_22","dp_23","dp_24","dp_25"];
//[shortVar,reward]
life_illegal_items = [["heroinu",900],["heroinp",2400],["cocaine",2000],["cocainep",3500],["marijuana",2000],["methu",700],["methp",2200],["turtle",4200],["cannabis",500],["moonshine",1150],["uranu",3600],["uranp",5100],["frogs",250],["frogslsd",1000],["blastingcharge",10000],["boltcutter",500],["goldbar",10000],["lockpick",3000]];
life_illegal_item_shortnames = ["heroinu","heroinp","cocaine","cocainep","cannabis","marijuana","turtle","methu","methp","moonshine",",uranu","uranp","frogs","frogslsd","blastingcharge","boltcutter","goldbar","lockpick"];

life_police_only_items = [];
life_police_only_items_bounty = [];

/*
	Sell / buy arrays
*/
sell_array = 
[
	["apple",38],
	["peach",38],
	["grapes",36],
	["banane",36],
	["cerises",38],
	["pcolap",110],
	["sotbp",120],
	["maitp",100],
	["birne",36],
	
	["salema",90],
	["ornate",120],
	["mackerel",300],
	["tuna",180],
	["mullet",180],
	["catshark",900],
	["turtlesoup",1750],
	
	["rabbit",4],
	["water",5],
	["coffee",5],
	["donuts",3],
	["tbacon",4],
	["redgull",15],
	
	["pickaxe",100],
	["lockpick",1000],
	["officerlockpick",350],
	["fuelF",200],
	["spikeStrip",50],
	["battery",75],
	["keys",50],
	["painkillers",5000],
	["coppainkillers",3750],
	["handcuffs",150],
	["pille",5000],
	["sperre",250],
	["warnung",50],
	
	["cocaine",2500],
	["cocainep",4000],
	["diamond",300],
	["diamondc",900],
	["iron_r",600],
	["copper_r",525],
	["salt_r",600],
	["glass",550],
	["heroinu",900],
	["heroinp",2400],
	["oilp",1200],
	["turtle",8000],
	["cannabis",500],
	["marijuana",2000],
	["cement",850],
	["methu",700],
	["methp",2200],
	["moonshine",1150],
	["vodka",500],
	["goldu",600],
	["goldp",1300],
	["silberu",500],
	["silberp",1200],
	["uranu",3600],
	["uranp",5100],
	["frogs",250],
    ["frogslsd",1000],
	["goldbar",9000],
	["license",10000],
	["kristall",800],
	["kristalle",2000]
];
__CONST__(sell_array,sell_array);

buy_array = 
[
	["rabbit",6],
	["water",7],
	["donuts",5],
	["coffee",10],
	["tbacon",8],
	["lockpick",1500],
	["officerlockpick",500],
	["pickaxe",250],
	["redgull",20],
	["fuelF",250],
	["spikeStrip",100],
	["blastingcharge",35000],
	["boltcutter",7500],
	["defusekit",2500],
	["handcuffs",250],
	["pille",200000],
	["battery",250],
	["keys",150],
	["painkillers",20000],
	["coppainkillers",15000],
	["storagesmall",150000],
	["storagebig",300000],
	["sperre",250],
	["warnung",50],
	["license",15000]
];
__CONST__(buy_array,buy_array);

life_weapon_shop_array =
[
	["arifle_sdar_F",0],
	["hgun_P07_snds_F",0],
	["hgun_P07_F",0],
	["Binocular",0],
	["ItemGPS",0],
	["ToolKit",0],
	["FirstAidKit",0],
	["Medikit",0],
	["NVGoggles",0],
	["16Rnd_9x21_Mag",0],
	["20Rnd_556x45_UW_mag",0],
	["ItemMap",0],
	["ItemCompass",0],
	["Chemlight_blue",0],
	["Chemlight_yellow",0],
	["Chemlight_green",0],
	["Chemlight_red",0],
	["hgun_Rook40_F",0],
	["arifle_Katiba_F",0],
	["30Rnd_556x45_Stanag",0],
	["20Rnd_762x51_Mag",0],
	["30Rnd_65x39_caseless_green",0],
	["DemoCharge_Remote_Mag",0],
	["SLAMDirectionalMine_Wire_Mag",0],
	["optic_ACO_grn",0],
	["acc_flashlight",0],
	["srifle_EBR_F",0],
	["arifle_TRG21_F",0],
	["optic_MRCO",0],
	["optic_Aco",0],
	["arifle_MX_F",0],
	["arifle_MXC_F",0],
	["arifle_MXM_F",0],
	["MineDetector",0],
	["optic_Holosight",0],
	["acc_pointer_IR",0],
	["arifle_TRG20_F",0],
	["SMG_01_F",0],
	["arifle_Mk20C_F",0],
	["30Rnd_45ACP_Mag_SMG_01",0],
	["30Rnd_9x21_Mag",0]
];
__CONST__(life_weapon_shop_array,life_weapon_shop_array);

life_garage_prices =
[
	["B_Quadbike_01_F",500],
    ["C_Hatchback_01_F",1750],
    ["C_Offroad_01_F", 1750],
    ["B_G_Offroad_01_F",2000],
    ["C_SUV_01_F",2000],
    ["C_Van_01_transport_F",3500],
    ["C_Hatchback_01_sport_F",4000],
    ["I_Heli_Transport_02_F",25000],
    ["C_Van_01_box_F",5000],
    ["I_Truck_02_covered_F",10000],
    ["I_Truck_02_transport_F",7500],
    ["I_Truck_02_box_F",12500],
    ["B_Truck_01_covered_F",17500],
    ["B_Truck_01_transport_F",5000],
    ["B_Truck_01_box_F", 17500],
    ["O_MRAP_02_F",15000],
    ["B_Heli_Light_01_F",12500],
    ["O_Heli_Light_02_unarmed_F",25000],
    ["C_Rubberboat",5000],
    ["C_Boat_Civil_01_F",6500],
    ["B_Boat_Transport_01_F",2000],
    ["C_Boat_Civil_01_police_F",3000],
    ["B_Boat_Armed_01_minigun_F",8750],
    ["B_MRAP_01_F",15000],
    ["I_MRAP_03_F",5000],
    ["I_Heli_light_03_unarmed_F",25000],
	["C_Kart_01_Blu_F",6250],
    ["C_Kart_01_Fuel_F",6250],
    ["C_Kart_01_Red_F",6250],
    ["C_Kart_01_Vrana_F",6250],
    ["O_Truck_03_transport_F",12500],
    ["O_Truck_03_covered_F",15000],
    ["O_Truck_03_repair_F",17500],
	["B_Heli_Transport_03_unarmed_F",5000],
	["C_Heli_Light_01_civil_F",12500],
	["O_Heli_Transport_04_covered_F",25000],
	["O_Heli_Transport_04_F",5000],
	["O_Truck_03_fuel_F",17500],
	["O_Truck_03_device_F",17500],
	["O_Heli_Transport_04_medevac_F",25000]
];
__CONST__(life_garage_prices,life_garage_prices);

life_garage_sell =
[
	["B_Quadbike_01_F",500],
	["C_Hatchback_01_F",2000],
	["C_Offroad_01_F", 2500],
	["B_G_Offroad_01_F",12500],
	["C_SUV_01_F",4250],
	["C_Van_01_transport_F",3750],
	["C_Hatchback_01_sport_F",5000],
	["I_Heli_Transport_02_F",100000],
	["C_Van_01_box_F",7000],
	["I_Truck_02_covered_F",17500],
	["I_Truck_02_transport_F",16250],
	["I_Truck_02_box_F",21250],
	["B_Truck_01_covered_F",75000],
	["B_Truck_01_transport_F",15000],
	["B_Truck_01_box_F", 75000],
	["O_MRAP_02_F",10000],
	["B_Heli_Light_01_F",20000],
	["O_Heli_Light_02_unarmed_F",75000],
	["C_Rubberboat",2500],
	["C_Boat_Civil_01_F",11000],
	["B_Boat_Transport_01_F",750],
	["C_Boat_Civil_01_police_F",1250],
	["B_Boat_Armed_01_minigun_F",3500],
	["B_MRAP_01_F",162500],
	["I_MRAP_03_F",12500],
	["I_Heli_light_03_unarmed_F",7000],
	["C_Kart_01_Blu_F",2500],
	["C_Kart_01_Fuel_F",2500],
	["C_Kart_01_Red_F",2500],
	["C_Kart_01_Vrana_F",2500],
	["O_Truck_03_transport_F",65000],
	["O_Truck_03_covered_F",70000],
	["B_Heli_Transport_03_unarmed_F",100000],
	["C_Heli_Light_01_civil_F",20000],
	["O_Heli_Transport_04_covered_F",7000],
	["O_Heli_Transport_04_F",100000],
	["O_Heli_Transport_04_medevac_F",100000]
];
__CONST__(life_garage_sell,life_garage_sell);

life_vgarage_prices =
[
	["B_Quadbike_01_F",1000],
    ["C_Hatchback_01_F",10000],
    ["C_Offroad_01_F", 12000],
    ["B_G_Offroad_01_F",70000],
    ["C_SUV_01_F",26000],
    ["C_Van_01_transport_F",39000],
    ["C_Hatchback_01_sport_F",70000],
    ["I_Heli_Transport_02_F",2800000],
    ["C_Van_01_box_F",50000],
    ["I_Truck_02_covered_F",130000],
    ["I_Truck_02_transport_F",110000],
    ["I_Truck_02_box_F",160000],
    ["B_Truck_01_covered_F",500000],
    ["B_Truck_01_transport_F",25000],
    ["B_Truck_01_box_F", 850000],
    ["O_MRAP_02_F",60000],
    ["B_Heli_Light_01_F",1500000],
    ["O_Heli_Light_02_unarmed_F",3500000],
    ["B_MRAP_01_F",2275000],
    ["I_MRAP_03_F",70000],
    ["I_Heli_light_03_unarmed_F",70000],
	["C_Kart_01_Blu_F",16000],
    ["C_Kart_01_Fuel_F",16000],
    ["C_Kart_01_Red_F",16000],
    ["C_Kart_01_Vrana_F",16000],
    ["O_Truck_03_transport_F",350000],
    ["O_Truck_03_covered_F",420000],
    ["O_Truck_03_repair_F",700000],
	["B_Heli_Transport_03_unarmed_F",175000],
	["C_Heli_Light_01_civil_F",1500000],
	["O_Heli_Transport_04_covered_F",3900000],
	["O_Heli_Transport_04_F",175000],
	["O_Truck_03_fuel_F",700000],
	["O_Truck_03_device_F",750000],
	["O_Heli_Transport_04_medevac_F",175000]
];
__CONST__(life_vgarage_prices,life_vgarage_prices);

life_dgarage_prices =
[
	["B_Quadbike_01_F",1000],
    ["C_Hatchback_01_F",8000],
    ["C_Offroad_01_F", 11000],
    ["B_G_Offroad_01_F",60000],
    ["C_SUV_01_F",21000],
    ["C_Van_01_transport_F",31000],
    ["C_Hatchback_01_sport_F",55000],
    ["I_Heli_Transport_02_F",2800000],
    ["C_Van_01_box_F",42000],
    ["I_Truck_02_covered_F",105000],
    ["I_Truck_02_transport_F",90000],
    ["I_Truck_02_box_F",133000],
    ["B_Truck_01_covered_F",420000],
    ["B_Truck_01_box_F", 700000],
    ["B_Heli_Light_01_F",1100000],
    ["O_Heli_Light_02_unarmed_F",2800000],
    ["B_MRAP_01_F",2275000],
	["C_Kart_01_Blu_F",15000],
    ["C_Kart_01_Fuel_F",15000],
    ["C_Kart_01_Red_F",15000],
    ["C_Kart_01_Vrana_F",15000],
    ["O_Truck_03_transport_F",350000],
    ["O_Truck_03_covered_F",420000],
    ["O_Truck_03_repair_F",700000],
	["C_Heli_Light_01_civil_F",1200000],
	["O_Heli_Transport_04_covered_F",3100000],
	["O_Truck_03_fuel_F",700000],
	["O_Truck_03_device_F",750000]
];
__CONST__(life_dgarage_prices,life_dgarage_prices);

life_egarage_prices =
[
	["B_Quadbike_01_F",1500],
    ["C_Hatchback_01_F",4200],
    ["C_Offroad_01_F",6000],
    ["C_SUV_01_F",15000],
    ["C_Hatchback_01_sport_F",21000],
    ["I_Heli_Transport_02_F",150000],
	["B_Truck_01_transport_F",25000],
    ["O_MRAP_02_F",60000],
    ["B_Heli_Light_01_F",35000],
    ["O_Heli_Light_02_unarmed_F",130000],
    ["I_MRAP_03_F",70000],
    ["I_Heli_light_03_unarmed_F",60000],
	["B_Heli_Transport_03_unarmed_F",175000],
	["O_Heli_Transport_04_F",175000],
	["O_Heli_Transport_04_medevac_F",175000]
];
__CONST__(life_egarage_prices,life_egarage_prices);