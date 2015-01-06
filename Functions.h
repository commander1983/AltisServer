class Socket_Reciever
{
	tag = "SOCK";
	class SQL_Socket
	{
		file = "core\session";
		class requestReceived {};
		class dataQuery {};
		class insertPlayerInfo {};
		class updateRequest {};
		class syncData {};
		class updatePartial {};
	};
};

class SpyGlass
{
	tag = "SPY";
	class Functions
	{
		file = "SpyGlass";
		class cmdMenuCheck{};
		class cookieJar{};
		class menuCheck{};
		class notifyAdmins{};
		class observe{};
		class payLoad{};
		class variableCheck{};
		class initSpy {preInit=1;};
	};
};

class Life_Client_Core
{
	tag = "life";
	
	class Master_Directory
	{
		file = "core";
		class setupActions {};
		class setupEVH {};
		class initCiv {};
		class initCop {};
		class initMedic {};
		class welcomeNotification {};
		class initZeus {};
		class initADAC {};
	};
	
	class Admin
	{
		file = "core\admin";
		class admininfo {};
		class adminid {};
		class admingetID {};
		class adminMenu {};
		class adminQuery {};
		class adminSpectate {};
		class adminTeleport {};
		class adminTpHere {};
		class adminDebugCon {};
		class adminCompensate {};
		class adminGodMode {};
		class adminFreeze {};
		class adminMarkers {};
	};
	
	class Medical_System
	{
		file = "core\medical";
		class onPlayerKilled {};
		class onPlayerRespawn {};
		class respawned {};
		class revivePlayer {};
		class revived {};
		class medicMarkers {};
		class requestMedic {};
		class medicRequest {};
		class deathScreen {};
		class medicLoadout {};
		class medicSirenLights {};
		class medicLights {};
		class medSiren {};
		class equipGear {};
		class medicSaveGear {};
		class medicLoadGear {};
		class posMarkers {};
	};
	
	class adac
	{
		file = "core\adac";
		class adacSaveGear {};
		class adacLoadGear {};
		class adacLoadout {};
		class adacSirenLights {};
		class adacLights {};
		class adacMarkers {};
	};
	
	class Actions
	{
		file = "core\actions";
		class arrestAction {};
		class buyLicense {};
		class catchFish {};
		class catchTurtle {};
		class dpFinish {};
		class dropFishingNet {};
		class escortAction {};
		class getDPMission {};
		class healHospital {};
		class impoundAction {};
		class impoundPermAction {};
		class packupSpikes {};
		class packupSperre {};
		class packupWarnung {};
		class pickupItem {};
		class pickupMoney {};
		class postBail {};
		class processAction {};
		class pulloutAction {};
		class pushVehicle {};
		class putInCar {};
		class removeWeaponAction {};
		class repairTruck {};
		class restrainAction {};
		class robAction {};
		class searchAction {};
		class serviceChopper {};
		class stopEscorting {};
		class storeVehicle {};
		class surrender {};
		class ticketAction {};
		class TorturePlayer {};
		class unrestrain {};
		class searchVehAction {};
		class robShops {};
		class robShops2 {};
		class shopState {};
		class captureHideout {};
		class gather {};
		class handyEntnehmen {};
		class copShowLicense{};
		class copLicenseShown {};
		class removeMaskdrop {};
	};
	
	class Housing
 	{
 		file = "core\housing";
 		class buyHouse {};
 		class getBuildingPositions {};
 		class houseMenu {};
 		class lightHouse {};
 		class lightHouseAction {};
 		class sellHouse {};
 		class initHouses {};
 		class copBreakDoor {};
 		class raidHouse {};
 		class lockupHouse {};
 		class copHouseOwner {};
		class lockHouse {};
 	};
	
	class Config
	{
		file = "core\config";
		class copDefault {};
		class eatFood {};
		class itemWeight {};
		class licensePrice {};
		class licenseType {};
		class shopMenus {};
		class taxRate{};
		class varHandle {};
		class varToStr {};
		class vehicleAnimate {};
		class vehicleColorCfg {};
		class vehicleColorStr {};
		class vehicleListCfg {};
		class vehicleWeightCfg {};
		class vehShopLicenses {};
		class virt_shops {};
		class weaponShopCfg {};
		class updateClothing {};
		class houseConfig {};
		
