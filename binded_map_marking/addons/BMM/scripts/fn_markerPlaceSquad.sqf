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

_markerName = format ["_USER_DEFINED BMM_SQUAD_MARKER_%1" , _playerGroupName]; 
deleteMarker _markerName;
_marker = createMarker [_markerName, _player];
_markerName setMarkerText _playerGroupName;
_markerName setMarkerShape "ICON";
_markerName setMarkerType BMM_PlaceSquadIcon;

if (BMM_PlaceSquadColour == "BMM_SQUAD_COLOUR_AUTO") then {
	_groupColour = _playerGroupName call BMM_fnc_markerGetSquadColour;
	_markerName setMarkerColor _groupColour;
}else{
	_markerName setMarkerColor BMM_PlaceSquadColour;
};