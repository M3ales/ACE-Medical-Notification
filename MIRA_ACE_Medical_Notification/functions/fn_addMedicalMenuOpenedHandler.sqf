#include "function_macros.hpp"
#define MAX_RATE_SECONDS 1
#define DEFAULT_MESSAGE "%1 is asking that you kindly hold still."
if(!hasInterface || !local this || isServer) exitWith{};
GVAR(lastMessageTime) = 0;
_id = ["ace_medicalMenuOpened", {
		params["_player", "_target", ""];
		if(_player == _target) exitWith {};
		if(time - GVAR(lastMessageTime) < MAX_RATE_SECONDS) exitWith {
			LOG("Rate Limited");
		};
		if(isNil QUOTE(GVAR(Message)) || GVAR(Message) == "") then {
			LOG(format["Message not initialised, setting to default ('%1')", DEFAULT_MESSAGE]);
			GVAR(Message) = DEFAULT_MESSAGE;
		};
		_name = [_player] call ace_common_fnc_getName;
		_targetName = [_target] call ace_common_fnc_getName;
		if(_target getVariable["ACE_Unconscious", false]) exitWith {
			LOG(format["%1 is unconscious, ignoring", _targetName]);
		};
		if([_target] call ace_common_fnc_isMedic) then
		{
			LOG(format["Displaying Medic Message to %1", _targetName]);
			_text = format[GVAR(Message), _name];
			_image = QUOTE(ICON_PATH(medical_emblem));
			_textHTML = format["<t align='center'>%1</t>", _text];
			_result = composeText [parseText format["<img size='2' align='center' color='%2' image='%1'/>", _image, [1,1,1] call BIS_fnc_colorRGBtoHTML], lineBreak, _text];
			["ace_common_displayTextStructured", [_result, 2, _target], [_target]] call CBA_fnc_targetEvent;
		}else
		{
			LOG(format["Displaying Non Medic Message to %1", _targetName]);
			["ace_common_displayTextStructured", [format[GVAR(Message), _name], 2, _target], [_target]] call CBA_fnc_targetEvent;
		};
		GVAR(lastMessageTime) = time;
	}] call CBA_fnc_addEventHandler;

LOG(format["Registered and loaded for '%1'", this call ace_common_fnc_getName]);