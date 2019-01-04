///scr_mv_tank(haxis,vaxis)
///param haxis
///param vaxis

var lhaxis = argument0;
var lvaxis = argument1;

var input_spd = max_force*lvaxis;
var lt = 0;
var rt = 0;
//if(!scr_is_between(0,0.1,lvaxis) or !scr_is_between(0, 0.1,lhaxis)){
	//Move tank -> left thumbstick	
	//left track
var m1 = (-max_force + (input_spd*-sign(lhaxis)));
lt = m1*(lhaxis) + input_spd;

	//right trackS
var m2 = (max_force + (input_spd*-sign(lhaxis)));
rt = m2*(lhaxis) + input_spd;
	//move		
physics_apply_local_force(xos,-yos, -lt, yforce);
physics_apply_local_force(xos,yos, -rt , yforce);