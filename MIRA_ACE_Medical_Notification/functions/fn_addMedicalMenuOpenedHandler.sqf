#include "function_macros.hpp"
#define MAX_RATE_SECONDS 1
#define DEFAULT_MESSAGE "%1 is asking that you kindly hold still."
if(!hasInterface || !local this || isServer) exitWith{};
GVAR(lastMessageTime) = 0;
_id = ["ace_medicalMenuOpened", {
		params["_player", "_target", ""];
		if(_player == _target) exitWith {};
		if(GVAR(lastMessageTime) - time < MAX_RATE_SECONDS) exitWith {
			LOG("Rate Limited");
		};
		_name = [_player] call ace_common_fnc_getName;
		if(isNil QUOTE(GVAR(Message)) || GVAR(Message) == "") then {
			GVAR(Message) = DEFAULT_MESSAGE;
		};
		["ace_common_displayTextStructured", [format[GVAR(Message), _name], 2, _target], [_target]] call CBA_fnc_targetEvent;
		LOG("Sent message '" + str GVAR(Message) + "' to " + str _player);
		GVAR(lastMessageTime) = time;
	}
] call CBA_fnc_addEventHandler;

LOG(format["Registered and loaded for '%1'", [this] call ace_common_fnc_getName]);