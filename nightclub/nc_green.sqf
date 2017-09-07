_uisleepRand = [0.1,0.2,0.3,0.4];
_minBright = [0.05,0.1,0.08,0.07];
_maxBright = [0.5,0.6,0.7,0.8,0.9,1];

selectRandom _minBright;

while {activeNightClub isEqualTo true} do
{
	if (activeNightClub isEqualTo false) exitWith {};
	if (isNil "activeNightClub") exitWith {};

	uisleep selectRandom _uisleepRand;
	lightGreen setLightBrightness selectRandom _minBright;
	uisleep selectRandom _uisleepRand;
	lightGreen setLightBrightness selectRandom _maxBright;
	uisleep selectRandom _uisleepRand;
	lightGreen setLightBrightness selectRandom _minBright;
	uisleep selectRandom _uisleepRand;
	lightGreen setLightBrightness selectRandom _maxBright;
	uisleep selectRandom _uisleepRand;
	lightGreen setLightBrightness selectRandom _minBright;
	uisleep selectRandom _uisleepRand;
	lightGreen setLightBrightness selectRandom _maxBright;
	uisleep selectRandom _uisleepRand;
	lightGreen setLightBrightness selectRandom _minBright;
	uisleep selectRandom _uisleepRand;
	lightGreen setLightBrightness selectRandom _minBright;
	uisleep selectRandom _uisleepRand;
	lightGreen setLightBrightness selectRandom _maxBright;
	uisleep selectRandom _uisleepRand;
	lightGreen setLightBrightness selectRandom _minBright;

};