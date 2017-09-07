/*
Author: TrZ
Description: Capture de drapeau
Fichier: capturer.sqf

this addAction["Prise Frontière","scripts\frontiere\capturer.sqf","",0,false,false,"",'playerSide == civilian'];


*/

if (playerSide isEqualTo independent) exitWith {hint "Tu ne peut pas faire ceci!"};
if (playerSide isEqualTo WEST) exitWith {hint "Tu ne peut pas faire ceci!"};
//_cops = (west countSide playableUnits);
//if(_cops < 5) exitWith {hint "Il n'y a pas 5 policiers de connectés!"};

_time = 60;
_payeTime = 15;
_payePrice = 25000;
_gang = group player;
iscapture = false;
_nbrGang = count units group player;
_error = false;

if (playerSide isEqualTo civilian) then {

	"douane_drp" setMarkerText "La douane est en train d'être capturée par des rebelles.";
	"douane_drp" setMarkerType "mil_arrow2";
	"douane_drp" setMarkerColor "ColorRed";
	"douane_drp" setMarkerSize [1.5,1.5];

	while {(_time > 6) && (player distance drapeau < 50)} do
	{
		_time = _time - 5;
		hint format ["Tu est en trains de capturer la douane, il te reste %1 secondes!", _time];
		uisleep 5;

		if (player distance drapeau > 50) exitWith {
			"douane_drp" setMarkerText "Douane";
			"douane_drp" setMarkerType "mil_dot";
			"douane_drp" setMarkerColor "ColorBlack";
			"douane_drp" setMarkerSize [1,1];
			hint "Tu est à plus de 50 mètres du drapeau!";
			_error = true;
		};

	};


	if (_error isEqualTo false) then {
		iscapture = true;

		"douane_drp" setMarkerText "La douane est capturée par les rebelles!";
		"douane_drp" setMarkerType "mil_warning";
		"douane_drp" setMarkerColor "ColorRed";
		"douane_drp" setMarkerSize [1.5,1.5];
	} else {
		iscapture = false;

		"douane_drp" setMarkerText "Douane";
		"douane_drp" setMarkerType "mil_dot";
		"douane_drp" setMarkerColor "ColorBlack";
		"douane_drp" setMarkerSize [1,1];
	};
};