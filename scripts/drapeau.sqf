/*
Author: TrZ
Description: Capture de drapeau
*/

//Error check
if (playerSide isEqualTo independent) exitWith {hint "Tu est médecin!"};

//Variable définition
_time = 15;
_payeTime = 15; // Le delaie de paye en minutes
_payePrice = 25000; // La paye recue
_estcapturee = false;

if (playerSide isEqualTo civilian) then {

};