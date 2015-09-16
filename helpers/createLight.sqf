_object = _this select 0;
_brightness = _this select 1;
_color = _this select 2;

_light = "#lightpoint" createVehicleLocal (getPos _object);
_light setLightBrightness _brightness;
_light setLightAmbient _color;
_light setLightColor _color;
_light lightAttachObject [_object, [0,0,0]];