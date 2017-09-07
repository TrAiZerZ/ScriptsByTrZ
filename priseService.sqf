/*
Author: TrZ - Pour PlayLife || http://www.playnofftgaming.com/
*/

if (side player isEqualTo BLUFOR) exitWith {hint "Tu est déjà gendarme!"};
if (side player isEqualTo WEST) exitWith {hint "Tu est déjà gendarme!"};
if (group player isEqualTo "Gendarme") exitWith {hint "Tu est déjà gendarme!"};
if (group player isEqualTo west) exitWith {hint "Tu est déjà gendarme!"};

//if((FETCH_CONST(life_coplevel) isEqualTo 0) && (FETCH_CONST(life_adminlevel) isEqualTo 0)) exitWith {hint "Tu n'est pas whitelist";};

if (isNil "groupExist") then {
	groupExist = true;
	publicVariable "groupExist";
	cop = createGroup [west, true];
	cop setGroupId ["Gendarme"];
};

_unit = player;
[_unit] joinSilent cop;
[[["%1 a pris son service!"], {hint format[(_this select 0), name player];}], "BIS_fnc_spawn", true, false, false] call BIS_fnc_MP;

priseServiceFlag removeAction 0;