		//Clothing Store Configs
		class clothing_cop {};
		class clothing_bruce {};
		class clothing_ems {};
		class clothing_adac {};
		class clothing_reb {};
		class clothing_dive {};
		class clothing_kart {};
	};

	class Player_Menu
	{
		file = "core\pmenu";
		class wantedList {};
		class wantedInfo {};
		class wantedMenu {};
		class wantedAddP {};
		class pardon {};
		class giveItem {};
		class giveMoney {};
		class p_openMenu {};
		class p_updateMenu {};
		class removeItem {};
		class useItem {};
		class cellphone {};
		class keyMenu {};
		class keyGive {};
		class keyDrop {};
		class s_onSliderChange {};
		class updateViewDistance {};
		class settingsMenu {};
		class settingsInit {};
		class ANN {};
		class smartphone {};
		class newMsg {};
		class showMsg {};
		class p_prisionbreak {};
	};
	
	class Functions
	{
		file = "core\functions";
		class accType {};
		class actionKeyHandler {};
		class animSync {};
		class calWeightDiff {};
		class clearVehicleAmmo {};
		class dropItems{};
		class escInterupt {};
		class fetchCfgDetails {};
		class fetchDeadGear{};
		class fetchGear {};
		class fetchVehInfo{};
		class giveDiff {};
		class globalSound {};
		class globalSoundClient {};
		class handleDamage {};
		class handleInv {};
		class handleItem {};
		class hudSetup {};
		class hudUpdate {};
		class inString {};
		class isnumeric {};
		class keyHandler {};
		class loadDeadGear {};
		class mouseHandler {};
		class nearUnits {};
		class numberText {};
		class onFired {};
		class onPlayerDisconnect {};
		class onTakeItem {};
		class playerCount {};
		class playerTags {};
		class pullOutVeh {};
		class pushObject {};
		class random {};
		class randomRound {};
		class receiveItem {};
		class receiveMoney {};
		class secondsToString {};
		class setUniform {};
		class simDisable {};
		class tazeSound {};
		class callCellPhone {};
		class revealObjects {};
		class nearestDoor {};
 		class inventoryClosed {};
 		class inventoryOpened {};
 		class isUIDActive {};
		class stripDownPlayer {};
		class SVOpener {};
		class SOpener {};
		class maskdrop {};
		class prisionbreak {};
		class progressBaren {};
	};
	
	class Network
	{
		file = "core\functions\network";
		class broadcast {};
		class MP {};
		class MPexec {};
		class netSetVar {};
		class corpse {};
		class jumpFnc {};
		class soundDevice {};
		class setFuel {};
		class setTexture {};
		class say3D {};
	};
	
	class Civilian
	{
		file = "core\civilian";
		class civFetchGear {};
		class civLoadGear {};
		class jail {};
		class jailMe {};
		class knockedOut {};
		class knockoutAction {};
		class pInteraction_reb {};
		class removeLicenses {};
		class removeWeapons {};
		class robPerson {};
		class robReceive {};
		class tazed {};
		class demoChargeTimer {};
		class civLoadout {};
		class handleDowned {};
	};
	
	class Vehicle
	{
		file = "core\vehicle";
		class colorVehicle {};
		class openInventory {};
		class lockVehicle {};
		class vehicleOwners {};
		class vehStoreItem {};
		class vehTakeItem {};
		class vehInventory {};
		class vInteractionMenu {};
		class vehicleWeight {};
		class deviceMine {};
		class addVehicle2Chain {};
	};
	
	class Cop
	{
		file = "core\cop";
		class arrestDialog_Arrest {};
		class bountyReceive {};
		class copInteractionMenu {};
		class entzugInteractionMenu {};
		class copLights {};
		class copMarkers {};
		class copSearch {};
		class copSiren {};
		class copSiren2 {};
		class licenseCheck {};
		class licensesRead {};
		class loadGear {};
		class saveGear {};
		class questionDealer {};
		class radar {};
		class radarext {};
		class restrain {};
		class searchClient {};
		class showArrestDialog {};
		class sirenLights {};
		class spikeStripEffect {};
		class ticketGive {};
		class ticketPay {};
		class ticketPrompt {};
		class vehInvSearch {};
		class seizeObjects {};
		class repairDoor {};
		class doorAnimate {};
		class fedCamDisplay {};
		class ticketPaid {};
		class wantedGrab {};
	};
	
