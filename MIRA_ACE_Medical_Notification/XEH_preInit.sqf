#include "functions\function_macros.hpp"
_category = "RD501 Medical Notification";
[QUOTE(GVAR(Enabled)), 
	"CHECKBOX", 
	[
		"Enabled", 
		"Enable/Disable sending of messages (does not effect received)"
	], 
	_category, 
	call {profileNamespace getVariable [QUOTE(GVAR(Enabled)), true]}, 
	0
] call cba_settings_fnc_init;
[QUOTE(GVAR(Message)), 
	"EDITBOX",
	[
		"Message", 
		"Message to show to other players, keep it clean. %1 is used as a placeholder for your name."
	],
	_category,
	call {profileNamespace getVariable [QUOTE(GVAR(Message)), "%1 is asking that you kindly hold still."]}
 ] call cba_settings_fnc_init;
 [QUOTE(GVAR(ShowToSelf)), 
	"CHECKBOX", 
	[
		"Show Message to Self", 
		"Enable/Disable message being sent to you when you use self medical (can use for testing)"
	], 
	_category, 
	call {profileNamespace getVariable [QUOTE(GVAR(Enabled)), true]}, 
	0
] call cba_settings_fnc_init;
 LOG("Settings Added");