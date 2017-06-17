_object = param [0, objNull];
_brightness = param [1, 0.5];
_color = param [2, [1, 1, 1]];
_relPosition = param [3,  [0, 0, 0]]; // relative to player: right, front, up

_light = "#lightpoint" createVehicleLocal (getPos _object);
_light setLightBrightness _brightness;
_light setLightAmbient _color;
_light setLightColor _color;
_light lightAttachObject [_object, _relPosition];
// _light attachTo [_object, _relPosition];

_light;
