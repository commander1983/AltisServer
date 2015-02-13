/*
	File: fn_removeLicenses.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Used for stripping certain licenses off of civilians as punishment.
*/
private["_state"];
_state = [_this,0,1,[0]] call BIS_fnc_param;

switch (_state) do
{
	//Death while being wanted
	case 0:
	{
		if(!license_civ_permanent) then
		{
			if(license_civ_driver || license_civ_truck) then {
				license_civ_driver = false;
				license_civ_truck = false;
			};
		} else {
			hint "Du hast einen Permanenten Führerschein.";
		};
	};
	
	//Jail licenses
	case 1:
	{
		license_civ_rebel = false;
	};
	
	//Remove motor vehicle licenses
	case 2:
	{
		if(!license_civ_permanent) then
		{
			if(license_civ_driver || license_civ_truck) then {
				license_civ_driver = false;
				license_civ_truck = false;
				hint localize "STR_Civ_LicenseRemove_1";
			};
		} else {
			hint "Du hast einen Permanenten Führerschein.";
		};
	};
	
	//Killing someone while owning a gun license
	case 3:
	{
		if(license_civ_gun) then {
			license_civ_gun = false;
			hint localize "STR_Civ_LicenseRemove_2";
		};
	};
	
	case 4:
    {
        if(license_civ_driver) then {
            license_civ_driver = false;
            hint parseText format ["<t size='1.3'>Dir wurde dein Führerschein-B entzogen.</t>"];
        };
    };
	
	case 5:
    {
        if(license_civ_truck) then {
            license_civ_truck = false;
            hint parseText format ["<t size='1.3'>Dir wurde dein Führerschein-C entzogen.</t>"];
        };
    };
	
	case 6:
    {
        if(license_civ_permanent) then {
            license_civ_permanent = false;
            hint parseText format ["<t size='1.3'>Dir wurde dein Permanenten-Führerschein entzogen.</t>"];
        };
    };
	
	case 7:
    {
        if(license_civ_gun) then {
            license_civ_gun = false;
            hint parseText format ["<t size='1.3'>Dir wurde dein Waffenschein entzogen.</t>"];
        };
    };
};