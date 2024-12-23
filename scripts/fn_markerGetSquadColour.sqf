/* =================================================
*   Author: HBTurpin
*
*	Params:
*	Group Name (string)
*
*	Returns:
*	cfgMarkerColors Name (string)
* 
* =================================================*/

_return = "default";
{
	_cfgName = configName _x; 
	_colourName = getText (_x >> "name"); 
	if (toLower _colourName == toLower _this) then {
		_return = _cfgName;
	};
} forEach configProperties [configFile >> "CfgMarkerColors"];

_return

