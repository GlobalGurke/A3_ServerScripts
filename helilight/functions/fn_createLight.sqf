params ["_vehicle"];
systemChat "CREATING LIGHT ACTUAL";
if (isServer) then {
    systemChat "I AM ON SERVER";
};
_vehicle addEventHandler ["GetIn", {
    params ["_vehicle", "_role", "_unit", "_turret"];
    systemChat format ["Player entered Vehicle: %1, Vehicle type %2, %3", _role, typeOf _vehicle, player];
    if (_role == "gunner" && (_unit getVariable["searchlightActionEnabled", -1]) == -1) then {
          _actionId = _unit getVariable["searlightActionEnabled", -1];
          systemChat format["ACTID: %1", _actionId];
          if (_actionId > -1) then {
                _unit removeAction _actionId;
          };
           _turretName = _vehicle weaponsTurret _turret;
            _unit setVariable["currentTurret", -1];
           _unit setVariable["currentTurret", _turretName select 0];
          _actionId = _unit addAction [
            "Suchscheinwerfer benutzen",
            {
             _turretName = player getVariable["currentTurret", -1];
            [player, true, _turretName] remoteExec ["HELILIGHT_fnc_toggleLight", 0];
            }
          ];
          systemChat format["setting action ID %1", _actionId];
          _unit setVariable["searlightActionEnabled", _actionId];
    };
}];

_vehicle addEventHandler ["GetOut", {
    params ["_vehicle", "_role", "_unit", "_turret", "_isEject"];
    _turretName = _vehicle weaponsTurret _turret select 0;

    [_unit, false, _turretName] remoteExec ["HELILIGHT_fnc_toggleLight", 0];
}];
