
private _pos = getMarkerPos "CENTER";
systemChat format["POS: %1", _pos]; 
systemChat "CREATING ZONE MARKER 1";
_zone = createMarker ["ZONE1", _pos];
"ZONE1" setMarkerShape "ELLIPSE";
"ZONE1" setMarkerSize [1000, 1000];
"ZONE1" setMarkerBrush "DiagGrid";
"ZONE1" setMarkerAlpha 1.0; 
"ZONE1" setMarkerColor "ColorCIV";

