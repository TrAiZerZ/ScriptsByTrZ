skipTime 12;
nightClubPos = getMarkerPos "night_club";
publicVariable "nightClubPos";
_minDistance = 500;

while {player distance nightClubPos < _minDistance} do {
	if (isNil "activeNightClub") then {
		activeNightClub = true;
		publicVariable "activeNightClub";
		trackList = selectRandom ["a","b","c"];
	};

	if (isNil "ready") then {
		ready = true;
	};

	if (ready isEqualTo true) then {
		_colorBlue = [0,0,1];
		_colorGreen = [0,1,0];
		_colorRed = [1,0,0];
		_colorYellow = [1,1,0];


		_posBlueLight = getPosATL nc_blue;
		_posGreenLight = getPosATL nc_green;
		_posRedLight = getPosATL nc_red;
		_posYellowLight = getPosATL nc_yellow;

		/* BLUE */
		lightBlue = "#lightpoint" createVehicleLocal _posBlueLight;
		publicVariable "lightBlue";
		lightBlue setLightBrightness 0.6;
		lightBlue setLightAmbient _colorBlue;
		lightBlue setLightColor _colorBlue;
		lightBlue lightAttachObject [nc_blue, [0,0,0]];

		/* GREEN */

		lightGreen = "#lightpoint" createVehicleLocal _posGreenLight;
		lightGreen setLightBrightness 0.6;
		lightGreen setLightAmbient _colorGreen;
		lightGreen setLightColor _colorGreen;
		lightGreen lightAttachObject [nc_green, [0,0,0]];

		/* RED */

		lightRed = "#lightpoint" createVehicleLocal _posRedLight;
		lightRed setLightBrightness 0.6;
		lightRed setLightAmbient _colorRed;
		lightRed setLightColor _colorRed;
		lightRed lightAttachObject [nc_red, [0,0,0]];

		/* YELLOW */

		lightYellow = "#lightpoint" createVehicleLocal _posYellowLight;
		lightYellow setLightBrightness 0.6;
		lightYellow setLightAmbient _colorYellow;
		lightYellow setLightColor _colorYellow;
		lightYellow lightAttachObject [nc_yellow, [0,0,0]];

		ready = false;
	};

	if (trackList isEqualTo "a") then {
		platine say3D [trackList, 250];
		musicTime = 623;
	};

	if (trackList isEqualTo "b") then {
		platine say3D [trackList, 250];
		musicTime = 403;
	};

	if (trackList isEqualTo "c") then {
		platine say3D [trackList, 250];
		musicTime = 332;
	};

	execVM "scripts\nightclub\nc_blue.sqf";
	execVM "scripts\nightclub\nc_green.sqf";
	execVM "scripts\nightclub\nc_red.sqf";
	execVM "scripts\nightclub\nc_yellow.sqf";

	enableCamShake true;
	setCamShakeParams [0.025, 0.025, 0.025, 0.025, true];
	addCamShake [3, 9000, 1];

	activeNightClub = true;
	while {musicTime >= 1} do {
		musicTime = musicTime - 1;
		uisleep 1;
	};
	activeNightClub = false;

	waitUntil {player distance nightClubPos >= _minDistance};

	enableCamShake false;
	activeNightClub = false;
};

enableCamShake false;
activeNightClub = false;