/*

TrZ pour LibertyLife

this addAction["spawn", { if (alive player) then { execVM "scripts\buyWheel.sqf"; };  spawn_point_wheel = "roue_spawn_1";},"",0,false,false,"",'player distance _target < 4 '];

*/

_argent = life_cash;
_prix = 5000;
_manquant = _prix - _argent;
_active = true;

if (_argent < _prix) exitWith {hint format ["Il te manque %1 euro", _manquant];};

if (_active isEqualTo true) then
{
	_argent = life_cash - _prix;
	_wheel = "Land_Chapel_Small_V1_ruins_F" createVehicle getMarkerPos spawn_point_wheel;
	hint "Ta roue est apparue!";
};