///scr_360(rotation)
///param rotation

var rotation = argument0;

rotation = rotation - floor(rotation/360)*360;
if(rotation == 360) {rotation = 0;}

return rotation