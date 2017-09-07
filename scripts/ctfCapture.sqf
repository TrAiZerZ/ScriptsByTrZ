/*
Author: TrZ
Steam Account: http://steamcommunity.com/profiles/76561198134897103
*/

publicVariable "flagTaken";
_captureSeconds = 3;

while {_captureSeconds > 1} do
{
	player disableAI "MOVE";
	if (_captureSeconds >= 2) then {
		hint format ["Il te reste %1 secondes pour capturer le drapeau",_captureSeconds];
	};
	_captureSeconds = _captureSeconds - 1;
	player switchMove "AmovPcrhMstpSrasWpstDnon_AadjPcrhMstpSrasWpstDup";
	player playMove "AmovPcrhMstpSrasWpstDnon_AadjPcrhMstpSrasWpstDup";
	player playMoveNow "AmovPcrhMstpSrasWpstDnon_AadjPcrhMstpSrasWpstDup";

	uisleep 1;
};

hint "Il te reste 1 seconde pour capturer le drapeau";

player switchMove "AmovPcrhMstpSrasWpstDnon_AadjPcrhMstpSrasWpstDup";
player playMove "AmovPcrhMstpSrasWpstDnon_AadjPcrhMstpSrasWpstDup";
player playMoveNow "AmovPcrhMstpSrasWpstDnon_AadjPcrhMstpSrasWpstDup";

uisleep 1;

player enableAI "MOVE";

flagDr removeAction 0;

_nameP = name player;
ctFlag setMarkerColor "ColorRed";
ctFlag setMarkerText format ["Drapeau capturé par %1",_nameP];

_winWeapon = selectRandom ["srifle_DMR_01_F","MMG_02_black_F"];
lot = "GroundWeaponHolder" createVehicle getPos player;
lot addWeaponCargo [_winWeapon,1];
lot setPos [getPos player select 0,getPos player select 1,0.01];
if (_winWeapon isEqualTo "srifle_DMR_01_F") then
{
	hint "Bravo ! Pour te féliciter d'avoir capturer le drapeau tu gagne une Rahim !";
	lot = "GroundWeaponHolder" createVehicle getPos player;
	lot addMagazineCargo  ["10Rnd_762x54_Mag",5];
	lot setPos [getPos player select 0,getPos player select 1,0.01];
};

