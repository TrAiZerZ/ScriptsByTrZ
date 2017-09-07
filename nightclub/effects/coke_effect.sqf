_unit = player;

_unit allowDamage false;
_oldPos = getPos _unit;
_time = 2;

_sArray = [uniform player,vest player,backpack player,headgear player,weapons player,primaryWeaponItems player,handgunItems player,items player,magazines player,goggles player];

cutText ["","BLACK OUT",_time];

uisleep _time;

removeAllWeapons player;

removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

player setPos [24027.004,5227.769,1108.780];

cutText ["","BLACK IN",_time];

uisleep 10;

cutText ["","BLACK OUT",_time];
uisleep _time;
player setPos [22383.049,8452.748,0.004];
cutText ["","BLACK IN",_time];
uisleep 10;

cutText ["","BLACK OUT",_time];

uisleep _time;
player setPos _oldPos;

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

cutText ["","BLACK IN",_time];