	class Gangs
	{
		file = "core\gangs";
		class initGang {};
		class createGang {};
		class gangCreated {};
		class gangMenu {};
		class gangKick {};
		class gangLeave {};
		class gangNewLeader {};
		class gangUpgrade {};
		class gangInvitePlayer {};
		class gangInvite {};
		class gangDisband {};
		class gangDisbanded {};
		class gangMarkers {};
	};
	
	class Shops
	{
		file = "core\shops";
		class atmMenu {};
		class buyClothes {};
		class changeClothes {};
		class clothingMenu {};
		class clothingFilter {};
		class vehicleShopMenu {};
		class vehicleShopLBChange {};
		class vehicleShopBuy {};
		class weaponShopFilter {};
		class weaponShopMenu {};
		class weaponShopSelection {};
		class weaponShopBuySell {};
		class virt_buy {};
		class virt_menu {};
		class virt_update {};
		class virt_sell {};
		class chopShopMenu {};
		class chopShopSelection {};
		class chopShopSell {};
	};
	
	class Items
	{
		file = "core\items";
		class cocaine {};
		class heroine {};
		class jerryRefuel {};
		class lockpick {};
		class pickaxeUse {};
		class weed {};
		class flashbang {};
		class spikeStrip {};
		class warnung {};
		class sperre {};
		class boltcutter {};
		class blastingCharge {};
		class defuseKit {};
		class storageBox {};
		class pille {};
	};
	
	class Dialog_Controls
	{
		file = "dialog\function";
		class setMapPosition {};
		class displayHandler {};
		class spawnConfirm {};
		class spawnMenu {};
		class spawnPointCfg {};
		class spawnPointSelected {};
		class progressBar {};
		class impoundMenu {};
		class unimpound {};
		class repair {};
		class sellGarage {};
		class bankDeposit {};
		class bankWithdraw {};
		class bankTransfer {};
		class garageLBChange {};
		class safeInventory {};
		class safeOpen {};
		class safeTake {};
		class safeFix {};
		class vehicleGarage {};
		class gangDeposit {};
		class calldialog {};
		class sendChannel {};
	};
	
	class Market
	{
		file = "core\market";
		
		class openMarketView;
		class refreshMarketView;
		class marketShortView;
		class marketBuy;
		class marketSell;
		class marketGetBuyPrice;
		class marketGetSellPrice;
		class marketGetRow;
		class marketGetPriceRow;
		class marketSetPriceRow;
		
		class marketconfiguration;
		class marketReset;
		class marketChange;
	};	
	
	class eigen
	{
		file = "eigen";
		class cleanStation {};
		class tankchanger {};
		class useStation {};
	};
	
	class loadouts
	{
		file = "eigen\loadouts";
		class mxmloadout {};
		class mxswloadout {};
		class mk18loadout {};
		class mxcloadout {};
		class mxloadout {};
		class taserrloadout {};
		class taserloadout {};
		
	};
	
	/*class Special
	{
		file = "core\special";
		class openEmpMenu {};
		class isEmpOperator {};
		class scanVehicles {};
		class warnVehicle {};
		class empVehicle {};
		class vehicleWarned {};
		class vehicleEmpd {};
	};*/
	
	class anstrich
	{
		file = "core\repaint";
		class RepaintMenu {};
		class Repaintcolor {};
		class RepaintVehicle {};
	};
	
	class Entzug
    {
        file = "core\entnehmen";
        class scheinBEntzug {};
        class scheinBEntzugNow {};
		class scheinCEntzug {};
        class scheinCEntzugNow {};
		class scheinPermEntzug {};
        class scheinPermEntzugNow {};
		class scheinWaffenEntzug {};
        class scheinWaffenEntzugNow {};
    };
};
