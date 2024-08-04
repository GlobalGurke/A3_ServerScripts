params["_action"];
// Aktion muss auf jedem client getriggered werden 
if (_action == "supportPlayer") then {
	systemChat "Executing Support Player Action"; 
	{
		[_x] remoteExec ["CLIENT_fnc_supportPlayerAction" , 0];   
	} forEach allPlayers; 
	
};