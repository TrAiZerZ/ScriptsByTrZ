/*
Author: TrZ
Steam Account: http://steamcommunity.com/profiles/76561198134897103
*/

_timeEffect = 120;

cutText ["TEQUILLA HEINKEN PAS LTEMPS DNIAISER", "BLACK OUT", 1];
uisleep 2.5;
cutText ["TEQUILLA HEINKEN PAS LTEMPS DNIAISER", "BLACK IN", 1];

player say3D "tequilaHeinken";

"ColorInversion" ppEffectEnable true;
"chromaberration" ppEffectEnable true;
"WetDistortion" ppEffectEnable true;
"radialblur" ppEffectEnable true;

"ColorInversion" ppEffectAdjust [0.2,0.4,1];
"ColorInversion" ppEffectCommit 1;

"chromaberration" ppEffectAdjust [random 0.5, random 0.1, true];
"chromaberration" ppEffectCommit 1;

"WetDistortion" ppEffectAdjust [0.1, 0.9, 0.4, 2, 1, 1, 3, 0.0054, 0.0041, 0.0090, 0.0070, 0.6, 0.2, 20.0, 12.0];
"WetDistortion" ppEffectCommit 1;

"radialblur" ppEffectAdjust [random 0.02, random 0.02, 0.15, 0.15];
"radialblur" ppEffectCommit 1;

enableCamShake true;
setCamShakeParams [0.1, 1, 1, 1, true];
addCamShake [3, _timeEffect, 1];

uisleep _timeEffect;

cutText ["OH LE BAD TRIP", "BLACK OUT", 1];
uisleep 1;
"ColorInversion" ppEffectEnable false;
"chromaberration" ppEffectEnable false;
"WetDistortion" ppEffectEnable false;
"radialblur" ppEffectEnable false;
enableCamShake false;
uisleep 2.5;
cutText ["OH LE BAD TRIP", "BLACK IN", 1];