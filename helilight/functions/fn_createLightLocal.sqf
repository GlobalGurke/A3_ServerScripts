params ["_vehicle"];
lightStatus = false;
lightAngle =
publicVariable "lightStatus";
publicVariable "lightAngle";

systemChat "CREATING LIGHT ACTUAL";

_vehicle addEventHandler ["GetIn", {
    params ["_vehicle", "_role", "_unit", "_turret"];
    systemChat format ["Player entered Vehicle: %1, Vehicle type %2, %3", _role, typeOf _vehicle, player];

    player addAction [
        "Suchscheinwerfer benutzen",
        {
            _light = missionNamespace getVariable ["lightStatus", false];
            if (_light) then {
                missionNamespace setVariable ["lightStatus", false];
                _light = false;
                // Stop light
            } else {
                missionNamespace setVariable ["lightStatus", true];
                _light = true;

                // Arrow
                private _arrow = "Sign_Arrow_Direction_Cyan_F" createVehicle [0, 0, 0];
                _arrow attachTo [player, [0, 0, 1], "head"];

                // Create light
                private _reflector = "#lightreflector" createVehicleLocal [0, 0, 0];
                _reflector attachTo [player, [0, 0, 5], "head"];
                _reflector setLightColor [1, 1, 1];
                _reflector setLightIntensity 10000000;
                _reflector setLightConePars [30, 70, 1];
                _reflector setLightUseFlare true;
                _reflector setLightFlareSize 5;
                _reflector setLightFlareMaxDistance 500;
                private _vector3D = [[[0, 1, 0], [0, 0, 1]], 0, 0, 0] call BIS_fnc_transformVectorDirAndUp;
                _reflector setVectorDirAndUp _vector3D;

                while {_light} do {
                    // light on

                    private _vector3D = [[vectorNormalized vectorDir player, [0,0,1]], getDir player] call BIS_fnc_transformVectorDirAndUp;
                    _arrow setVectorDirAndUp _vector3D;
                    //_reflector setVectorDirAndUp _vector3D;
                    _reflector lightAttachObject[player, [0, 0, 3]];
                    sleep 0.01;
                };
            };
        }
    ];
}];
