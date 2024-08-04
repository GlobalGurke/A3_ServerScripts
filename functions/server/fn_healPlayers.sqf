/*
	Author: GlobalGurke

	Description:
		Heal players around a trigger Area

	Parameter(s):
			<object> - trigger, get with thisTrigger in init field of Trigger
	Returns:
		nothing

	Examples:
		[thisTrigger] call SERVER_fnc_healPlayers;
*/
params ["_trigger"];
_playersInArea = allplayers select {_x inArea _trigger}; 
{
	private _player = _x; 
	/*
	[_player] remoteExec ["CLIENT_fnc_healPlayerLocal", owner _player];
	*/
	[_player] remoteExec ["ace_medical_treatment_fnc_fullHealLocal", 0];
	["Du wurdest geheilt!"] remoteExec ["systemChat", owner _player];
} forEach _playersInArea;