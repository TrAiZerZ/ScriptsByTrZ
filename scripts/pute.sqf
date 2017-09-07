/*
Authors: Alésio & TrZ
Description: Rajoute des putes
Commande dans le panneau: this addAction ["Aller aux putes", "scripts\pute.sqf","",0,false,false,"",' isNull objectParent player && player distance _target < 4 '];
*/

//_price = 5000;
//_argent = life_cash;
//if ( _argent < _price) exitWith {hint "Tu n'a pas %1",_price;};

_use = false;
if (_use isEqualTo true) exitWith {hint "La pute est occupée";};
if (playerSide isEqualTo WEST) exitWith {hint "Tu est flic! Ta mère est déjà une pute!";};
if (playerSide isEqualTo independent) exitWith {hint "Tu est medic! Ta mère est déjà une pute!";};

Tenue_Pd = uniform player;

if (playerSide isEqualTo civilian) then {

	//life_cash = _argent - _price;

	_use = true;
	cutText ["","BLACK OUT",0.25];
	uisleep 3;
	removeUniform player;
	_pos = player getPos [1,1];

	_msn_pute = createVehicle ["Land_i_House_Small_01_V2_F", [20815.295,9382.282,0], [], 0, "NONE"];
	_msn_pute enableSimulation false;
	_msn_pute allowDamage false;

	_aht = player;
	_aht setPos [20813.719,9379.521,0.175];

	cutText ["","BLACK IN",0.25];
	uisleep 3;

	playSound "AMUSE";
		[] spawn
		{
			_sound = ASLToAGL [0,0,0] nearestObject "player";
			waitUntil {isNull _sound};
		};
	uisleep 5;

	cutText ["","BLACK OUT",0.25];
	playSound "JUL";
		[] spawn
		{
			_sound = ASLToAGL [0,0,0] nearestObject "player";
			waitUntil {isNull _sound};
		};

	uisleep 3;

	player setDamage 0.50;
	player AddUniform Tenue_Pd;

	"chromaberration" ppEffectEnable true;
	"WetDistortion" ppEffectEnable true;
	"radialblur" ppEffectEnable true;

	"chromaberration" ppEffectAdjust [random 0.25, random 0.25, true];
	"chromaberration" ppEffectCommit 1;
	"WetDistortion" ppEffectAdjust [0.5, 0.2, 0.2, 3.5, 2.5, 1.25, 1, 0.0054, 0.0041, 0.0090, 0.0070, 0.6, 0.2, 20.0, 12.0];
	"WetDistortion" ppEffectCommit 1;
	"radialblur" ppEffectAdjust [random 0.02, random 0.02, 0.15, 0.15];
	"radialblur" ppEffectCommit 1;

	setCamShakeParams [0.5, 1, 1, 1, true];
	addCamShake [10, 35, 0.1];


	uisleep 3;
	cutText ["","BLACK IN",0.25];

	uisleep 3;
	cutText ["","BLACK OUT",0.25];

	uisleep 3;
	_aht setPos _pos;
	deleteVehicle _msn_pute;
	"chromaberration" ppEffectEnable false;
	"WetDistortion" ppEffectEnable false;
	"radialblur" ppEffectEnable false;
	setCamShakeParams [0.1, 1, 1, 1, true];
	player setAnimSpeedCoef 1.15;
	player enableFatigue false;
	player setUnitRecoilCoefficient 0.7;
	player setCustomAimCoef 0.7;
	cutText ["","BLACK IN",0.25];
	_use = false;
	uisleep 25;
	player setAnimSpeedCoef 1;
	player enableFatigue true;
	player setUnitRecoilCoefficient 1;
	player setCustomAimCoef 1;
};