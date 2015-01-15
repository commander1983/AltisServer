/*
    File: fn_civFetchGear.sqf
    Author: Bryan "Tonic" Boardwine
    Full Gear/Y-Menu Save by Vampire
    
    Description:
    Saves the players gear for syncing to the database for persistence.
*/
private["_ret","_uItems","_bItems","_vItems","_pItems","_hItems","_yItems","_uMags","_vMags","_bMags","_pMag","_hMag","_uni","_ves","_bag","_handled"];
_ret = [];

_ret pushBack uniform player;
_ret pushBack vest player;
_ret pushBack backpack player;
_ret pushBack goggles player;
_ret pushBack headgear player;
_ret pushBack assignedItems player;
_ret pushBack primaryWeapon player;
_ret pushBack handGunWeapon player;

_uItems = [];
_uMags  = [];
_bItems = [];
_bMags  = [];
_vItems = [];
_vMags  = [];
_pItems = [];
_hItems = [];
_yItems = [];

if(uniform player != "") then
{
    {
        if (_x in (magazines player)) then {
            _uMags = _uMags + [_x];
        } else {
            _uItems = _uItems + [_x];
        };
    } forEach (uniformItems player);
};

if(backpack player != "") then
{
    {
        if (_x in (magazines player)) then {
            _bMags = _bMags + [_x];
        } else {
            _bItems = _bItems + [_x];
        };
    } forEach (backpackItems player);
};

if(vest player != "") then
{
    {
        if (_x in (magazines player)) then {
            _vMags = _vMags + [_x];
        } else {
            _vItems = _vItems + [_x];
        };
    } forEach (vestItems player);
};

if (count (primaryWeaponMagazine player) > 0 ) then
{
    _pMag = ((primaryWeaponMagazine player) select 0);
    if (_pMag != "") then
    {
        _uni = player canAddItemToUniform _pMag;
        _ves = player canAddItemToVest _pMag;
        _bag = player canAddItemToBackpack _pMag;
        _handled = false;
        if (_ves) then
        {
            _vMags = _vMags + [_pMag];
            _handled = true;
        };
        if (_uni AND !_handled) then
        {
            _uMags = _uMags + [_pMag];
            _handled = true;
        };
        if (_bag AND !_handled) then
        {
            _bMags = _bMags + [_pMag];
            _handled = true;
        };
    };
};

if (count (handgunMagazine player) > 0 ) then
{
    _hMag = ((handgunMagazine player) select 0);
    if (_hMag != "") then
    {
        _uni = player canAddItemToUniform _hMag;
        _ves = player canAddItemToVest _hMag;
        _bag = player canAddItemToBackpack _hMag;
        _handled = false;
        if (_ves) then
        {
            _vMags = _vMags + [_hMag];
            _handled = true;
        };
        if (_uni AND !_handled) then
        {
            _uMags = _uMags + [_hMag];
            _handled = true;
        };
        if (_bag AND !_handled) then
        {
            _bMags = _bMags + [_hMag];
            _handled = true;
        };
    };
};

if(count (primaryWeaponItems player) > 0) then
{
    {
        _pItems = _pItems + [_x];
    } forEach (primaryWeaponItems player);
};

if(count (handGunItems player) > 0) then
{
    {
        _hItems = _hItems + [_x];
    } forEach (handGunItems player);
};

{
    _name = (_x select 0);
    _val = (_x select 1);
    if (_val > 0) then {
        for "_i" from 1 to _val do {
            _yItems = _yItems + [_name];
        };
    };
} forEach [
    ["life_inv_rabbit",life_inv_rabbit],["life_inv_water",life_inv_water],["life_inv_coffee",life_inv_coffee],
	["life_inv_fuelF",life_inv_fuelF],["life_inv_tbacon",life_inv_tbacon],["life_inv_redgull",life_inv_redgull],
	["life_inv_battery",life_inv_battery],["life_inv_sperre",life_inv_sperre],["life_inv_warnung",life_inv_warnung],
	["life_inv_donuts",life_inv_donuts],["life_inv_officerlockpick",life_inv_officerlockpick],["life_inv_lockpick",life_inv_lockpick]
];

_ret pushBack _uItems;
_ret pushBack _uMags;
_ret pushBack _bItems;
_ret pushBack _bMags;
_ret pushBack _vItems;
_ret pushBack _vMags;
_ret pushBack _pItems;
_ret pushBack _hItems;
_ret pushBack _yItems;

adac_gear = _ret;