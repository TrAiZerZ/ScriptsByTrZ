/*
Author: TrZ
Steam Account: http://steamcommunity.com/profiles/76561198134897103
*/

_toggleCheck = false;

if (_toggleCheck isEqualTo true) then {
	_eScript = false;

	while {_eScript isEqualTo false} do
	{
		/* CHANGE THE _requiredPlayers BY NUMBER OF YOU WANT */
		_requiredPlayers = 1;
		/* DONT CHANGE AFTER */
		_aPlayers = count allPlayers;
		if (_aPlayers >= _requiredPlayers) then
		{
			_eScript = true;
		};
		uisleep 30;
	};
};

/* REPLACE "ctf_rand_1", "ctf_rand_2", "ctf_rand_3" BY YOUR */
_pos = (getMarkerPos (selectRandom ["ctf_rand_1", "ctf_rand_2", "ctf_rand_3"]));

/* SIZE OF THE MARKER */
_radius = 1.5;

/* NAME OF YOUR SERVER */
[{_sName = "SERVER NAME";

/* CREATE MARKER */
hint parseText (format["
    <t size='2' color='#2E9AFE'> %1 </t><br />
    <t size='1'> Capture de Drapeau </t><br />
    <br />
    <br />
    <t>Un drapeau est apparus sur la carte, allez le catpurer pour gagner de l'argent !</t><br />
    <t>Bonne chance !</t>", _sName]);},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
ctFlag = createMarker ["ctflag_mrk",_pos];
publicVariable "ctFlag";
ctFlag setMarkerColor "ColorYellow";
ctFlag setMarkerSize [_radius, _radius];
ctFlag setMarkerType "mil_flag";
ctFlag setMarkerText "Cature de drapeau";

/* CREATE FLAG */
flagDr = "Flag_AAF_F" createVehicle getMarkerPos ctFlag;
publicVariable "flagDr";
flagDr allowDammage false;
flagDr addAction ["Capturer", "scripts\ctfCapture.sqf","",0,false,false,"",'playerSide == civilian'];