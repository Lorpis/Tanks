///get_range(vertical_deg, velocity,  barrel_height)
///@param vertical_deg 
///@param velocity
///@param barrel_height


//-17.7 m/s = 17.7 m/s + (-9.8 m/s/s)•t

var barrel_height = argument2
var vertical_deg = argument0
var velocity = argument1
var velocity_y = velocity*dsin(vertical_deg);
var velocity_x = velocity*dcos(vertical_deg);

//time = b+/-sqrt(b^2 -4ac) / 2a
var a = (global.acc/2)*-1;
var b = velocity_y*-1;
var c = barrel_height*-1;

var flight_time = (b - sqrt(sqr(b) - (4*a*c)))/(2*a);
var range = flight_time * velocity_x*-1;

return range;