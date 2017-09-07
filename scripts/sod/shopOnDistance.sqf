/*
Author: TrZ - Pour PlayLife || http://www.playnofftgaming.com/
*/
posSell = getMarkerPos "vendeur1";
publicVariable "posSell";
_minDistance = 5;

while {true} do
{
	if (player distance posSell < _minDistance) then
	{
		_couvreChef = selectRandom ["H_Bandanna_blu", "H_Bandanna_sgg", "H_Watchcap_blk", "H_Cap_oli_hs", "H_Hat_tan"];
		_uniform= selectRandom ["U_C_HunterBody_grn", "U_C_Poloshirt_burgundy", "U_C_Poloshirt_stripped", "U_C_Poloshirt_tricolour", "U_BG_Guerilla3_1", "U_OrestesBody", "U_C_Man_casual_6_F", "U_C_man_sport_1_F"];
		_sac = selectRandom ["B_Kitbag_rgr_Exp", "B_TacticalPack_ocamo", "B_Carryall_cbr", "B_FieldPack_oli", "B_AssaultPack_blk", "B_Carryall_oucamo"];

		seller = "C_man_polo_1_F" createVehicleLocal posSell;
		seller allowDamage false;
		seller addAction ["bite", "scripts\sod\bite.sqf","",0,false,false,"",' isNull objectParent player && player distance _target < 4 '];
		seller enableSimulation false;
		removeHeadgear seller;
		removeUniform seller;
		removeBackpack seller;
		seller addHeadgear _couvreChef;
		seller addUniform _uniform;
		seller addBackpack _sac;
		seller switchMove "AmovPercMstpSnonWnonDnon";
		seller playMove "AmovPercMstpSnonWnonDnon";
		seller playMoveNow "AmovPercMstpSnonWnonDnon";

		_soundPlay = false;

		while {_soundPlay isEqualTo false;} do
		{
			seller say3D "JUL";
			_soundPlay = true;
		};

		waitUntil {player distance posSell >= 5};
		deleteVehicle seller;
	};
};