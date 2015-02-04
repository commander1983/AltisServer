/*

	Main configuration for non-persistent market system
	Will need triggers to hook into vanilla pricing methods

*/

////////////MAIN CONFIG

life_market_resources = [

	//Schema: SHORTNAME, DEFAULT-WERT, MIN-WERT, MAX-WERT, VERÄNDERUNG BEI AKTION [VERKAUF Multipliziert mit 1, Kauf multipliziert um -1
	["diamondc", 1600, 480, 2240, 3, 0.5,
		[ 
			["oilp",1], 
			["iron_r",1],
			["copper_r",1],
			["salt_r",1],
			["glass",1],
			["cement",1],
			["vodka",1],
			["silberp",1],
			["goldp",1],
			["kristalle",1]
		]
	],
	
	["goldp", 2450, 735, 3430, 5, 0.5,
		[ 
			["diamondc",1], 
			["iron_r",1],
			["copper_r",1],
			["salt_r",1],
			["glass",1],
			["oilp",1],
			["vodka",1],
			["cement",1],
			["silberp",1],
			["kristalle",1]
		]
	],
	
	["oilp", 2250, 675, 3150, 5, 0.5,
		[ 
			["diamondc",1], 
			["iron_r",1],
			["copper_r",1],
			["salt_r",1],
			["glass",1],
			["cement",1],
			["vodka",1],
			["silberp",1],
			["goldp",1],
			["kristalle",1]
		]
	],
	
	["salt_r", 950, 285, 1330, 2, 0.25,
		[ 
			["diamondc",1], 
			["iron_r",1],
			["copper_r",1],
			["oilp",1],
			["glass",1],
			["cement",1],
			["vodka",1],
			["silberp",1],
			["goldp",1],
			["kristalle",1]
		]
	],
	
	["silberp", 2250, 675, 3150, 5, 0.5,
		[ 
			["diamondc",1], 
			["iron_r",1],
			["copper_r",1],
			["salt_r",1],
			["glass",1],
			["oilp",1],
			["vodka",1],
			["cement",1],
			["goldp",1],
			["kristalle",1]
		]
	],
	
	["iron_r", 950, 285, 1330, 2, 0.25,
		[ 
			["diamondc",1], 
			["oilp",1],
			["copper_r",1],
			["salt_r",1],
			["glass",1],
			["cement",1],
			["vodka",1],
			["silberp",1],
			["goldp",1],
			["kristalle",1]
		]
	],
	
	["glass", 950, 285, 1330, 2, 0.25,
		[ 
			["diamondc",1], 
			["iron_r",1],
			["copper_r",1],
			["salt_r",1],
			["oilp",1],
			["cement",1],
			["vodka",1],
			["silberp",1],
			["goldp",1],
			["kristalle",1]
		]
	],
	
	["vodka", 450, 135, 630, 2, 0.25,
		[ 
			["diamondc",1], 
			["iron_r",1],
			["copper_r",1],
			["salt_r",1],
			["glass",1],
			["oilp",1],
			["cement",1],
			["silberp",1],
			["goldp",1],
			["kristalle",1]
		]
	],
	
	["cement", 1100, 330, 1540, 4, 0.75,
		[ 
			["diamondc",1], 
			["iron_r",1],
			["copper_r",1],
			["salt_r",1],
			["glass",1],
			["oilp",1],
			["vodka",1],
			["silberp",1],
			["goldp",1],
			["kristalle",1]
		]
	],
	
	["copper_r", 750, 225, 1050, 3, 1.5,
		[ 
			["diamondc",1], 
			["iron_r",1],
			["oilp",1],
			["salt_r",1],
			["glass",1],
			["cement",1],
			["vodka",1],
			["silberp",1],
			["goldp",1],
			["kristalle",1]
		]
	],
	
		["kristalle", 2000, 400, 2900, 3, 1.5,
		[ 
			["diamondc",1], 
			["iron_r",1],
			["oilp",1],
			["salt_r",1],
			["glass",1],
			["cement",1],
			["vodka",1],
			["silberp",1],
			["goldp",1]
		]
	],
	
	///////////////////////////////////
	
	["uranp", 5250, 1575, 7350, 6, 1,
		[
			["marijuana",1],
			["cocainep",1],
			["methp",1],
			["moonshine",1],
			["heroinp",1],
			["frogslsd",1],
			["turtle",1]
		]
	],
	
	["cocainep", 3850, 1155, 5390, 4, 0.75,
		[
			["marijuana",1],
			["heroinp",1],
			["methp",1],
			["moonshine",1],
			["uranp",1],
			["frogslsd",1],
			["turtle",1]
		]
	],
	
	["heroinp", 3350, 1005, 4690, 4, 0.75,
		[
			["marijuana",1],
			["cocainep",1],
			["methp",1],
			["moonshine",1],
			["uranp",1],
			["frogslsd",1],
			["turtle",1]
		]
	],
	
	["marijuana", 2450, 735, 3430, 3, 1.5,
		[
			["heroinp",1],
			["cocainep",1],
			["methp",1],
			["moonshine",1],
			["uranp",1],
			["frogslsd",1],
			["turtle",1]
		]
	],
	
	["frogslsd", 2300, 690, 3220, 3, 1.5,
		[
			["marijuana",1],
			["cocainep",1],
			["methp",1],
			["moonshine",1],
			["heroinp",1],
			["uranp",1],
			["turtle",1]
		]
	],
	
	["moonshine", 1500, 450, 2100, 2, 0.25,
		[
			["marijuana",1],
			["cocainep",1],
			["methp",1],
			["heroinp",1],
			["uranp",1],
			["frogslsd",1],
			["turtle",1]
		]
	],
	
	["methp", 3350, 1005, 4690, 4, 0.75,
		[
			["marijuana",1],
			["cocainep",1],
			["heroinp",1],
			["moonshine",1],
			["uranp",1],
			["frogslsd",1],
			["turtle",1]
		]
	],
	
	["turtle", 8000, 6000, 9000, 4, 0.75,
		[
			["marijuana",1],
			["cocainep",1],
			["heroinp",1],
			["moonshine",1],
			["uranp",1],
			["frogslsd",1],
			["methp",1]
		]
	]		
];
publicVariable "life_market_resources";

////////////GENERATED CONFIG
//life_market_changes = []; //[SHORTNAME,SELL,BUY]
life_market_shortnames = []; //shortnames if in market
//life_market_clampprices = []; //[SHORTNAME,MIN,MAX]

{
	life_market_shortnames set [count life_market_shortnames, _x select 0];
	//life_market_clampprices set [count life_market_clampprices, [_x select 0, _x select 2, _x select 3] ];
	//life_market_changes set [count life_market_changes, [_x select 0, _x select 4, _x select 5] ];
}
foreach life_market_resources;

publicVariable "life_market_shortnames";
//publicVariable "life_market_clampprices";

////////////SYNC PRICES WITH SERVER IF EMPTY
//if(isNil("life_market_prices")) then
//{
	life_market_prices = []; //[SHORTNAME,CURRENTPRICE,DIRECTIONGLOBAL,DIRECTIONLOCAL]
	{
	
		life_market_prices set [count life_market_prices, [_x select 0, _x select 1, 0, 0] ];
	}
	foreach life_market_resources;
	
	publicVariable "life_market_prices";
	
	systemChat "Market Prices Generated!";
//};