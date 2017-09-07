#define ST_LEFT           0x00
#define ST_MULTI          0x10
#define GUI_GRID_CENTER_WAbs        ((safezoneW / safezoneH) min 1.2)
#define GUI_GRID_CENTER_HAbs        (GUI_GRID_CENTER_WAbs / 1.2)
#define GUI_GRID_CENTER_W        (GUI_GRID_CENTER_WAbs / 40)
#define GUI_GRID_CENTER_H        (GUI_GRID_CENTER_HAbs / 25)
#define GUI_GRID_CENTER_X        (safezoneX + (safezoneW - GUI_GRID_CENTER_WAbs)/2)
#define GUI_GRID_CENTER_Y        (safezoneY + (safezoneH - GUI_GRID_CENTER_HAbs)/2)

/*class RscProgress
{
    type = 8;
    style = 0;
    colorFrame[] = {0,0,0,1};
    colorBar[] = {1,1,1,1};
    texture = "#(argb,8,8,3)color(1,1,1,1)";
    w = 1;
    h = 0.03;
};
class CTFCapture
{
    idd = 10;
    onLoad = "uiNamespace setVariable ['CTFCapture_drp',_this select 0]";
    class Controls
    {
        class Progress: RscProgress
        {
            idc = 11;
            x = 0;
            y = 0.3;
        };
    };
};*/

/*class RscProgress
{
    type = 8;
    style = 0;
    x = 0;
    y = 0.94;
    w = 1;
    h = 0.06;
    texture = "";
    shadow = 2;
    colorFrame[] = {0, 0, 0, 1};
    colorBackground[] = {0,0,0,0.7};
    colorBar[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
};

class CTFCapture
{
    idd = 10;
    onLoad = "uiNamespace setVariable ['CTFCapture_drp',_this select 0]";
    class Controls
    {
        class Progress: RscProgress
        {
            idc = 25;
            x = 0;
            y = 0.94;
        };
    };
};*/

class RscProgress
{
    type = 8;
    style = 0;
    colorFrame[] = {0,0,0,1};
    colorBar[] = {1,1,1,1};
    texture = "#(argb,8,8,3)color(1,1,1,1)";
    w = 1;
    h = 0.03;
};
class CTFCapture
{
    idd = 10;
    onLoad = "((_this select 0) displayCtrl -1) progressSetPosition 0.5; uiNamespace setVariable ['CTFCapture_drp',_this select 0]";
    class Controls
    {
        class Progress: RscProgress
        {
            idc = 25;
            x = 0;
            y = 0.3;
        };
    };
};