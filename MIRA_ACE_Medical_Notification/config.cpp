#include "config_macros.hpp"

class CfgPatches {
	class ADDON {
		name = ADDON_NAME;
		author = "M3ales";
		url = "https://github.com/M3ales/";
		requiredAddons[] = {"ace_medical", "ace_common"};
		units[] = {};
		weapons[] = {};
	};
};

class CfgFunctions {
	class ADDON {
        class MedicalMenuNotify {
            tag = "MIRA_ACE_Medical_Notify";
            requiredAddons[] = {"ace_medical", "ace_common"};
            file = QUOTE(CONCAT(ADDON,\functions));
            class addMedNotif {};
        };
	};
};

class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};

class Extended_Init_EventHandlers {
    class CAManBase {
        class ADDON {
            init = QUOTE(call FUNC(addMedicalMenuOpenedHandler));
        };
    };
};