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