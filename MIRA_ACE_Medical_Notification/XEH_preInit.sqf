#include "functions\function_macros.hpp"
[QUOTE(GVAR(Message)), 
	"EDITBOX",
	[
		"Message", 
		"Message to show to other players, keep it clean. %1 is used as a placeholder for your name."
	],
	"Mira ACE Medical Menu",
	call {profileNamespace getVariable [QUOTE(GVAR(Message)), "%1 is asking that you kindly hold still."]}
 ] call cba_settings_fnc_init;
 LOG("Settings Added");