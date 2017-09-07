/*
Author: TrZ
Steam Account: http://steamcommunity.com/profiles/76561198134897103
*/

///////////////////////////////////////////////////////////////////
/////////////////////////// CHANGE THIS ///////////////////////////
///////////////////////////////////////////////////////////////////

_lifeEnable = false;

_eName = "COMPANY NAME"; /* COMPANY NAME */
_ePrice = 666; /* PRICE TO FLY */
_eLocation = "Kavala"; /* LOCATION OF THE ACTIVITY */
_hight = 1500; /* HIGHT OF JUMP */

if (_lifeEnable isEqualTo true) then {
    _eMoney = life_cash;
};

///////////////////////////////////////////////////////////////////
//////////////////////// DON'T CHANGE THIS ////////////////////////
///////////////////////////////////////////////////////////////////

if (side player isEqualTo west) exitWith {hint "Tu est gendarme tu ne peut pas faire cette excélente activitée !";};
if (side player isEqualTo east) exitWith {hint "Tu est médecin tu ne peut pas faire cette excélente activitée !";};
if (_lifeEnable isEqualTo true) then {
    if (_eMoney < _ePrice) exitWith {hint "Tu n'a pas assez d'argent sur toi!";};
    life_cash = _eMoney - _ePrice;
};

_uP = uniform player;
_vP = vest player;
_bP = backpack player;

_hP = headgear player;
_wP = weapons player;
_pwP = primaryWeaponItems player;
_hgiP = handgunItems player;

_iP = items player;
_mP = magazines player;
_gP = goggles player;

_sArray = [_uP,_vP,_bP,_hP,_wP,_pwP,_hgiP,_iP,_mP,_gP];

_stuff = false;

cutText ["","BLACK OUT",0.25];

uisleep 2;

disableUserInput true;

removeAllWeapons player;

removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

player addUniform "U_I_HeliPilotCoveralls";
player addVest "V_DeckCrew_brown_F";
player addBackpack "B_Parachute";
player addHeadgear "H_PilotHelmetFighter_I";
player allowDamage false;


uisleep 5;
disableUserInput false;

player setPos [getPos player select 0, getPos player select 1, (getPos player select 2) +_hight];

cutText ["","BLACK IN",0.25];

while {_stuff isEqualTo false} do
{
    if (isTouchingGround player) then {

        _a = _sArray select 0;
        _b = _sArray select 1;
        _c = _sArray select 2;
        _d = _sArray select 3;
        _e = _sArray select 4;
        _f = _sArray select 5;
        _g = _sArray select 6;
        _h = _sArray select 7;
        _i = _sArray select 8;
        _j = _sArray select 9;

        removeUniform player;
        removeVest player;
        removeBackpack player;
        removeHeadgear player;

        player addBackpack _c;
        {player addWeapon _x}forEach _e;
        player addVest _b;
        player forceadduniform _a;
        {player addMagazine _x}forEach _i;
        {player addItem _x}forEach _h;
        {
            if(_x != "" )then{
            player addPrimaryWeaponItem _x
            };
        }forEach _f;
        {
            if(_x != "" )then{
            player addHandgunItem _x
            };
        }forEach _g;
        player addheadgear _d;
        player addgoggles _j;
        player setVehicleAmmo 1;
        player selectWeapon primaryWeapon player;
        reload player;

        player allowDamage true;

        _stuff = true;
    };
};

hint parseText (format["
    <t size='2' color='#2E9AFE'> %1 </t><br />
    <t size='1'> Prix : %2 </t><br />
    <br />
    <br />
    <t>Merci d'avoir utiliser le saut en parachute de %3</t><br />
    <t>A très bientôt !</t>
", _eName,_ePrice,_eLocation]);