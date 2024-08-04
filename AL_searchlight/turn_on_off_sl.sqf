params ["_veh_armed"];

if (player != gunner _veh_armed) exitwith {};
[_veh_armed,["click_sl",10]] remoteExec ["say3d"];
if (_veh_armed getVariable "search_lit_ON") then {_veh_armed setVariable ["search_lit_ON",false,true]} else {_veh_armed setVariable ["search_lit_ON",true,true]};