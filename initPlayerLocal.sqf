_playerRole = roleDescription player;
//[] call CLIENT_fnc_supportPlayerAction;
//[_playerRole] call TOOLS_fnc_createArsenal; 
["supportPlayer"] remoteExec ["SERVER_fnc_updatePlayerAction", 2]; 



