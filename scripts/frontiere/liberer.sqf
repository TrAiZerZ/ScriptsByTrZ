/*
Author: TrZ
Description: Capture de drapeau

this addAction["Prise Frontière","scripts\frontiere\liberer.sqf","",0,false,false,"",'playerSide == WEST'];

*/

if (playerSide isEqualTo independent) exitWith {hint "Tu ne peut pas faire ceci!"};
if (playerSide isEqualTo civilian) exitWith {hint "Tu ne peut pas faire ceci!"};

_time = 15;
_payeTime = 15; // Le delaie de paye en minutes
_payePrice = 25000; // La paye recue
iscapture = false;

if (playerSide isEqualTo WEST) then {

};