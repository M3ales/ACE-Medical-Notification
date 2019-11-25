#define ADDON RD501_MedNotif
#define ADDON_NAME Ace Medical Menu Notification [RD501]
#define FUNC(name) RD501##_fnc_##name
#define ICON_PATH(name) ADDON\ui_icons\##name##.paa
#define QUOTE(target) #target
#define CONCAT(a,b) a##b
#define COMPILE_FILE(name) compile preprocessFileLineNumbers 'RD501_main\##name##.sqf'
#define GVAR(name) ADDON##_##name