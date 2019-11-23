#define ADDON MIRA_ACE_Medical_Notification
#define ADDON_NAME Ace Medical Menu Notification
#define FUNC(name) ADDON##_fnc_##name
#define ICON_PATH(name) ADDON\ui\##name##.paa
#define QUOTE(target) #target
#define CONCAT(a,b) a##b
#define COMPILE_FILE(name) compile preprocessFileLineNumbers 'ADDON\##name##.sqf'
#define GVAR(name) ADDON##_##name