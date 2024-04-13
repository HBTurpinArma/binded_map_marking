#include "config_macros.hpp"

class CfgPatches {
	class ADDON {
		name=ADDON_NAME;
		author="HBTurpin";
		authors[]={"HBTurpin"};
		url="";
		version="1.0";
		requiredAddons[]= {"A3_Functions_F"};
		units[]={};
		weapons[]={};
		worlds[]={};
	};
};
class CfgFunctions {
	class ADDON {
		class BMM_Functions {
			tag = QUOTE(ADDON);
            file = FUNCTION_PATH;
			class markerInit {postInit=1;};
			class markerPlaceSelf {};
			class markerPlaceCrosshair {};
			class markerPlaceSquad {};
			class markerGetSquadColour {};
		};
	};
};