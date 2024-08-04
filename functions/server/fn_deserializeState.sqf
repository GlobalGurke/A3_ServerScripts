params ["_target", "_data"];
systemChat format["DESERIALIZING to Player ", _data];
[_target, _data] remoteExec ["ace_medical_fnc_deserializeState", 0]; 