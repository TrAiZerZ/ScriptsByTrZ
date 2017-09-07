/*
Author: TrZ
Steam Account: http://steamcommunity.com/profiles/76561198134897103
*/
SkipTime 12;
_nightClub = getMarkerPos "night_club";
maxDistance = 50;

while {player distance _nightClub < maxDistance} do
{
	if (isNil "ready") then {
		ready = true;
		publicVariable "ready";
		trackList = selectRandom ["a","b","c"];
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
		platine say3D [trackList, maxDistance + 100];
		musicTime = 623;
	};

	if (trackList isEqualTo "b") then {
		platine say3D [trackList, maxDistance + 100];
		musicTime = 403;
	};

	if (trackList isEqualTo "c") then {
		platine say3D [trackList, maxDistance + 100];
		musicTime = 332;
	};

	refreshTimeTotal = 0.15;
	refreshTimeCut = refreshTimeTotal / 8;

	while {musicTime >= 1} do {
		musicTime = musicTime - refreshTimeCut;
		lightBlue setLightBrightness 0.6;
		uisleep refreshTimeCut;
		lightBlue setLightBrightness 0.05;
		uisleep refreshTimeCut;
		lightGreen setLightBrightness 0.6;
		uisleep refreshTimeCut;
		lightGreen setLightBrightness 0.05;
		uisleep refreshTimeCut;
		lightRed setLightBrightness 0.6;
		uisleep refreshTimeCut;
		lightRed setLightBrightness 0.05;
		uisleep refreshTimeCut;
		lightYellow setLightBrightness 0.6;
		uisleep refreshTimeCut;
		lightYellow setLightBrightness 0.05;
		uisleep refreshTimeCut;
	};
};