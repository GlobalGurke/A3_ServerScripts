params ["_vehicle"]; 

private _lightOn = false; 
systemChat "CREATING LIGHT";
private _toggleLight = {
	 if (_lightOn) then { 
		// Remove Light 
	} else {
		systemChat "ADDING LIGHT";
		_lightOn = true; 
		private _reflector = "#lightreflector" createVehicleLocal [0, 0, 0];
		_reflector attachTo [player, [0, 0, 0], "light_l"];
		_reflector setLightColor [1, 1, 1];
		_reflector setLightIntensity 100000;
		_reflector setLightConePars [0, getDir player, 1];
		_reflector setLightUseFlare true;
		_reflector setLightFlareSize 5;
		_reflector setLightFlareMaxDistance 500;
		_reflector setLightBrightness 100;
		private _vector3D = [[[0, 1, 0], [0, 0, 1]], 0, 0, 0] call BIS_fnc_transformVectorDirAndUp;
		_reflector setVectorDirAndUp _vector3D;



	};
}; 


_vehicle addEventHandler["GetIn", {
	params ["_v ehicle", "_role", "_unit", "_turret"]; 
	systemChat format["Player entered Vehicle: %1 , Vehicletype %2, %3", _role, typeOf _vehicle, player ]; 
	player addAction[
		"Suchscheinwerfer benutzen",
		{
		
			private _reflector = "#lightreflector" createVehicleLocal [0, 0, 0];
			_reflector attachTo [player, [0, 0, 1.5], "head"];
			_reflector setLightColor [1, 1, 1];
			_reflector setLightIntensity 100000;
			_reflector setLightConePars [30, 70, 1];
			_reflector setLightUseFlare true;
			_reflector setLightFlareSize 5;
			_reflector setLightFlareMaxDistance 500;
			private _vector3D = [[[0, 1, 0], [0, 0, 1]], 0, 0, 0] call BIS_fnc_transformVectorDirAndUp;
			_reflector setVectorDirAndUp _vector3D;
			while {true} do {
			// Get the player's view direction
			_viewDir = eyeDirection player;
			
			// Calculate the position in front of the player's head
			_headPos = getPos player modelToWorld [0, 0, 1.5];  // Adjust the height if needed
			_lightPos = _headPos vectorAdd (_viewDir vectorMultiply 0.5);  // Adjust the distance if needed

			// Move the light to the calculated position
			_reflector setPos _lightPos;
			
			// Update the light direction to match the player's view direction
			_reflector setVectorDirAndUp [_viewDir, [0, 0, 1]];

			// Small delay to prevent performance issues
			sleep 0.01;
		};
		}
		
		];

}];
/*
private _reflector = "#lightreflector" createVehicleLocal [0, 0, 0];
_reflector attachTo [_vehicle, [-1, 0, -1], "light_l"];
_reflector setLightColor [1, 1, 1];
_reflector setLightAmbient [0.5, 0.5, 0.5];
_reflector setLightIntensity 250000;
_reflector setLightConePars [70, 10, 1];
_reflector setLightUseFlare true;
_reflector setLightFlareSize 5;
_reflector setLightFlareMaxDistance 500;
_reflector setLightBrightness 1000;
private _vector3D = [[[0, 1, 0], [0, 0, 1]], 10, -45, 0] call BIS_fnc_transformVectorDirAndUp;
_reflector setVectorDirAndUp _vector3D;


private _reflector = "#lightreflector" createVehicleLocal [0, 0, 0];
_reflector attachTo [_vehicle, [1, 0, -1], "light_l"];
_reflector setLightColor [1, 1, 1];
_reflector setLightAmbient [0.5, 0.5, 0.5];
_reflector setLightIntensity 250000;
_reflector setLightConePars [70, 10, 1];
_reflector setLightUseFlare true;
_reflector setLightFlareSize 5;
_reflector setLightFlareMaxDistance 500;
_reflector setLightBrightness 1000;
private _vector3D = [[[0, 1, 0], [0, 0, 1]], -10, -45, 0] call BIS_fnc_transformVectorDirAndUp;
_reflector setVectorDirAndUp _vector3D;


private _reflector = "#lightreflector" createVehicleLocal [0, 0, 0];
_reflector attachTo [_vehicle, [0, 2.5, -0.5], "light_l"];
_reflector setLightColor [1, 1, 1];
_reflector setLightAmbient [0.5, 0.5, 0.5];
_reflector setLightIntensity 250000;
_reflector setLightConePars [70, 10, 1];
_reflector setLightUseFlare true;
_reflector setLightFlareSize 5;
_reflector setLightFlareMaxDistance 500;
_reflector setLightBrightness 1000;
private _vector3D = [[[0, 1, 0], [0, 0, 1]], 0, -10, 0] call BIS_fnc_transformVectorDirAndUp;
_reflector setVectorDirAndUp _vector3D;*/
 