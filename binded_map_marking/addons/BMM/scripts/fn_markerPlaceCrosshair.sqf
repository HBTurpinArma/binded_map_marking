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

_player = _this select 0;
_playerGroupName = groupId group _player;

_itemFound = False;
{ 
	if (_x in items _player || _x in assignedItems _player) then {_itemFound = True;}; 
} forEach BMM_DeviceArray;
if (_itemFound == False) exitWith {};

_markerName = format ["_USER_DEFINED #%4/%5/%6 BMM_MARKER_%3_%1_%2" , str getPos (_player), time, (_player), clientOwner,0,BMM_PlaceCrosshairChannel]; 
_marker = createMarker [_markerName, screenToWorld [0.5, 0.5]];
_markerName setMarkerShape "ICON";
_markerName setMarkerType BMM_PlaceCrosshairIcon;

if (BMM_PlaceCrosshairColour == "BMM_SQUAD_COLOUR_AUTO") then {
	_groupColour = _playerGroupName call BMM_fnc_markerGetSquadColour;
	_markerName setMarkerColor _groupColour;
}else{
	_markerName setMarkerColor BMM_PlaceCrosshairColour;
};