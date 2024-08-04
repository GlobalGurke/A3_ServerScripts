private ["_object_with_searchlight","_obiect_search","_veh_turr_end"];

if (!isServer) exitWith {}; 

_object_with_searchlight = _this select 0;

_veh_turr_beg = getText (configfile >> "CfgVehicles" >> (typeOf _object_with_searchlight) >> "Turrets" >> "MainTurret" >> "gunBeg");
_veh_turr_end = getText (configfile >> "CfgVehicles" >> (typeOf _object_with_searchlight) >> "Turrets" >> "MainTurret" >> "gunEnd");

if (!isNil{_object_with_searchlight getVariable "activ"}) exitWith {};
_object_with_searchlight setVariable ["activ",true,true];

if (_object_with_searchlight isKindOf "air") then {
	_object_with_searchlight setVariable ["search_lit_ON",true,true];
	_object_with_searchlight addAction ["Toggle Search Light","AL_searchlight\turn_on_off_sl_heli.sqf","",0,false,true,"","",15,false];
	[[_object_with_searchlight],"AL_searchlight\al_search_effect_heli.sqf"] remoteExec ["execVM",0,true];
} else {
	_obiect_lit = createVehicle ["Sign_Sphere10cm_F", [0,0,0]]; _obiect_lit setObjectTextureGlobal [0,"#(argb,8,8,3)color(0,0,0,0,ca)"]; _obiect_lit attachTo [_object_with_searchlight, [0,0,-0.2], _veh_turr_end];
	_obiect_comp = createSimpleObject ["A3\data_f\VolumeLight_searchLight.p3d",[0,0,0]]; _obiect_comp hideObjectGlobal true; _obiect_comp attachTo [_obiect_lit, [0,-2,0]];
	[[_object_with_searchlight,_obiect_lit,_obiect_comp],"AL_searchlight\al_search_light_effect.sqf"] remoteExec ["execVM",0,true];

	while {alive _object_with_searchlight} do 
	{
		waitUntil {sleep 0.1; _object_with_searchlight getVariable "search_lit_ON"};
		_obiect_lit hideObjectGlobal false;	_obiect_comp hideObjectGlobal false;
		waitUntil {sleep 0.1; !(_object_with_searchlight getVariable "search_lit_ON")};
		_obiect_lit hideObjectGlobal true; _obiect_comp hideObjectGlobal true;
	};
	deleteVehicle _obiect_lit; deleteVehicle _obiect_comp;
};