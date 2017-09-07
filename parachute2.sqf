/*
Author: TrZ
Steam Account: http://steamcommunity.com/profiles/76561198134897103
*/

///////////////////////////////////////////////////////////////////
/////////////////////////// CHANGE THIS ///////////////////////////
///////////////////////////////////////////////////////////////////
if (isNil "allReadyInUse") then {
    allReadyInUse = false;
    publicVariable "allReadyInUse";
};
_lifeEnable = false;

_eName = "COMPANY NAME"; /* COMPANY NAME */
_ePrice = 666; /* PRICE TO FLY */
_eLocation = "Kavala"; /* LOCATION OF THE ACTIVITY */
_hight = 500; /* HIGHT OF JUMP MIN = 500*/

if (_lifeEnable isEqualTo true) then {
    _eMoney = life_cash;
};

///////////////////////////////////////////////////////////////////
//////////////////////// DON'T CHANGE THIS ////////////////////////
///////////////////////////////////////////////////////////////////

if (side player isEqualTo west) exitWith {hint "Tu est gendarme tu ne peut pas faire cette excélente activitée !";};
if (side player isEqualTo east) exitWith {hint "Tu est médecin tu ne peut pas faire cette excélente activitée !";};
if (_hight < 250) exitWith {hint "Préviens ton staff que la variable _hight est inférieure à 250 ! AH LE CON !";};
if (allReadyInUse isEqualTo true) exitWith {hint "Une personne fait déjà du parachute!";};
if (_lifeEnable isEqualTo true) then {
    if (_eMoney < _ePrice) exitWith {hint "Tu n'a pas assez d'argent sur toi!";};
    life_cash = _eMoney - _ePrice;
};

_sArray = [uniform player,vest player,backpack player,headgear player,weapons player,primaryWeaponItems player,handgunItems player,items player,magazines player,goggles player];

allReadyInUse = true;

cutText ["","BLACK OUT",0.25];

uisleep 1;

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

uisleep 1;

_drop = createVehicle ["B_Heli_Light_01_F", [0,0,500], [], 0, "FLY"];
_pilot = createAgent ["O_helicrew_F", [0,0,500], [], 0, "NONE"];
_pilot moveInDriver _drop;
_pilot disableAI "ALL";
_drop setPos  [getPos player select 0, getPos player select 1, (getPos player select 2) +_hight];
_drop enableSimulation true;
_drop allowDamage false;
player moveInCargo [_drop,2];

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

cutText ["","BLACK IN",0.25];

uisleep 20;

if (vehicle _drop != _drop) then {
    player leaveVehicle _drop;
    player action ["Eject", vehicle player];
    hint "Et bah alors ? Monsieur à peur de sauter ?";
    uisleep 5;
};

waitUntil {isTouchingGround player};

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

hint parseText (format["
    <t size='2' color='#2E9AFE'> %1 </t><br />
    <t size='1'> Prix : %2 </t><br />
    <br />
    <br />
    <t>Merci d'avoir utiliser le saut en parachute de %3</t><br />
    <t>A très bientôt !</t>
", _eName,_ePrice,_eLocation]);

deleteVehicle _drop;
deleteVehicle _pilot;
allReadyInUse = false;