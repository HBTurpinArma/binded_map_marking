/* =================================================
*   Author: HBTurpin
*
*	Params:
*	None
*
*	Returns:
*	Nothing
*
* =================================================*/
#include "\a3\ui_f\hpp\definedikcodes.inc"
if (isDedicated) exitWith {};
sleep 1;

// CBA Settings
[
	"BMM_Devices", "EDITBOX", 
	["GPS Device List", "Enter list of devices to be considered a GPS. Example: [""ItemGPS"",""B_UavTerminal""]"], 
	["Binded Map Marking"], 
	"[""ItemGPS"",""B_UavTerminal"",""O_UavTerminal"",""I_UavTerminal"",""C_UavTerminal"",""I_E_UavTerminal"",""ItemcTab"",""ItemAndroid"",""ItemMicroDAGR"",""ACE_DAGR"",""ACE_microDAGR""]",
	0, 
	{BMM_DeviceArray = parseSimpleArray _this;}
] call cba_settings_fnc_init;

[
	"BMM_Rangefinders", "EDITBOX", 
	["GPS Device List", "Enter list of devices to be considered a Rangefinder. Example: [""ItemGPS"",""B_UavTerminal""]"], 
	["Binded Map Marking"], 
	"[""rangefinders""]",
	0, 
	{BMM_DeviceArray = parseSimpleArray _this;}
] call cba_settings_fnc_init;

[
	"BMM_PlaceCrosshairEnabled", "LIST", 
	["Enabled", "Select whether each feature should be enabled or not."], 
	["Binded Map Marking", "Crosshair Marker"], 
	[[0,1,2], ["Disabled", "Enabled", "Enabled - Requires Rangefinders"], 0],, 
] call cba_settings_fnc_init;


_colours = ["BMM_SQUAD_COLOUR_AUTO"];
_colourNames = ["Squad Colour [Automatic]"];
_cfgNames = ["BMM_SQUAD_COLOUR_AUTO"];
{
	private _cfgName = configName _x;
	private _colourName = getText (_x >> "name");
	private _colour = getArray (_x >> "color") call BIS_fnc_colorConfigToRGBA;
	_cfgNames pushback _cfgName;
	_colourNames pushback format["%1 [%2]", _colourName, _cfgName];
    _colours pushback _colour;
} forEach configProperties [configFile >> "CfgMarkerColors"];
["BMM_PlaceSelfColour", "LIST", ["Marker Colour", "Select the Marker Colour"], ["Binded Map Marking", "Self Marker"], [_cfgNames, _colourNames, 1]] call cba_settings_fnc_init;
["BMM_PlaceCrosshairColour", "LIST", ["Marker Colour", "Select the Marker Colour"], ["Binded Map Marking", "Crosshair Marker"], [_cfgNames, _colourNames, 1]] call cba_settings_fnc_init;
["BMM_PlaceSquadColour", "LIST", ["Marker Colour", "Select the Marker Colour"], ["Binded Map Marking", "Squad Marker"], [_cfgNames, _colourNames, 1]] call cba_settings_fnc_init;

_markerNames = [];
_markers = [];
_markersSelf = ["mil_box"];
_markerNamesSelf = ["Default [mil_box]"];
_markersCrosshair = ["mil_dot"];
_markerNamesCrosshair = ["Default [mil_dot]"];
_markersSquad = ["b_inf"];
_markerNamesSquad = ["Default [b_inf]"];
{
	private _marker = configName _x;
	private _markerName = getText (_x >> "name");
    _markers pushback _marker;
    _markerNames pushback format["%1 [%2]", _markerName, _marker];
	_markersSelf pushback _marker;
    _markerNamesSelf pushback format["%1 [%2]", _markerName, _marker];
	_markersCrosshair pushback _marker;
    _markerNamesCrosshair pushback format["%1 [%2]", _markerName, _marker];
	_markersSquad pushback _marker;
    _markerNamesSquad pushback format["%1 [%2]", _markerName, _marker];
} forEach configProperties [configFile >> "CfgMarkers"];

["BMM_PlaceSelfIcon", "LIST", "Marker Icon", ["Binded Map Marking", "Self Marker"], [ _markersSelf, _markerNamesSelf, 0]] call cba_settings_fnc_init;
["BMM_PlaceCrosshairIcon", "LIST", "Marker Icon", ["Binded Map Marking", "Crosshair Marker"], [_markersCrosshair, _markerNamesCrosshair, 0]] call cba_settings_fnc_init;
["BMM_PlaceSquadIcon", "LIST", "Marker Icon", ["Binded Map Marking", "Squad Marker"], [_markersSquad, _markerNamesSquad, 0]] call cba_settings_fnc_init;

_ids = [0,1,2,3,4,5];
_channels = ["Global","Side","Command","Group","Vehicle", "Direct"];
["BMM_PlaceSelfChannel", "LIST", "Marker Channel", ["Binded Map Marking", "Self Marker"], [_ids, _channels, 3]] call cba_settings_fnc_init;
["BMM_PlaceCrosshairChannel", "LIST", "Marker Channel", ["Binded Map Marking", "Crosshair Marker"], [_ids, _channels, 3]] call cba_settings_fnc_init;
["BMM_PlaceSquadChannel", "LIST", "Marker Channel", ["Binded Map Marking", "Squad Marker"], [_ids, _channels, 1]] call cba_settings_fnc_init;


// Control Settings
["Binded Map Marking","BMM_PlaceSelf",["Place Marker on Self"],"",{[player] spawn BMM_fnc_markerPlaceSelf},[DIK_INSERT,[false,false,false]],false,0,false] call cba_fnc_addKeybind;
["Binded Map Marking","BMM_PlaceCrosshair",["Place Marker on Crosshair"],"",{[player] spawn BMM_fnc_markerPlaceCrosshair},[DIK_HOME,[false,false,false]],false,0,false] call cba_fnc_addKeybind;
["Binded Map Marking","BMM_PlaceSquadPosition",["Place/Move Squad Marker"],"",{[player] spawn BMM_fnc_markerPlaceSquad},[DIK_END,[false,false,false]],false,0,false] call cba_fnc_addKeybind;




