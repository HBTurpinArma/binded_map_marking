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

_markerName = format ["_USER_DEFINED #%4/%5/%6 BMM_MARKER_%3_%1_%2" , str getPos (_player), time, (_player), clientOwner,0,BMM_PlaceSelfChannel]; 
_marker = createMarker [_markerName, _player];
_markerName setMarkerShape "ICON";
_markerName setMarkerDir (getDir (_player));
_markerName setMarkerType BMM_PlaceSelfIcon;

if (BMM_PlaceSelfColour == "BMM_SQUAD_COLOUR_AUTO") then {
	_groupColour = _playerGroupName call BMM_fnc_markerGetSquadColour;
	_markerName setMarkerColor _groupColour;
}else{
	_markerName setMarkerColor BMM_PlaceSelfColour;
};